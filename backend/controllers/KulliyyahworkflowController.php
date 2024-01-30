<?php

namespace backend\controllers;

use backend\controllers\commonController\WorkflowCommonController;
use common\models\Courses;
use common\models\Iiumcourse;
use common\models\Inbound;
use Yii;
use yii\web\NotFoundHttpException;
use yii\web\Response;

/**
 * KulliyyahworkflowController implements the controller for managing Kulliyyah workflows.
 * This controller extends WorkflowCommonController to inherit common workflow functionalities.
 *
 * @package backend\controllers
 */
class KulliyyahworkflowController extends WorkflowCommonController
{
    /**
     * Displays the view for a specific model.
     * @param  int  $ID  the ID of the model to be displayed
     * @return string the rendered view
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($ID)
    {
        $model = $this->findModel($ID);

        return $this->render('view', ['model' => $model]);
    }
    /**
     * Finds the model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param  int  $ID  the ID of the model to be found
     * @return Inbound the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($ID)
    {
        if (($model = Inbound::findOne(['ID' => $ID])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    /**
     * Displays the full view info of a model.
     *
     * @param  int  $ID  The ID of the model to display.
     * @return string The rendering result.
     */
    public function actionViewFull($ID)
    {
        return $this->render('viewFull', ['model' => $this->findModel($ID)]);
    }

    public function actionCourseInfo($ID)
    {
        $student = Inbound::findOne($ID);
        $courses = Courses::find()->where(['student_id' => $student->ID])->all();

        $iiumcourses = Iiumcourse::find()->where(['student_id' => $student->ID])->all();

        return $this->render('courseInfo', [
            'model' => $this->findModel($ID), "courses" => $courses, 'iiumcourses' => $iiumcourses,
        ]);
    }
    /**
     * Approves a specific model.
     * @param  int  $ID  the ID of the model to be approved
     * @return Response the response object
     */
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

    /**
     * Rejects a specific model.
     * @param  int  $ID  the ID of the model to be rejected
     * @return Response the response object
     */
    public function actionReject($ID)
    {
        $model = $this->findModel($ID);
        Yii::debug('Token in the model: '.$model->Token);
        // Check if the request method is POST
        if ($this->request->isPost) {
            // Get the value from the radio button (in post data)
            $status = intval($this->request->post('status'));
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
