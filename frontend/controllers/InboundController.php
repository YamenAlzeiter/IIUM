<?php

namespace frontend\controllers;


use common\models\Countries;
use common\models\Courses;
use common\models\Inbound;
use common\models\InCourses;
use common\models\Outbound;
use common\models\States;
use Exception;
use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\web\Response;
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
                'class' => AccessControl::class, 'only' => ['index', 'create', 'upload', 'update','downloader'],
                // Define the actions that require access control
                'rules' => [
                    [
                        'actions' => ['index', 'create', 'upload', 'update', 'downloader'], 'allow' => true, 'roles' => ['@'],
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
     * Displays a single Inbound model.
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
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
     * If creation is successful, the browser will be redirected to the 'index' page.
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
    //                    $model->Name = Yii::$app->user->identity->username;
    //                    $model->Email_address = Yii::$app->user->identity->email;

                    if ($model->validate() && $model->save()) {
                        //-------------------- File Saving --------------------\\
                        $baseUploadPath = Yii::getAlias('@common/uploads');
                        $this->saveUploadedFile($model, 'Passport', $baseUploadPath, 'Passport');
                        $this->saveUploadedFile($model, 'Latest_passport_photo', $baseUploadPath, 'LatestPassportPhoto');
                        $this->saveUploadedFile($model, 'Latest_certified_academic_transcript', $baseUploadPath, 'LatestCertifiedAcademicTranscript');
                        $this->saveUploadedFile($model, 'Confirmation_letter', $baseUploadPath, 'ConfirmationLetter');
                        $this->saveUploadedFile($model, 'Sponsorship_letter', $baseUploadPath, 'SponsorshipLetter');
                        $this->saveUploadedFile($model, 'Recommendation_letter', $baseUploadPath, 'RecommendationLetter');
                        $this->saveUploadedFile($model, 'English_certificate', $baseUploadPath, 'EnglishCertificate');
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
    private function saveUploadedFile($model, $attribute, $baseUploadPath, $fileName)
    {
        if ($model->$attribute) {
            $creationYearLastTwoDigits = date('y', strtotime(date('Y-m-d H:i:s')));
            $fileNameHeader = $creationYearLastTwoDigits . '_' . $model->ID . '_' . $fileName . '.' . $model->$attribute->extension;
            $inputName = preg_replace('/[^a-zA-Z0-9]+/', '_', $model->$attribute->name);
            $filePath = $baseUploadPath.'/'.$model->ID.'/'.$fileNameHeader;

            if (!file_exists(dirname($filePath))) {
                mkdir(dirname($filePath), 0777, true);
            }

            $model->$attribute->saveAs($filePath);
        }
    }
    private function createModel($id)
    {
        $model = new Inbound(['ID' => $id]);
        return $model;
    }

    /**
     * Updates an existing Inbound model.
     * If update is successful, the browser will be redirected to the 'index' page.
     * @param int $ID
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


            try {
                $transaction = Yii::$app->db->beginTransaction();
                if ($model->load(Yii::$app->request->post())) {
                    // Helper function for updating file

                    $updateFile = function ($attribute, $fileNamePrefix) use ($model) {
                        $file = UploadedFile::getInstance($model, $attribute);
                        if ($file) {
                            $baseUploadPath = Yii::getAlias('@common/uploads');
                            $inputName = preg_replace('/[^a-zA-Z0-9]+/', '_', $file->name);
                            $creationYearLastTwoDigits = date('y', strtotime(date('Y-m-d H:i:s')));
                            $fileName = $creationYearLastTwoDigits.'_'.$model->ID.'_'.$fileNamePrefix.'.'.$file->extension;
                            $filePath = $baseUploadPath.'/'.$model->ID.'/'.$fileName;

                            // Create directory if not exists
                            if (!file_exists(dirname($filePath))) {
                                mkdir(dirname($filePath), 0777, true);
                            }

                            $file->saveAs($filePath);
                            $model->$attribute = $fileName;
                        }
                    };

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


    public function actionUpload($ID)
    {
        $model = Inbound::findOne($ID);

        if ($model->Status !== 45) {
            Yii::$app->session->setFlash('error', 'You already submitted your documents. Cannot update any documents now.');
            return $this->redirect(['inbound/index']);
        }

        if (Yii::$app->request->isPost) {
            $transaction = Yii::$app->db->beginTransaction();

            try {
                $filesToUpdate = [
                    'proof_of_payment' => 'proof_of_payment',
                ];
                $baseUploadPath = Yii::getAlias('@common/uploads');

                foreach ($filesToUpdate as $attribute => $fileNamePrefix) {
                    $file = UploadedFile::getInstance($model, $attribute);
                    if ($file) {

                        $inputName = preg_replace('/[^a-zA-Z0-9]+/', '_', $file->name);
                        $creationYearLastTwoDigits = date('y', strtotime(date('Y-m-d H:i:s')));
                        $fileName = $creationYearLastTwoDigits . '_' . $model->ID . '_' . $fileNamePrefix . '.' . $file->extension;
                        $filePath = $baseUploadPath.'/'.$model->ID.'/'.$fileName;
                        $model->proof_of_payment = $filePath;
                        if (!file_exists(dirname($filePath))) {
                            mkdir(dirname($filePath), 0777, true);
                        }

                        $file->saveAs($filePath);

                        $model->$attribute = $fileName; // Update the model attribute with the new file name
                    }
                }

                $model->Status = 55;
                // Only change the Status if any file was uploaded
                if ($model->validate() && $model->save()) {

                    $transaction->commit();
                    Yii::$app->session->setFlash('success', 'Application updated successfully.');
                    return $this->redirect(['index']);
                }
            } catch (Exception $e) {
                $transaction->rollBack();
                Yii::$app->session->setFlash('error', 'An error occurred while updating the application.');
                Yii::error($e->getMessage());
            }
        }
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

    /**
     * Allows downloading a file associated with a specific Inbound model.
     * @param int $id
     * @param string $file
     * @throws NotFoundHttpException if the file does not exist
     */
    public function actionDownload($id, $file)
    {
        $baseUploadPath = Yii::getAlias('@common/uploads');
        $filePath = $baseUploadPath.'/'.$id.'/'.$file;
        Yii::info("File Path: ".$filePath, "fileDownload");

        if (file_exists($filePath)) {
            Yii::$app->response->format = Response::FORMAT_JSON;
            return ['success' => true];
        } else {
            Yii::$app->response->format = Response::FORMAT_JSON;
            return ['success' => false];
        }
    }

    public function actionDownloader($id, $file)
    {
        $baseUploadPath = Yii::getAlias('@common/uploads');
        $filePath = $baseUploadPath.'/'.$id.'/'.$file;
        Yii::$app->response->sendFile($filePath);
    }

    public function actionGetStates()
    {
        $countryId = Yii::$app->request->post('countryId');
        $states = States::find()->where(['country_id' => $countryId])->all();

        $options = '<option value="">Select State</option>';
        foreach ($states as $state) {
            $options .= '<option value="'.$state->id.'">'.$state->name.'</option>';
        }

        Yii::$app->response->format = Response::FORMAT_RAW;
        return $options;
    }

    public function actionGetCountries()
    {
        $countries = Countries::find()->all(); // Replace YourCountryModel with your actual model class name
        $options = '<option value="">Select Country</option>';
        foreach ($countries as $country) {
            $options .= '<option value="'.$country->id.'">'.$country->name.'</option>';
        }

        Yii::$app->response->format = Response::FORMAT_RAW;
        return $options;
    }

    public function actionGetNationality()
    {
        $countries = Countries::find()->all(); // Replace YourCountryModel with your actual model class name
        $options = '<option value="">Select Citizenship</option>';
        foreach ($countries as $country) {
            $options .= '<option value="'.$country->nationality.'">'.$country->nationality.'</option>';
        }

        Yii::$app->response->format = Response::FORMAT_RAW;
        return $options;
    }

}
