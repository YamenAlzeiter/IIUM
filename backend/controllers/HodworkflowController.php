<?php

namespace backend\controllers;

use common\models\Courses;
use common\models\Iiumcourse;
use common\models\Kcdio;
use common\models\Outbound;
use common\models\Poc;
use common\models\Status;
use Yii;
use yii\base\ActionFilter;
use yii\web\Controller;
use yii\web\NotFoundHttpException;


class HodworkflowController extends Controller
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
            throw new NotFoundHttpException("The Applicant $model->Name has already been Processed, Current Applicant Status: $statusModel->status");

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

    protected function findModel($ID)
    {
        if (($model = Outbound::findOne(['ID' => $ID])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    public function actionView($ID)
    {
        $model = $this->findModel($ID);

        $student = Outbound::findOne($ID);
        $courses = Courses::find()->where(['student_id' => $student->ID]) // Assuming 'id' is the primary key of the Ob010 model
            ->all();

        $iiumcourses = Iiumcourse::find()->where(['student_id' => $student->ID]) // Assuming 'id' is the primary key of the Ob010 model
            ->all();

        return $this->render('view', [
            'model' => $model, "courses" => $courses, 'iiumcourses' => $iiumcourses,
        ]);
    }

    public function actionViewFull($ID)
    {
        return $this->render('viewFull', ['model' => $this->findModel($ID)]);

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
            Yii::debug('Token after updating: '.$model->token);
            if ($model->save()) {
                return $this->redirect(['view', 'ID' => $model->ID, 'token' => $model->token],);
            }
        }
    }


    public function actionReject($ID)
    {
        $model = $this->findModel($ID);
        Yii::debug('Token in the model: '.$model->token);
        // Check if the request method is POST
        if ($this->request->isPost) {
            // Get the value from the radio button (assuming it's in the POST data)
            $status = intval($this->request->post('status')); // Use 'status' as the input name
            $note = $this->request->post('reason');

            // Update the Status attribute and save the model
            $model->Status = $status;
            $model->Note_hod = $note;
            $model->token = null;

            Yii::debug('Token after updating: '.$model->token);
            if ($model->save()) {
                return $this->redirect(['view', 'ID' => $model->ID, 'token' => $model->token],);
            }
        }
    }

    public function actionDownload($ID, $file)
    {
        $filePath = 'C:\xampp\htdocs\IIUM_Inbound_Oubbound\frontend\uploads/'.$file;
        Yii::info("File Path: ".$filePath, "fileDownload");
        if (file_exists($filePath)) {
            Yii::$app->response->sendFile($filePath);
        } else {
            Yii::info("File not found: ".$file, "fileDownload");
            throw new NotFoundHttpException('The file does not exist.');
        }
    }
}
