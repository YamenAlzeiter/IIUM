<?php

namespace backend\controllers;

use backend\controllers\commonController\WorkflowCommonController;
use common\models\Courses;
use common\models\Iiumcourse;
use common\models\Outbound;
use Yii;
use yii\web\NotFoundHttpException;
use yii\web\Response;

/**
 * HodworkflowController implements the controller for managing HOD workflows.
 * This controller extends WorkflowCommonController to inherit common workflow functionalities.
 *
 * @package backend\controllers
 */
class HodworkflowController extends WorkflowCommonController
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

        // Retrieve courses related to the student
        $student = Outbound::findOne($ID);

        // Retrieve Host university courses related to the student
        $courses = Courses::find()->where(['student_id' => $student->ID])->all();

        // Retrieve IIUM courses related to the student
        $iiumcourses = Iiumcourse::find()->where(['student_id' => $student->ID])->all();

        // Render the view with the model and related data
        return $this->render('view', [
            'model' => $model, "courses" => $courses, 'iiumcourses' => $iiumcourses,
        ]);
    }

    /**
     * Finds the model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param  int  $ID  the ID of the model to be found
     * @return Outbound the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($ID)
    {
        if (($model = Outbound::findOne(['ID' => $ID])) !== null) {
            return $model;
        }

        // If the model cannot be found, throw a 404 HTTP exception
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

            // Get the value from the radio button (in post data)
            $status = intval($this->request->post('status'));

            // Update the Status attribute and save the model
            $model->Status = $status;

            //reset the token value
            $model->Token = null;

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

            //save the rejection message into note_hod
            $model->Note_hod = $note;

            //reset the token value
            $model->Token = null;

            if ($model->save()) {
                return $this->redirect(['view', 'ID' => $model->ID, 'token' => $model->Token],);
            }
        }
    }
}
