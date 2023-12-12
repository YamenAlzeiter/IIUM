<?php

namespace backend\controllers;

use common\models\Courses;
use common\models\Iiumcourse;
use common\models\Kcdio;
use common\models\Inbound;
use common\models\Poc;
use common\models\Status;
use Yii;
use yii\web\NotFoundHttpException;


class KulliyyahworkflowController extends \yii\web\Controller
{
    public $layout = 'blank';

    public function beforeAction($action)
    {

        $ID = Yii::$app->getRequest()->get('ID');
        $token = Yii::$app->getRequest()->get('token');

        if ($action->id !== 'error' && !$this->isValidToken($ID, $token)) {

            $model = $this->findModel($ID);
            $statusModel = Status::findOne($model->Status);


            $this->layout = 'main';
            throw new NotFoundHttpException("The Applicant $model->Name has already been Processed, Current Applicant Status: $statusModel->description");
        }

        return parent::beforeAction($action);
    }

    protected function isValidToken($ID, $token)
    {
        if ($ID === null || $token === null) {
            return false;
        }
        $model = $this->findModel($ID);

        return $model->Token === $token;
    }

        public function actionView($ID)
    {
        $model = $this->findModel($ID);

            return $this->render('view', ['model' => $model]);
    }

    protected function findModel($ID)
    {
        if (($model = Inbound::findOne(['ID' => $ID])) !== null) {
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
        $student = Inbound::findOne($ID);
        $courses = Courses::find()
            ->where(['student_id' => $student->ID]) // Assuming 'id' is the primary key of the Ob010 model
            ->all();

        $iiumcourses = Iiumcourse::find()
            ->where(['student_id' => $student->ID]) // Assuming 'id' is the primary key of the Ob010 model
            ->all();

        return $this->render('courseInfo', ['model' => $this->findModel($ID), "courses" => $courses,
            'iiumcourses' => $iiumcourses,]);
    }

    public function actionHodApproval($ID)
    {
        $modelKedio = new Kcdio();
        $modelPoc = new Poc();
        return $this->render('kulliyyahApproval', ['model' => $this->findModel($ID), 'modelKedio' => $modelKedio, 'modelPoc' => $modelPoc,]);
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
            $model->Token = null;
            Yii::debug('Token after updating: '.$model->Token);
            if ($model->save()) {
                return $this->redirect(['view', 'ID' => $model->ID, 'token' => $model->Token],);
            }
        }
    }


    public function actionReject($ID)
    {
        $model = $this->findModel($ID);
        Yii::debug('Token in the model: '.$model->Token);
        // Check if the request method is POST
        if ($this->request->isPost) {
            // Get the value from the radio button (assuming it's in the POST data)
            $status = intval($this->request->post('status')); // Use 'status' as the input name
            $note = $this->request->post('reason');


            // Update the Status attribute and save the model
            $model->Status = $status;
            $model->note_kulliyyah = $note;
            $model->Token = null;
            Yii::debug('Token after updating: '.$model->Token);
            if ($model->save()) {
                return $this->redirect(['view', 'ID' => $model->ID, 'token' => $model->Token],);
            }
        }
    }
}
