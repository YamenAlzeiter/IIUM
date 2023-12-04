<?php

namespace backend\controllers;

use common\models\Courses;
use common\models\Iiumcourse;
use common\models\Kcdio;
use common\models\Outbound;
use common\models\Poc;
use Yii;
use yii\web\Controller;
use yii\web\NotFoundHttpException;

class WorkflowController extends Controller
{
    public $layout = 'dean';

    public function beforeAction($action)
    {
        $ID = \Yii::$app->getRequest()->get('ID');
        $token = \Yii::$app->getRequest()->get('token');

        if ($action->id !== 'error' && !$this->isValidToken($ID, $token)) {
            throw new NotFoundHttpException('Invalid token. You do not have access to this page.');
        }

        return parent::beforeAction($action);
    }

    protected function isValidToken($ID, $token)
    {
        if ($ID === null || $token === null) {
            return false;
        }
        $model = $this->findModel($ID);

        return $model->token === $token;
    }

    public function actionView($ID)
    {

        return $this->render('view', ['model' => $this->findModel($ID),]);
    }

    protected function findModel($ID)
    {
        if (($model = Ob010::findOne(['ID' => $ID])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    public function actionViewFull($ID)
    {
        return $this->render('viewFull', ['model' => $this->findModel($ID)]);

    }

    public function actionCourseInfo($ID)
    {
        $student = Ob010::findOne($ID);
        $courses = Courses::find()
            ->where(['student_id' => $student->ID]) // Assuming 'id' is the primary key of the Ob010 model
            ->all();

        $iiumcourses = Iiumcourse::find()
            ->where(['student_id' => $student->ID]) // Assuming 'id' is the primary key of the Ob010 model
            ->all();

        return $this->render('courseInfo', ['model' => $this->findModel($ID), "courses" => $courses,
            'iiumcourses' => $iiumcourses,]);
    }

    public function actionDeanApproval($ID)
    {
        $modelKedio = new Kcdio();
        $modelPoc = new Poc();
        return $this->render('deanApproval', ['model' => $this->findModel($ID), 'modelKedio' => $modelKedio, 'modelPoc' => $modelPoc,]);
    }

    public function actionApprove($ID)
    {
        $model = $this->findModel($ID);

        // Check if the request method is POST
        if ($this->request->isPost) {
            // Get the value from the radio button (assuming it's in the POST data)
            $status = intval($this->request->post('status')); // Use 'status' as the input name

            // Update the Status attribute and save the model
            $model->Status = $status;
            $model->token = null;
            if ($model->save()) {
                // Redirect to the view page or another appropriate page

            }
        }
    }

    /**
     * @throws NotFoundHttpException
     */
    public function  actionReject($ID){
        $model = $this->findModel($ID);
        Yii::debug('Token in the model: ' . $model->token);
        // Check if the request method is POST
        if ($this->request->isPost) {
            // Get the value from the radio button (assuming it's in the POST data)
            $status = intval($this->request->post('status')); // Use 'status' as the input name
            $note = $this->request->post('reason');
            $message = $personInChargeId = $model->getAttribute('note-hod');
            // Update the Status attribute and save the model
            $model->Status = $status;
            $model->note_dean = $note;
            $model->token = null;
            Yii::debug('Token after updating: ' . $model->token);
            if ($model->save()) {

            }
        }}
}
