<?php

namespace frontend\controllers;

use common\models\Countries;
use common\models\Courses;
use common\models\Iiumcourse;
use common\models\Ob010;
use common\models\Outbound;
use common\models\Poc;
use common\models\States;
use Exception;
use Yii;
use yii\data\ActiveDataProvider;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Response;
use yii\web\UploadedFile;
use function PHPUnit\Framework\returnArgument;

/**
 * OutboundController implements the CRUD actions for Outbound model.
 */
class OutboundController extends Controller
{
    /**
     * @inheritDoc
     */
    public function behaviors()
    {
        return array_merge(parent::behaviors(), [
            'verbs' => [
                'class' => VerbFilter::className(), 'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ]);
    }

    /**
     * Lists all Outbound models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $id = Yii::$app->user->id;

        $student = Outbound::findOne($id);

        if (!$student) {
            return $this->render('index', ['noRecord' => true]);
        }

        $personInChargeId = $student->Person_in_charge_ID;
        $modelPoc1 = Poc::findOne(['id' => $personInChargeId]);

        $deanId = $student->Dean_ID;
        $modelPoc2 = Poc::findOne(['id' => $deanId]);

        $courses = Courses::find()->where(['student_id' => $student->ID])->all();
        $iiumcourses = Iiumcourse::find()->where(['student_id' => $student->ID])->all();

        return $this->render("index", [
            "model" => $student, "modelPoc1" => $modelPoc1, "modelPoc2" => $modelPoc2, "courses" => $courses,
            'iiumcourses' => $iiumcourses,
        ]);
    }

    /**
     * Displays a single Outbound model.
     * @param  int  $ID  ID
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($ID): string
    {
        if ($ID == Yii::$app->user->id) {
            return $this->render('view', [
                'model' => $this->findModel($ID),
            ]);
        } else {
            throw new ForbiddenHttpException('Create an application in order to reach this page');
        }
    }

    /**
     * Finds the Outbound model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param  int  $ID  ID
     * @return Outbound the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($ID)
    {
        if (($model = Outbound::findOne(['ID' => $ID])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    /**
     * Creates a new Outbound model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|Response
     * @throws \yii\db\Exception
     */
    public function actionCreate()
    {
        //---layout progress---\\
        $this->layout = 'progress';

        $id = Yii::$app->user->id;

        //-------------------------- Check if an Outbound record already exists for the provided ID--------------------------\\
        if (Outbound::findOne(['ID' => $id])) {
            //-------------- If a record is found, display an error message to the user and redirect to Index--------------\\
            Yii::$app->session->setFlash('error', "You already created an application.");
            return $this->redirect(['outbound/index']);
        }
        //--------------  Create a new Outbound record model and set its 'ID' attribute to be the same as the current User ID --------------\\
        $model = new Outbound(['ID' => Yii::$app->user->id]);

        //-------------- Create new instances for related course models --------------\\
        $coursesModel = new Courses();
        $iiumcoursesModel = new Iiumcourse();
        //-------------- Define arrays to store data related to courses --------------\\
        $coursesData = [];
        $iiumcourseData = [];


        if (Yii::$app->request->isPost) {
            try {
                //-------------- Begin a database transaction to ensure atomicity and consistency of database operations --------------\\
                $transaction = Yii::$app->db->beginTransaction();

                if ($model->load(Yii::$app->request->post())) {

                    $model->Offer_letter = UploadedFile::getInstance($model, 'Offer_letter');
                    $model->Academic_transcript = UploadedFile::getInstance($model, 'Academic_transcript');
                    $model->Program_brochure = UploadedFile::getInstance($model, 'Program_brochure');
                    $model->Latest_pay_slip = UploadedFile::getInstance($model, 'Latest_pay_slip');
                    $model->Other_latest_pay_slip = UploadedFile::getInstance($model, 'Other_latest_pay_slip');


                    if ($this->request->post('saveWithoutValidation') === 'validate') {
                        // Set status to 10 only when the 'submit' button is clicked
                        $model->Status = 10;
                    }

                    if ($model->validate() && $model->save()) {
                        //-------------------- File Saving --------------------\\
                        $baseUploadPath = 'C:/xampp/htdocs/IIUM_Inbound_Oubbound/frontend/uploads';
                        if ($model->Offer_letter) {

                            $creationYearLastTwoDigits = date('y', strtotime(date('Y-m-d H:i:s')));

                            $fileName = $creationYearLastTwoDigits.'_'.$model->ID.'_OfferLetter.'.$model->Offer_letter->extension;

                            $inputName = preg_replace('/[^a-zA-Z0-9]+/', '_', $model->Offer_letter->name);

                            $model->Offer_letter->saveAs($baseUploadPath.'/'.$fileName);
                        }
                        if ($model->Academic_transcript) {

                            $creationYearLastTwoDigits = date('y', strtotime(date('Y-m-d H:i:s')));

                            $fileName = $creationYearLastTwoDigits.'_'.$model->ID.'_AcademicTranscript.'.$model->Academic_transcript->extension;

                            $inputName = preg_replace('/[^a-zA-Z0-9]+/', '_', $model->Academic_transcript->name);

                            $model->Academic_transcript->saveAs($baseUploadPath.'/'.$fileName);
                        }
                        if ($model->Program_brochure) {

                            $creationYearLastTwoDigits = date('y', strtotime(date('Y-m-d H:i:s')));

                            $fileName = $creationYearLastTwoDigits.'_'.$model->ID.'_ProgramBrochure.'.$model->Program_brochure->extension;

                            $inputName = preg_replace('/[^a-zA-Z0-9]+/', '_', $model->Program_brochure->name);

                            $model->Program_brochure->saveAs($baseUploadPath.'/'.$fileName);
                        }
                        if ($model->Latest_pay_slip) {

                            $creationYearLastTwoDigits = date('y', strtotime(date('Y-m-d H:i:s')));

                            $fileName = $creationYearLastTwoDigits.'_'.$model->ID.'_LatestPaySlip.'.$model->Latest_pay_slip->extension;

                            $inputName = preg_replace('/[^a-zA-Z0-9]+/', '_', $model->Latest_pay_slip->name);

                            $model->Latest_pay_slip->saveAs($baseUploadPath.'/'.$fileName);
                        }
                        if ($model->Other_latest_pay_slip) {

                            $creationYearLastTwoDigits = date('y', strtotime(date('Y-m-d H:i:s')));

                            $fileName = $creationYearLastTwoDigits.'_'.$model->ID.'_OtherLatestPaySlip.'.$model->Other_latest_pay_slip->extension;

                            $inputName = preg_replace('/[^a-zA-Z0-9]+/', '_', $model->Other_latest_pay_slip->name);

                            $model->Other_latest_pay_slip->saveAs($baseUploadPath.'/'.$fileName);
                        }
//
                        $coursesData = Yii::$app->request->post('CoursesModel', []);


                        foreach ($coursesData as $courseInfo) {
                            $coursesModel = new Courses();
                            $coursesModel->attributes = $courseInfo;
                            $coursesModel->student_id = $model->ID;
                            $coursesModel->save();
                        }

//                            // Load and save IIUM Courses data
                        $iiumcourseData = Yii::$app->request->post('IiumcoursesModel', []);
                        foreach ($iiumcourseData as $iiumcourseInfo) {
                            $iiumcoursesModel = new Iiumcourse();
                            $iiumcoursesModel->attributes = $iiumcourseInfo;
                            $iiumcoursesModel->student_id = $model->ID;
                            $iiumcoursesModel->save();
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

    /**
     * Updates an existing Outbound model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param  int  $ID  ID
     * @return string|Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($ID)
    {
        $this->layout = 'progress';
        $model = Outbound::findOne($ID);

        // Retrieve courses data

        if ($model ->Status !== 3 && $model -> Status !== null ) {
            Yii::$app->session->setFlash('error', "Your application on process now, Can't update your INFO during that.");
            // Redirect to a different page or reload the current page
            return $this->redirect(['outbound/index']); // Replace 'controller/action' with the appropriate route
        }
        $coursesData = Courses::find()->where(['student_id' => $ID])->all();

        $iiumcourseData = Iiumcourse::find()->where(['student_id' => $ID])->all();

        if (Yii::$app->request->isPost) {
            $transaction = Yii::$app->db->beginTransaction();

            try {
                // Load data into the Ob010 model
                if ($model->load(Yii::$app->request->post())) {
                    // Helper function for updating file
                    $updateFile = function ($attribute, $fileNamePrefix) use ($model) {
                        $file = UploadedFile::getInstance($model, $attribute);
                        if ($file) {
                            $baseUploadPath = 'C:/xampp/htdocs/IIUM_Inbound_Oubbound/frontend/uploads';
                            $inputName = preg_replace('/[^a-zA-Z0-9]+/', '_', $file->name);
                            $creationYearLastTwoDigits = date('y', strtotime(date('Y-m-d H:i:s')));
                            $fileName = $creationYearLastTwoDigits.'_'.$model->ID. '_' .$fileNamePrefix. '.'.$file->extension;
                            $file->saveAs($baseUploadPath . '/' . $fileName);
                            $model->$attribute = $fileName; // Update the model attribute with the new file name
                        }
                    };

                    // Update each file
                    $updateFile('Offer_letter', 'OfferLetter');
                    $updateFile('Academic_transcript', 'AcademicTranscript');
                    $updateFile('Program_brochure', 'ProgramBrochure');
                    $updateFile('Latest_pay_slip', 'LatestPaySlip');
                    $updateFile('Other_latest_pay_slip', 'OtherLatestPaySlip');

                    if ($this->request->post('saveWithoutValidation') === 'validate') {
                        // Set status to 10 only when the 'submit' button is clicked
                        $model->Status = 10;
                    }
                    // Save the main model and update Courses/Iiumcourse records
                    if ($model->validate() && $model->save()) {
                        // Update Courses records
                        foreach ($_POST['CoursesModel'] as $courseData) {
                            $courseModel = Courses::findOne($courseData['id']);
                            $courseModel->attributes = $courseData;

                            if (!$courseModel->validate() || !$courseModel->save()) {
                                Yii::error("Error saving Courses record: " . print_r($courseModel->errors, true));
                                // Handle the error case, you might want to render the update view again with an error message
                            }
                        }

                        // Update Iiumcourse records
                        foreach ($_POST['IiumcoursesModel'] as $iiumcourseData) {
                            $iiumcourseModel = Iiumcourse::findOne($iiumcourseData['id']);
                            $iiumcourseModel->attributes = $iiumcourseData;

                            if (!$iiumcourseModel->validate() || !$iiumcourseModel->save()) {
                                Yii::error("Error saving Iiumcourse record: " . print_r($iiumcourseModel->errors, true));
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
            'model' => $model, 'coursesData' => $coursesData, 'iiumcourseData' => $iiumcourseData,
        ]);
    }


    /**
     * Deletes an existing Outbound model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param  int  $ID  ID
     * @return Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($ID)
    {
        $this->findModel($ID)->delete();

        return $this->redirect(['index']);
    }
    public function actionDownload($id, $file)
    {
        $model = $this->findModel($id);

        // Set the file path based on your file storage location
        $filePath = 'C:\xampp\htdocs\IIUM_Inbound_Oubbound\frontend\uploads/'.$file;

        if (file_exists($filePath)) {
            Yii::$app->response->sendFile($filePath);
        } else {
            throw new NotFoundHttpException('The file does not exist.');
        }
    }

    public function actionGetStates()
    {
        $countryId = Yii::$app->request->post('countryId');
        $states = States::find()->where(['country_id' => $countryId])->all();

        $options = '<option value="">Select State</option>';
        foreach ($states as $state) {
            $options .= '<option value="' . $state->id . '">' . $state->name . '</option>';
        }

        Yii::$app->response->format = \yii\web\Response::FORMAT_RAW;
        return $options;
    }

    public function actionGetCountries()
    {
        $countries = Countries::find()->all(); // Replace YourCountryModel with your actual model class name
        $options = '<option value="">Select Country</option>';
        foreach ($countries as $country) {
            $options .= '<option value="' . $country->id . '">' . $country->name . '</option>';
        }

        Yii::$app->response->format = \yii\web\Response::FORMAT_RAW;
        return $options;
    }

    public function actionGetNationality()
    {
        $countries = Countries::find()->all(); // Replace YourCountryModel with your actual model class name
        $options = '<option value="">Select Country</option>';
        foreach ($countries as $country) {
            $options .= '<option value="' . $country->nationality . '">' . $country->nationality . '</option>';
        }

        Yii::$app->response->format = \yii\web\Response::FORMAT_RAW;
        return $options;
    }
    public function actionGetRecord($id)
    {
        Yii::$app->response->format = Response::FORMAT_JSON;

        $model = Outbound::findOne($id);

        return [
            'Proof_of_sponsorship' => $model->Proof_of_sponsorship,
            'Proof_insurance_cover' => $model->Proof_insurance_cover,
            'Letter_of_indemnity' => $model->Letter_of_indemnity,
            'Flight_ticket' => $model->Flight_ticket,
        ];
    }
}
