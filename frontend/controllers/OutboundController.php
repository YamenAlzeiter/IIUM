<?php

namespace frontend\controllers;

use common\models\Courses;
use common\models\Iiumcourse;
use common\models\Outbound;
use Exception;
use Yii;
use yii\data\ActiveDataProvider;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Response;
use yii\web\UploadedFile;
use yiiunit\extensions\bootstrap5\data\User;

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
        return [
            'access' => [
                'class' => AccessControl::class, 'only' => ['index', 'view', 'create', 'upload', 'test'],
                // Define the actions that require access control
                'rules' => [
                    [
                        'actions' => ['index', 'view', 'create', 'upload', 'test'], 'allow' => true, 'roles' => ['@'],
                    ],
                ],
            ], 'verbs' => ['class' => VerbFilter::class, 'actions' => ['delete' => ['POST']],],
        ];
    }

    /**
     * Lists all Outbound models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $dataProvider = new ActiveDataProvider([
            'query' => Outbound::find()->where(['ID' => Yii::$app->user->id])
            // Filter records by the currently logged-in user's ID
        ]);

        return $this->render('index', [
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Outbound model.
     * @param  int  $ID  ID
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($ID)
    {
        try {
            // Attempt to find the student based on the provided ID
            $student = Outbound::findOne($ID);

            if ($student === null) {
                throw new NotFoundHttpException('Create an application in order to reach this page');
            }

            // Retrieve courses and iiumcourses related to the student
            $courses = Courses::find()->where(['student_id' => $student->ID])->all();
            $iiumcourses = Iiumcourse::find()->where(['student_id' => $student->ID])->all();

            // Render the view with the retrieved data
            return $this->render("view", [
                "model" => $student, "courses" => $courses, 'iiumcourses' => $iiumcourses,
            ]);
        } catch (NotFoundHttpException $e) {
            // Handle the case where the student is not found
            Yii::error($e->getMessage()); // Log the error if needed
            throw $e; // Re-throw the exception to display the 404 error page
        } catch (Exception $e) {
            // Handle other exceptions here if necessary
            Yii::error($e->getMessage()); // Log the error if needed
            // You can display a custom error page or take appropriate actions for other exceptions
            // Example: return $this->render('error', ['message' => $e->getMessage()]);
        }
    }

    public function actionDownload($id, $file)
    {
        $model = $this->findModel($id);

        // Set the file path based on your file storage location
        $filePath = 'C:\xampp\htdocs\playground1\frontend\uploads/'.$file;

        if (file_exists($filePath)) {
            Yii::$app->response->sendFile($filePath);
        } else {
            throw new NotFoundHttpException('The file does not exist.');
        }
    }

    /**
     * Finds the Outbound model based on its primary key `val`ue.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param  int  $ID  ID
     * @return Outbound the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($ID)
    {
        if (($model = Outbound::findOne(['ID' => $ID])) !== null) {
            if ($model->ID !== Yii::$app->user->id) {
                throw new ForbiddenHttpException('You are not allowed to access this record.');
            }
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    /**
     * Creates a new Outbound model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|Response
     */


