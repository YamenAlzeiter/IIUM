<?php

namespace backend\controllers;

use common\models\Courses;
use common\models\Iiumcourse;
use common\models\Kcdio;
use common\models\Inbound;
use common\models\Poc;
use common\models\Status;
use Yii;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;
use yii\web\UploadedFile;


class HigherworkflowController extends \yii\web\Controller
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

        if ($this->request->isPost) {
            $model->Status = 35;
            $model->Token = null;

            $model->offer_letter = UploadedFile::getInstance($model, 'offer_letter');

            if ($model->save() && $model->validate()) {
                $baseUploadPath = Yii::getAlias('@common/uploads');
                if ($model->offer_letter) {
                    // Assuming created_at is a timestamp field in your model
                    $creationYearLastTwoDigits = date('y', strtotime($model->created_at));

                    $fileName = $creationYearLastTwoDigits . '_' . $model->ID . '_offerLetter.' . $model->offer_letter->extension;

                    $inputName = preg_replace('/[^a-zA-Z0-9]+/', '_', $model->offer_letter->name);

                    $filePath = $baseUploadPath.'/'.$model->ID.'/'.$fileName;

                    if (!file_exists(dirname($filePath))) {
                        mkdir(dirname($filePath), 0777, true);
                    }

                    $model->offer_letter->saveAs($filePath);


                }
                    return $this->redirect(['view', 'ID' => $model->ID, 'token' => $model->Token],);
            }
        }
    }

    public function actionDownload($ID, $file)
    {
        $baseUploadPath = Yii::getAlias('@common/uploads');
        $filePath = $baseUploadPath.'/'.$ID .'/'.$file;
        Yii::info("File Path: ".$filePath, "fileDownload");
        if (file_exists($filePath)) {
            Yii::$app->response->sendFile($filePath);
        } else {
            Yii::info("File not found: ".$file, "fileDownload");
            throw new NotFoundHttpException('The file does not exist.');
        }
    }

}
