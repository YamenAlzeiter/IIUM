<?php

namespace frontend\controllers;

use common\models\Countries;
use common\models\Courses;
use common\models\Iiumcourse;
use common\models\Outbound;
use common\models\OutFiles;
use common\models\Poc;
use common\models\States;
use Exception;
use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\web\Response;
use yii\web\UploadedFile;

require Yii::getAlias('@common').'/Helpers/controllerFunctions.php';
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
                'class' => AccessControl::class, 'only' => ['index', 'create', 'upload', 'update'],
                // Define the actions that require access control
                'rules' => [
                    [
                        'actions' => ['index', 'create', 'upload', 'update'], 'allow' => true, 'roles' => ['@'],
                        'matchCallback' => function ($rule, $action) {
                            $user = Yii::$app->user->identity->type;
                            return ($user === "O");
                        }
                    ],
                ],
            ],
        ];

    }

    /**
     * Displays a single Inbound model.
     * @return string|Response
     * @throws NotFoundHttpException if the model cannot be found
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
        $outFilesModel = new OutFiles();
        return $this->render("index", [
            "model" => $student, "modelPoc1" => $modelPoc1, "modelPoc2" => $modelPoc2, "courses" => $courses,
            'iiumcourses' => $iiumcourses, 'outFilesModel' => $outFilesModel,
        ]);
    }

    /**
     * Creates a new Outbound model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|Response
     * @throws \yii\db\Exception
     */
    //refactor
    public function actionCreate()
    {
        //---layout progress---\\
        $this->layout = 'progress';

        $id = Yii::$app->user->id;

        //-------------------------- Check if an Outbound record already exists for the provided ID--------------------------\\
        if (Outbound::findOne(['ID' => $id])) {
            //-------------- If a record is found, display an error message to the user and redirect to Index--------------\\
            Yii::$app->session->setFlash('error', "You already created` an application.");
            return $this->redirect(['outbound/index']);
        }
        //--------------  Create a new Outbound record model and set its 'ID' attribute to be the same as the current User ID --------------\\
        $model = new Outbound(['ID' => Yii::$app->user->id]);

        //-------------- Create new instances for related course models --------------\\
        $coursesData = Courses::find()->where(['student_id' => $id])->all();
        $iiumCoursesData = Iiumcourse::find()->where(['student_id' => $id])->all();

        if (Yii::$app->request->isPost) {
            try {
                //-------------- Begin a database transaction to ensure atomicity and consistency of database operations --------------\\
                $transaction = Yii::$app->db->beginTransaction();

                if ($model->load(Yii::$app->request->post())) {

                    $scenario = $model->scenario = $this->request->post('saveWithoutValidation') === 'validate' ? 'requiredValidate' : 'default';
                    $isUndergraduate = $model->Academic_lvl_edu === 'UG'? true : false;
                    $course =  courseSavor($coursesData, 'CoursesModel', $scenario, $isUndergraduate);
                    $iiumCourse = courseSavor($iiumCoursesData, 'IiumCoursesModel', $scenario, $isUndergraduate);

                    fileHandler($model,'Offer_letter', 'OfferLetter');
                    fileHandler($model,'Academic_transcript', 'AcademicTranscript');
                    fileHandler($model,'Program_brochure', 'ProgramBrochure');
                    fileHandler($model,'Latest_pay_slip', 'LatestPaySlip');
                    fileHandler($model,'Other_latest_pay_slip', 'OtherLatestPaySlip');

                    $allValid =$course && $iiumCourse;
                    if ($scenario === 'requiredValidate') {
                        $model->Status = 10;
                    }

                        if($model->save($this->request->post('saveWithoutValidation') === 'validate')&& $allValid){
                            $transaction->commit();
                            Yii::$app->session->setFlash('success', 'Application created successfully.');
                            return $this->redirect(['index', 'ID' => $model->ID]);
                        }
                        else{
                            throw new Exception('Failed to save the main model.');
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
            'coursesData' => $coursesData,
            'iiumCoursesData' => $iiumCoursesData
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

        if ($model->Status !== 3 && $model->Status !== null) {
            Yii::$app->session->setFlash('error',
                "Your application on process now, Can't update your INFO during that.");
            // Redirect to a different page or reload the current page
            return $this->redirect(['outbound/index']); // Replace 'controller/action' with the appropriate route
        }

        $coursesData = Courses::find()->where(['student_id' => $ID])->all();

        $iiumCoursesData = Iiumcourse::find()->where(['student_id' => $ID])->all();

        if ($model->load($this->request->post())) {
            // Set the scenario based on the request
            $scenario = $model->scenario = $this->request->post('saveWithoutValidation') === 'validate' ? 'requiredValidate' : 'default';
            $isUndergraduate = $model->Academic_lvl_edu === 'UG'? true : false;
            $course =  courseSavor($coursesData, 'CoursesModel', $scenario, $isUndergraduate);
            $iiumCourse = courseSavor($iiumCoursesData, 'IiumCoursesModel', $scenario, $isUndergraduate);

            fileHandler($model,'Offer_letter', 'OfferLetter');
            fileHandler($model,'Academic_transcript', 'AcademicTranscript');
            fileHandler($model,'Program_brochure', 'ProgramBrochure');
            fileHandler($model,'Latest_pay_slip', 'LatestPaySlip');
            fileHandler($model,'Other_latest_pay_slip', 'OtherLatestPaySlip');

            $transaction = Yii::$app->db->beginTransaction();
            $allValid =$course && $iiumCourse;
            if ($scenario === 'requiredValidate') {
                $model->Status = 10;
            }

                try {
                    if($model->save($this->request->post('saveWithoutValidation') === 'validate')&& $allValid){
                        $transaction->commit();
                        Yii::$app->session->setFlash('success', 'Application created successfully.');
                        return $this->redirect(['index', 'ID' => $model->ID]);
                    }
                    else{
                        throw new Exception('Failed to save the main model.');
                    }
                } catch (Exception $e) {
                    $transaction->rollBack();
                    Yii::error($e->getMessage());
                }




        }

        return $this->render('update', [
            'model' => $model,
            'coursesData' => $coursesData,
            'iiumCoursesData' => $iiumCoursesData
        ]);
    }

    public function actionUpload($ID)
    {
        $model = Outbound::findOne($ID);

        if ($model->Status !== 41 && $model->Status !== 71) {
            Yii::$app->session->setFlash('error',
                'You already submitted your documents. Cannot update any documents now.');
            return $this->redirect(['outbound/index']);
        }
        $baseUploadPath = Yii::getAlias('@common/uploads');
        if (Yii::$app->request->isPost) {
            $transaction = Yii::$app->db->beginTransaction();

            try {
                // Handle uploads associated with the Outbound model
                $filesToUpdate = [
                    'Proof_of_sponsorship' => 'ProofOfSponsorship', 'Proof_insurance_cover' => 'ProofInsuranceCover',
                    'Letter_of_indemnity' => 'LetterOfIndemnity', 'Flight_ticket' => 'FlightTicket'
                ];

                foreach ($filesToUpdate as $attribute => $fileNamePrefix) {
                    $file = UploadedFile::getInstance($model, $attribute);
                    if ($file) {

                        $creationYearLastTwoDigits = date('y', strtotime(date('Y-m-d H:i:s')));
                        $fileName = $creationYearLastTwoDigits.'_'.$model->ID.'_'.$fileNamePrefix.'.'.$file->extension;
                        $filePath = $baseUploadPath.'/'.$model->ID.'/'.$fileName;

                        // Create directory if not exists
                        if (!file_exists(dirname($filePath))) {
                            mkdir(dirname($filePath), 0777, true);
                        }

                        $file->saveAs($filePath);
                        $model->$attribute = $fileName; // Update the model attribute with the new file name
                    }
                }
                fileHandler($model,'Proof_of_sponsorship', 'ProofOfSponsorship');
                fileHandler($model,'Proof_insurance_cover', 'ProofInsuranceCover');
                fileHandler($model,'Letter_of_indemnity', 'LetterOfIndemnity');
                fileHandler($model,'Flight_ticket', 'FlightTicket');

                $outFilesModel = new OutFiles();
                $outFilesModel->location = UploadedFile::getInstances($outFilesModel, 'location');
                OutFiles::deleteAll(['Student_ID' => $model->ID]);
                foreach ($outFilesModel->location as $key => $file) {

                    $creationYearLastTwoDigits = date('y', strtotime(date('Y-m-d H:i:s')));
                    $fileName = $creationYearLastTwoDigits.'_'.$model->ID.'_File_'.($key + 1).'.'.$file->extension;
                    $filePath = $baseUploadPath.'/'.$model->ID.'/after/'.$fileName;

                    // Create directory if not exists
                    if (!file_exists(dirname($filePath))) {
                        mkdir(dirname($filePath), 0777, true);
                    }

                    $file->saveAs($filePath);
                    $model->$attribute = $fileName; // Update the model attribute with the new file name


                    // Save the file information to the database
                    $outFile = new OutFiles();
                    $outFile->Student_ID = $model->ID;
                    $outFile->location = $fileName; // Set the location attribute
                    $outFile->save(false);
                }
                if ($model->Status === 41) {
                    $model->Status = 51;
                }
                if ($model->Status === 71) {
                    $model->Status = 81;
                }

                // Save the changes in the Outbound model
                if ($model->validate() && $model->save()) {
                    // Handle uploads associated with the OutFiles model
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



// Your existing actionUpload method with modifications

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

    public function actionGetRecord($id)
    {
        Yii::$app->response->format = Response::FORMAT_JSON;

        $model = Outbound::findOne($id);

        return [
            'Proof_of_sponsorship' => $model->Proof_of_sponsorship,
            'Proof_insurance_cover' => $model->Proof_insurance_cover,
            'Letter_of_indemnity' => $model->Letter_of_indemnity, 'Flight_ticket' => $model->Flight_ticket,
        ];
    }
}