// ...

    public function actionCreate()
    {
        $this->layout = 'progress';
        $id = Yii::$app->user->id;

        // Check if the ID already exists in the Ob010 table.
        if ($this->idExists($id)) {
            Yii::$app->session->setFlash('error', "You already created an application.");
            // Redirect to a different page or reload the current page
            return $this->redirect(['ob010/index']); // Replace 'controller/action' with the appropriate route
        }

        $model = $this->createModel($id);
        $coursesModel = new Courses();
        $iiumcoursesModel = new Iiumcourse();

        $coursesData = [];
        $iiumcourseData = [];

        if (Yii::$app->request->isPost) {
            $transaction = Yii::$app->db->beginTransaction();

            try {
                // Load data into the Ob010 model
                if ($model->load(Yii::$app->request->post())) {
                    $model->offer_letter = UploadedFile::getInstance($model, 'offer_letter');
                    $model->academic_transcript = UploadedFile::getInstance($model, 'academic_transcript');
                    $model->program_brochure = UploadedFile::getInstance($model, 'program_brochure');
                    $model->latest_pay_slip = UploadedFile::getInstance($model, 'latest_pay_slip');
                    $model->other_latest_pay_slip = UploadedFile::getInstance($model, 'other_latest_pay_slip');

                    if ($model->save()) {

                        $baseUploadPath = 'C:/xampp/htdocs/playground1/frontend/uploads';


                        if ($model->offer_letter) {
                            $inputName = preg_replace('/[^a-zA-Z0-9]+/', '_', $model->offer_letter->name);
                            $fileName = 'OfferLetter'.'_'.$model->Name.'_'.$model->ID.'.'.$model->offer_letter->extension;
                            $model->offer_letter->saveAs($baseUploadPath.'/'.$fileName);
                        }

                        if ($model->academic_transcript) {
                            $inputName = preg_replace('/[^a-zA-Z0-9]+/', '_', $model->academic_transcript->name);
                            $fileName = 'AcademicTranscript'.'_'.$model->Name.'_'.$model->ID.'.'.$model->academic_transcript->extension;
                            $model->academic_transcript->saveAs($baseUploadPath.'/'.$fileName);
                        }

                        if ($model->program_brochure) {
                            $inputName = preg_replace('/[^a-zA-Z0-9]+/', '_', $model->program_brochure->name);
                            $fileName = 'ProgramBrochure'.'_'.$model->Name.'_'.$model->ID.'.'.$model->program_brochure->extension;
                            $model->program_brochure->saveAs($baseUploadPath.'/'.$fileName);
                        }

                        if ($model->latest_pay_slip) {
                            $inputName = preg_replace('/[^a-zA-Z0-9]+/', '_', $model->latest_pay_slip->name);
                            $fileName = 'LatestPaySlip'.'_'.$model->Name.'_'.$model->ID.'.'.$model->latest_pay_slip->extension;
                            $model->latest_pay_slip->saveAs($baseUploadPath.'/'.$fileName);
                        }

                        if ($model->other_latest_pay_slip) {
                            $inputName = preg_replace('/[^a-zA-Z0-9]+/', '_', $model->other_latest_pay_slip->name);
                            $fileName = 'OtherLatestPaySlip'.'_'.$model->Name.'_'.$model->ID.'.'.$model->other_latest_pay_slip->extension;
                            $model->other_latest_pay_slip->saveAs($baseUploadPath.'/'.$fileName);
                        }

                    }
                }
                if ($model->validate() && $model->save()) {
                    // Load and save Courses data
                    $coursesData = Yii::$app->request->post('CoursesModel', []);
                    $this->saveCoursesData($model, $coursesData);

                    // Load and save IIUM Courses data
                    $iiumcourseData = Yii::$app->request->post('IiumcoursesModel', []);
                    $this->saveIiumCoursesData($model, $iiumcourseData);

                    // If everything is successful, commit the transaction
                    $transaction->commit();

                    Yii::$app->session->setFlash('success', 'Application created successfully.');
                    return $this->redirect(['view', 'ID' => $model->ID]);
                }

            } catch (Exception $e) {
                // If any exception occurs, roll back the transaction
                $transaction->rollBack();

                Yii::$app->session->setFlash('error', 'An error occurred while creating the application.');
                Yii::error($e->getMessage());
            }
        }

        return $this->render('create',
            compact('model', 'coursesModel', 'iiumcoursesModel', 'coursesData', 'iiumcourseData'));
    }

    private function idExists($id)
    {
        return Outbound::findOne(['ID' => $id]) !== null;
    }

    private function createModel($id)
    {
        $model = new Outbound(['ID' => $id]);
        return $model;
    }

    private function saveCoursesData($model, $coursesData)
    {
        foreach ($coursesData as $courseInfo) {
            $coursesModel = new Courses();
            $coursesModel->attributes = $courseInfo;
            $coursesModel->student_id = $model->id;

            if (!$coursesModel->save()) {
                throw new Exception('Failed to save Courses records.');
            }
        }
    }

    private function saveIiumCoursesData($model, $iiumcourseData)
    {
        foreach ($iiumcourseData as $iiumcourseInfo) {
            $iiumcoursesModel = new Iiumcourse();
            $iiumcoursesModel->attributes = $iiumcourseInfo;
            $iiumcoursesModel->student_id = $model->id;

            if (!$iiumcoursesModel->save()) {
                throw new Exception('Failed to save IIUM course records.');
            }
        }
    }


    public function actionUpdate($ID)
    {

        $model = Outbound::findOne($ID);

        // Retrieve courses data
        $coursesData = Courses::find()->where(['student_id' => $ID])->all();
        $iiumcourseData = Iiumcourse::find()->where(['student_id' => $ID])->all();

        if ($model ->Status !== 3 && $model -> Status !== null ) {
            Yii::$app->session->setFlash('error', "Your application on process now, Can't update your INFO during that.");
            // Redirect to a different page or reload the current page
            return $this->redirect(['outbound/index']); // Replace 'controller/action' with the appropriate route
        }

        if (Yii::$app->request->isPost) {
            $transaction = Yii::$app->db->beginTransaction();

            try {
                // Load data into the Outbound model
                if ($model->load(Yii::$app->request->post())) {
                    // Helper function for updating file
                    $updateFile = function ($attribute, $fileNamePrefix) use ($model) {
                        $file = UploadedFile::getInstance($model, $attribute);
                        if ($file) {
                            $baseUploadPath = 'C:/xampp/htdocs/playground1/frontend/uploads';
                            $inputName = preg_replace('/[^a-zA-Z0-9]+/', '_', $file->name);
                            $fileName = $fileNamePrefix . '_' . $model->Name . '_' . $model->ID . '.' . $file->extension;
                            $file->saveAs($baseUploadPath . '/' . $fileName);
                            $model->$attribute = $fileName; // Update the model attribute with the new file name
                        }
                    };

                    // Update each file
                    $updateFile('Offer_letter', 'OfferLetter');
                    $updateFile('Academic_transcript', 'AcademicTranscript');
                    $updateFile('Program_brochure', 'ProgramBrochure');
                    $updateFile('Latest_pay_slip', 'LatestPaySlip');
                    $updateFile('Other_Latest_pay_slip', 'OtherLatestPaySlip');

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
                        return $this->redirect(['view', 'ID' => $model->ID]);
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
     * /**
     * Updates an existing Outbound model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param  int  $ID  ID
     * @return string|Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpload($ID)
    {
        $model = $this->findModel($ID);
        if ($model -> Status !== 41) {
            Yii::$app->session->setFlash('error', 'You already submitted your documents. Cannot update any documents now.');
            // Redirect to a different page or reload the current page
            return $this->redirect(['outbound/index']); // Replace 'controller/action' with the appropriate route
        }
        if ($model->Status === 41) {
            if ($this->request->isPost) {
                $model->proof_of_sponsorship = UploadedFile::getInstance($model, 'proof_of_sponsorship');
                $model->proof_insurance_cover = UploadedFile::getInstance($model, 'proof_insurance_cover');
                $model->letter_of_indemnity = UploadedFile::getInstance($model, 'letter_of_indemnity');
                $model->flight_ticket = UploadedFile::getInstance($model, 'flight_ticket');
                $model->Status = 51;
                if ($model->load($this->request->post()) && $model->save()) {
                    // Check if files were uploaded and save them
                    if ($model->proof_of_sponsorship) {
                        $baseUploadPath = 'C:/xampp/htdocs/playground1/frontend/uploads';
                        $fileName = 'ProofOfSponsorship_'.$model->ID.'.'.$model->proof_of_sponsorship->extension;
                        $model->proof_of_sponsorship->saveAs($baseUploadPath.'/'.$fileName);
                    }

                    if ($model->proof_insurance_cover) {
                        $baseUploadPath = 'C:/xampp/htdocs/playground1/frontend/uploads';
                        $fileName = 'ProofInsuranceCover_'.$model->ID.'.'.$model->proof_insurance_cover->extension;
                        $model->proof_insurance_cover->saveAs($baseUploadPath.'/'.$fileName);
                    }

                    if ($model->letter_of_indemnity) {
                        $baseUploadPath = 'C:/xampp/htdocs/playground1/frontend/uploads';
                        $fileName = 'LetterOfIndemnity_'.$model->ID.'.'.$model->letter_of_indemnity->extension;
                        $model->letter_of_indemnity->saveAs($baseUploadPath.'/'.$fileName);
                    }

                    if ($model->flight_ticket) {
                        $baseUploadPath = 'C:/xampp/htdocs/playground1/frontend/uploads';
                        $fileName = 'FlightTicket_'.$model->ID.'.'.$model->flight_ticket->extension;
                        $model->flight_ticket->saveAs($baseUploadPath.'/'.$fileName);
                    }

                    return $this->redirect(['view', 'ID' => $model->ID]);
                }
            }


        }
        return $this->render('upload', [
            'model' => $model,
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
    private function modelListToAssociativeArray($models)
    {
        $data = [];
        foreach ($models as $model) {
            $data[$model->id] = $model->attributes;
        }
        return $data;
    }

    private function updateOrCreateData($model, $relationName, &$data)
    {
        $postData = Yii::$app->request->post("{$relationName}Model", []);

        foreach ($postData as $key => $item) {
            $id = isset($item['id']) ? $item['id'] : null;

            if (!empty($id) && isset($data[$id])) {
                // If the ID exists, update the existing record
                $existingModel = $relationName::findOne($id);
                $existingModel->attributes = $item;
                $existingModel->save();

            }
        }
    }


}