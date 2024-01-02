<?php

namespace frontend\controllers;


use common\models\Courses;
use common\models\Inbound;
use common\models\InCourses;
use Exception;
use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\web\UploadedFile;

/**
 * InboundController implements the CRUD actions for Inbound model.
 */
class InboundController extends Controller
{
    /**
     * @inheritDoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::class,
                'only' => ['index', 'create', 'upload','update'],
                'rules' => [
                    [
                        'actions' => ['index', 'create', 'upload', 'update'],
                        'allow' => true,
                        'matchCallback' => function ($rule, $action) {
                            $user = Yii::$app->user->identity->type;
                            return ($user === "I");
                        }
                    ],
                ],

            ],
        ];

    }


    /**
     * Lists all Inbound models.
     *
     * @return string
     */
    public function actionIndex()
    {

            $id = Yii::$app->user->id;
            $student = Inbound::findOne($id);

            if (!$student) {
                return $this->render('index', ['noRecord' => true]);
            }

            $courses = InCourses::find()->where(['student_id' => $student->ID])->all();

            return $this->render("index", [
                "model" => $student, "courses" => $courses,
            ]);
    }

    /**
     * Creates a new Inbound model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        //---layout progress---\\
        $this->layout = 'progressInbound';

        $id = Yii::$app->user->id;

        //-------------------------- Check if an Outbound record already exists for the provided ID--------------------------\\
        if (Inbound::findOne(['ID' => $id])) {
            //-------------- If a record is found, display an error message to the user and redirect to Index--------------\\
            Yii::$app->session->setFlash('error', "You already created an application.");
            return $this->redirect(['inbound/index']);
        }
        //--------------  Create a new Outbound record model and set its 'ID' attribute to be the same as the current User ID --------------\\
        $model = new Inbound(['ID' => Yii::$app->user->id]);

        //-------------- Create new instances for related course models --------------\\
        $coursesModel = new InCourses();
        //-------------- Define arrays to store data related to courses --------------\\
        $coursesData = [];



        if (Yii::$app->request->isPost) {
            try {
                //-------------- Begin a database transaction to ensure atomicity and consistency of database operations --------------\\
                $transaction = Yii::$app->db->beginTransaction();

                if ($model->load(Yii::$app->request->post())) {

                    $model->Passport = UploadedFile::getInstance($model, 'Passport');
                    $model->Latest_passport_photo = UploadedFile::getInstance($model, 'Latest_passport_photo');
                    $model->Latest_certified_academic_transcript = UploadedFile::getInstance($model, 'Latest_certified_academic_transcript');
                    $model->Confirmation_letter = UploadedFile::getInstance($model, 'Confirmation_letter');
                    $model->Sponsorship_letter = UploadedFile::getInstance($model, 'Sponsorship_letter');
                    $model->Recommendation_letter = UploadedFile::getInstance($model, 'Recommendation_Letter');
                    $model->English_certificate = UploadedFile::getInstance($model, 'English_certificate');

                    if ($this->request->post('saveWithoutValidation') === 'validate') {
                        // Set status to 10 only when the 'submit' button is clicked
                        $model->Status = 10;
                    }

                    if ($model->validate() && $model->save()) {
                        //-------------------- File Saving --------------------\\
                        $baseUploadPath = 'C:/xampp/htdocs/IIUM_Inbound_Oubbound/frontend/uploads';
                        if ($model->Passport) {

                            $creationYearLastTwoDigits = date('y', strtotime(date('Y-m-d H:i:s')));

                            $fileName = $creationYearLastTwoDigits . '_' . $model->ID . '_Passport.' . $model->Passport->extension;

                            $inputName = preg_replace('/[^a-zA-Z0-9]+/', '_', $model->Passport->name);

                            $model->Passport->saveAs($baseUploadPath . '/' . $fileName);
                        }
                        if ($model->Latest_passport_photo) {

                            $creationYearLastTwoDigits = date('y', strtotime(date('Y-m-d H:i:s')));

                            $fileName = $creationYearLastTwoDigits . '_' . $model->ID . '_LatestPassportPhoto.' . $model->Latest_passport_photo->extension;

                            $inputName = preg_replace('/[^a-zA-Z0-9]+/', '_', $model->Latest_passport_photo->name);

                            $model->Latest_passport_photo->saveAs($baseUploadPath . '/' . $fileName);
                        }
                        if ($model->Latest_certified_academic_transcript) {

                            $creationYearLastTwoDigits = date('y', strtotime(date('Y-m-d H:i:s')));

                            $fileName = $creationYearLastTwoDigits . '_' . $model->ID . '_LatestCertifiedAcademicTranscript.' . $model->Latest_certified_academic_transcript->extension;

                            $inputName = preg_replace('/[^a-zA-Z0-9]+/', '_', $model->Latest_certified_academic_transcript->name);

                            $model->Latest_certified_academic_transcript->saveAs($baseUploadPath . '/' . $fileName);
                        }
                        if ($model->Confirmation_letter) {

                            $creationYearLastTwoDigits = date('y', strtotime(date('Y-m-d H:i:s')));

                            $fileName = $creationYearLastTwoDigits . '_' . $model->ID . '_ConfirmationLetter.' . $model->Confirmation_letter->extension;

                            $inputName = preg_replace('/[^a-zA-Z0-9]+/', '_', $model->Confirmation_letter->name);

                            $model->Confirmation_letter->saveAs($baseUploadPath . '/' . $fileName);
                        }
                        if ($model->Sponsorship_letter) {

                            $creationYearLastTwoDigits = date('y', strtotime(date('Y-m-d H:i:s')));

                            $fileName = $creationYearLastTwoDigits . '_' . $model->ID . '_SponsorshipLetter.' . $model->Sponsorship_letter->extension;

                            $inputName = preg_replace('/[^a-zA-Z0-9]+/', '_', $model->Sponsorship_letter->name);

                            $model->Sponsorship_letter->saveAs($baseUploadPath . '/' . $fileName);
                        }
                        if ($model->Recommendation_letter) {

                            $creationYearLastTwoDigits = date('y', strtotime(date('Y-m-d H:i:s')));

                            $fileName = $creationYearLastTwoDigits . '_' . $model->ID . '_RecommendationLetter.' . $model->Recommendation_letter->extension;

                            $inputName = preg_replace('/[^a-zA-Z0-9]+/', '_', $model->Recommendation_letter->name);

                            $model->Recommendation_letter->saveAs($baseUploadPath . '/' . $fileName);
                        }
                        if ($model->English_certificate) {

                            $creationYearLastTwoDigits = date('y', strtotime(date('Y-m-d H:i:s')));

                            $fileName = $creationYearLastTwoDigits . '_' . $model->ID . '_EnglishCertificate.' . $model->English_certificate->extension;

                            $inputName = preg_replace('/[^a-zA-Z0-9]+/', '_', $model->English_certificate->name);

                            $model->English_certificate->saveAs($baseUploadPath . '/' . $fileName);
                        }
                        //
                        $coursesData = Yii::$app->request->post('CoursesModel', []);
                        foreach ($coursesData as $courseInfo) {
                            $coursesModel = new InCourses();
                            $coursesModel->attributes = $courseInfo;
                            $coursesModel->student_id = $model->ID;
                            $coursesModel->save();
                        }

                        $transaction->commit();

                        Yii::$app->session->setFlash('success', 'Application created successfully.');
                        return $this->redirect(['index']);
                    }
                }
            } catch (Exception $e) {
                // If any exception occurs, roll back the transaction
                $transaction->rollBack();

                Yii::$app->session->setFlash('error', 'An error occurred while creating the application.');
                Yii::error($e->getMessage());
            }
        } else {
            $model->loadDefaultValues();
        }


        return $this->render('create', [
            'model' => $model,
        ]);
    }

    private function idExists($id)
    {
        return Inbound::findOne(['ID' => $id]) !== null;
    }

    private function createModel($id)
    {
        $model = new Inbound(['ID' => $id]);
        return $model;
    }

    /**
     * Updates an existing Inbound model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $ID ID
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($ID)
    {
        $this->layout = 'progressInbound';
        $model = Inbound::findOne($ID);

        // Retrieve courses data

        if ($model->Status !== 7 && $model->Status !== null) {
            Yii::$app->session->setFlash('error', "Your application on process now, Can't update your INFO during that.");
            // Redirect to a different page or reload the current page
            return $this->redirect(['inbound/index']); // Replace 'controller/action' with the appropriate route
        }
        $coursesData = InCourses::find()->where(['student_id' => $ID])->all();


        if (Yii::$app->request->isPost) {
            $transaction = Yii::$app->db->beginTransaction();

            try {

                if ($model->load(Yii::$app->request->post())) {
                    // Helper function for updating file
                    $updateFile = function ($attribute, $fileNamePrefix) use ($model) {
                        $file = UploadedFile::getInstance($model, $attribute);
                        if ($file) {
                            $baseUploadPath = 'C:/xampp/htdocs/IIUM_Inbound_Oubbound/frontend/uploads';
                            $inputName = preg_replace('/[^a-zA-Z0-9]+/', '_', $file->name);
                            $creationYearLastTwoDigits = date('y', strtotime($model->created_at));
                            $fileName = $creationYearLastTwoDigits . '_' . $model->ID . '_' . $fileNamePrefix . '.' . $file->extension;
                            $file->saveAs($baseUploadPath . '/' . $fileName);
                            $model->$attribute = $fileName; // Update the model attribute with the new file name
                        }
                    };

                    // Update each file
                    $updateFile('Passport', 'Passport');
                    $updateFile('Latest_passport_photo', 'LatestPassportPhoto');
                    $updateFile('Latest_certified_academic_transcript', 'LatestCertifiedAcademicTranscript');
                    $updateFile('Confirmation_letter', 'ConfirmationLetter');
                    $updateFile('Sponsorship_letter', 'SponsorshipLetter');
                    $updateFile('Recommendation_letter', 'RecommendationLetter');
                    $updateFile('English_certificate', 'EnglishCertificate');

                    if ($this->request->post('saveWithoutValidation') === 'validate') {
                        // Set status to 10 only when the 'submit' button is clicked
                        $model->Status = 10;
                    }

                    if ($model->validate() && $model->save()) {
                        // Update Courses records
                        foreach ($_POST['CoursesModel'] as $courseData) {
                            $courseModel = InCourses::findOne($courseData['id']);
                            $courseModel->attributes = $courseData;

                            if (!$courseModel->validate() || !$courseModel->save()) {
                                Yii::error("Error saving Courses record: " . print_r($courseModel->errors, true));
                                // Handle the error case, you might want to render the update view again with an error message
                            }
                        }

                        // If everything is successful, commit the transaction
                        $transaction->commit();

                        Yii::$app->session->setFlash('success', 'Application updated successfully.');
                        return $this->redirect(['index']);
                    }
                }
            } catch (Exception $e) {
                // If any exception occurs, roll back the transaction
                $transaction->rollBack();

                Yii::$app->session->setFlash('error', 'An error occurred while updating the application.');
                Yii::error($e->getMessage());
            }
        }

        return $this->render('update', [
            'model' => $model, 'coursesData' => $coursesData,
        ]);
    }


    /**
     * Deletes an existing Inbound model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $ID ID
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($ID)
    {
        $this->findModel($ID)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Inbound model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $ID ID
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

    public function actionDownload($id, $file)
    {
        $model = $this->findModel($id);

        // Set the file path based on your file storage location
        $filePath = 'C:\xampp\htdocs\IIUM_Inbound_Oubbound\frontend\uploads/' . $file;

        if (file_exists($filePath)) {
            Yii::$app->response->sendFile($filePath);
        } else {
            throw new NotFoundHttpException('The file does not exist.');
        }
    }


}
