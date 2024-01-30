<?php

namespace backend\controllers;

use backend\controllers\commonController\WorkflowCommonController;
use common\models\Courses;
use common\models\Iiumcourse;
use common\models\Inbound;
use Yii;
use yii\web\NotFoundHttpException;
use yii\web\UploadedFile;

/**
 * HigherworkflowController implements the controller for managing higher-level workflows.
 * This controller extends WorkflowCommonController to inherit common workflow functionalities.
 *
 * @package backend\controllers
 */
class HigherworkflowController extends WorkflowCommonController
{

    /**
     * Handles the approval process for a model.
     *
     * @param  int  $ID  The ID of the model to approve.
     * @return mixed The response.
     */

    const STATUS_APPROVED = 35;

    /**
     * Displays a single model.
     *
     * @param  int  $ID  The ID of the model to display.
     * @return string The rendering result.
     * @throws NotFoundHttpException If the model is not found.
     */
    public function actionView($ID)
    {
        $model = $this->findModel($ID);

        return $this->render('view', ['model' => $model]);
    }

    /**
     * Finds the model based on the given ID.
     *
     * @param  int  $ID  The ID of the model to find.
     * @return mixed The found model.
     * @throws NotFoundHttpException If the model is not found.
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

    /**
     * Displays course information related to a model.
     *
     * @param  int  $ID  The ID of the model.
     * @return string The rendering result.
     */
//    public function actionCourseInfo($ID)
//    {
//        $student = Inbound::findOne($ID);
//        $courses = Courses::find()->where(['student_id' => $student->ID]) // Assuming 'id' is the primary key of the Ob010 model
//        ->all();
//
//        $iiumcourses = Iiumcourse::find()->where(['student_id' => $student->ID]) // Assuming 'id' is the primary key of the Ob010 model
//        ->all();
//
//        return $this->render('courseInfo', [
//            'model' => $this->findModel($ID), "courses" => $courses, 'iiumcourses' => $iiumcourses,
//        ]);
//    }

    public function actionApprove($ID)
    {
        // Find the model based on the provided ID
        $model = $this->findModel($ID);

        // Check if the request is a POST request
        if ($this->request->isPost) {
            // Set the status to the defined constant for approval
            $model->Status = self::STATUS_APPROVED;
            // Reset the token to null
            $model->Token = null;

            // Retrieve the uploaded offer letter file
            $model->offer_letter = UploadedFile::getInstance($model, 'offer_letter');

            // Check if the model is saved successfully and passes validation
            if ($model->save() && $model->validate()) {
                // Get the base upload path
                $baseUploadPath = Yii::getAlias('@common/uploads');

                // Check if an offer letter file is uploaded
                if ($model->offer_letter) {
                    // Generate a unique file name based on the model ID and current date
                    $creationYearLastTwoDigits = date('y', strtotime($model->created_at));
                    $fileName = $creationYearLastTwoDigits.'_'.$model->ID.'_offerLetter.'.$model->offer_letter->extension;

                    // Sanitize the file name to remove special characters
                    $inputName = preg_replace('/[^a-zA-Z0-9]+/', '_', $model->offer_letter->name);

                    // Construct the file path
                    $filePath = $baseUploadPath.'/'.$model->ID.'/'.$fileName;

                    // Create the directory if it does not exist
                    if (!file_exists(dirname($filePath))) {
                        mkdir(dirname($filePath), 0777, true);
                    }

                    // Save the uploaded file to the specified path
                    $model->offer_letter->saveAs($filePath);
                }
                // Redirect to the view page with updated model ID and token
                return $this->redirect(['view', 'ID' => $model->ID, 'token' => $model->Token]);
            }
        }
    }
}
