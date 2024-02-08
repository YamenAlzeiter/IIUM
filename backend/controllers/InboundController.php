<?php

namespace backend\controllers;

use backend\views\Inbound\inboundSearch;
use common\models\EmailTemplate;
use common\models\Inbound;
use common\models\InCourses;
use common\models\Inlog;
use common\models\Kcdio;
use common\models\Poc;
use common\models\Status;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use Yii;
use yii\base\Exception;
use yii\data\ActiveDataProvider;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;
use yii\helpers\FileHelper;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;
use yii\web\Response;
use yii\web\ServerErrorHttpException;
use ZipArchive;

/**
 * InboundController implements the CRUD actions for Inbound model.
 * It manages the inbound operations such as viewing, creating, updating, and deleting inbound records.
 * Additionally, it provides actions for searching, displaying logs, and performing custom actions like accept/ reject/ resend on outbound records.
 * as well as exporting records to spreadsheets.
 */
class InboundController extends Controller
{
    //region CONST variables
    const inprocess = 10;
    const redirected_to_kulliyyah = 5;
    const accepted_kulliyyah = 15;
    const redirected_to_cps_amad = 25;
    const accepted_cps_amad = 35;
    const redirected_to_student = 45;
    const documents_uploaded_from_student = 55;
    const application_accepted = 65;
    const application_not_complete = 7;
    const application_rejected_kulliyyah = 16;
    const application_rejected_cps_amad = 36;


    const template_approval_process = 3;
    const template_issue_offer_letter = 4;
    const template_upload_payment_proof = 5;
    const template_congrats = 10;
    const template_reject = 2;
    const template_incomplete = 1;
    const template_reconsider = 11;

    //endregion
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::class, 'rules' => [
                    [
                        'actions' => [
                            'index', 'view', 'update', 'delete', 'action', 'create', 'search', 'accept', 'reject',
                            'load-people', 'dean-approval', 'resend', 'download', 'complete', 'log', 'export-excel',
                            'actionDeleteMultiple', 'download-all'
                        ], 'allow' => true, 'roles' => ['@'],
                    ], [
                        'actions' => ['delete-multiple'], // Allow the delete-multiple action
                        'allow' => true, 'roles' => ['@'],
                    ],
                ],
            ], 'verbs' => ['class' => VerbFilter::class, 'actions' => ['delete' => ['POST']],],
        ];
    }


    //region CRUD

    /**
     * Displays a list of outbound records.
     * @param  integer  $year  Year for filtering outbound records
     * @return string The rendering result of the index view
     */
    public function actionIndex($year)
    {
        $searchModel = new inboundSearch();
        $statusModel = new Status();
        $dataProvider = $searchModel->search($this->request->queryParams);

        // Exclude records with null status
        $dataProvider->query->andWhere([
            'and', ['EXTRACT(YEAR FROM created_at)' => $year], ['not', ['Status' => null]]
        ]);
        $dataProvider->sort->defaultOrder = ['updated_at' => SORT_DESC];

        $dataProvider->pagination = ['pageSize' => 10,];

        return $this->render("index",
            ['searchModel' => $searchModel, 'dataProvider' => $dataProvider, 'status' => $statusModel,]);
    }

    /**
     * Displays details of a specific outbound record.
     * @param  integer  $ID  The ID of the outbound record to view
     * @return string The rendering result of the view
     * @throws NotFoundHttpException If the specified outbound record does not exist
     */
    public function actionView($ID)
    {

        $student = Inbound::findOne($ID); // Retrieve the student based on the ID

        if (!$student) {
            throw new NotFoundHttpException('The requested student does not exist.');
        }

        $personInChargeId = $student->Kulliyyah;
        $modelPoc1 = Poc::findOne(['id' => $personInChargeId]);

        $deanId = $student->msd_cps;
        $modelPoc2 = Poc::findOne(['id' => $deanId]);

        $courses = InCourses::find()->where(['student_id' => $student->ID])->all();

        return $this->render("view", [
            "model" => $student, "modelPoc1" => $modelPoc1, "modelPoc2" => $modelPoc2, "courses" => $courses,
        ]);
    }

// Function to get gender count

    /**
     * Creates a new Inbound model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|Response
     */
    public function actionCreate()
    {
        $model = new Inbound();

        if ($this->request->isPost) {
            if ($model->load($this->request->post()) && $model->save()) {
                return $this->redirect(['view', 'ID' => $model->ID]);
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Inbound model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param  int  $ID  ID
     * @return string|Response
     * @throws NotFoundHttpException if the model cannot be found
     * @throws ForbiddenHttpException if the user is not allowed to perform the action
     */
    public function actionUpdate($ID)
    {
        if (Yii::$app->user->can('superAdmin')) {
            $model = $this->findModel($ID);

            if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
                return $this->redirect(['view', 'ID' => $model->ID]);
            }

            return $this->render('update', [
                'model' => $model,
            ]);
        } else {
            throw new ForbiddenHttpException('You are not allowed to perform this action.');
        }
    }

    /**
     * Finds the Inbound model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param  int  $ID  ID
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
     * Deletes an existing Inbound model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param  int  $ID  ID
     * @return Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($ID)
    {
        if (Yii::$app->user->can('superAdmin')) {
            $this->findModel($ID)->delete();
            return $this->redirect(['index', 'year' => date('Y')]);
        } else {
            throw new ForbiddenHttpException();
        }
    }

    /**
     * Deletes multiple outbound records.
     * @return array JSON response indicating success or failure
     */
    public function actionDeleteMultiple()
    {
        $selectedIds = Yii::$app->request->post('selection'); // Assuming 'selection' is the name of the checkbox column

        if (!empty($selectedIds)) {
            // Use Yii2 ActiveRecord to delete the selected records
            Inbound::deleteAll(['ID' => $selectedIds]);

            Yii::$app->response->format = Response::FORMAT_JSON;
            return ['success' => true];
        } else {
            Yii::$app->response->format = Response::FORMAT_JSON;
            return ['success' => false];
        }
    }
    //endregion
    //region CRUD ACTION
    /**
     * Display Action view.
     * @param  integer  $ID  The ID of the outbound record
     * @return string The rendering result of the action view
     */
    public function actionAction($ID)
    {
        $modelKedio = new Kcdio();
        $modelPoc = new Poc();
        return $this->render("action",
            ["model" => $this->findModel($ID), "modelKedio" => $modelKedio, "modelPoc" => $modelPoc,]);
    }

    /**
     * Displays logs associated with a specific outbound record.
     * @param  integer  $ID  The ID of the outbound record
     * @return string The rendering result of the log view
     */
    public function actionLog($ID)
    {
        $logsDataProvider = new ActiveDataProvider([
            'query' => Inlog::find()->where(['outbound_id' => $ID]), 'pagination' => [
                'pageSize' => 20, // Adjust the page size as needed
            ], 'sort' => [
                'defaultOrder' => ['created_at' => SORT_DESC], // Display logs by creation time in descending order
            ],
        ]);

        return $this->render('log', [
            'logsDataProvider' => $logsDataProvider,
        ]);
    }
//endregion
    //region Download Functionality
    public function actionDownload($id, $file)
    {
        $filePath = $this->getFilePath($id, $file);

        if (file_exists($filePath)) {
            Yii::$app->response->sendFile($filePath);
        } else {
            Yii::info("File not found: $file", "fileDownload");
            throw new NotFoundHttpException('The file does not exist.');
        }
    }

    /**
     * Helper method to get the full path of a specific file.
     * @param  integer  $id  The ID of the outbound record
     * @param  string  $file  The name of the file
     * @return string The full path of the file
     */
    private function getFilePath($id, $file)
    {
        $baseUploadPath = Yii::getAlias('@common/uploads');
        return $baseUploadPath."/$id/$file";
    }

    /**
     * Downloads all files associated with an outbound record as a zip archive.
     * @param  integer  $id  The ID of the outbound record
     * @throws ServerErrorHttpException If an error occurs while creating the zip archive
     */
    public function actionDownloadAll($id)
    {
        $recordPath = $this->getRecordPath($id);
        $zipFilePath = $this->createZipArchive($recordPath, $id);

        $this->sendZipFile($zipFilePath);
    }

    /**
     * Helper method to get the full path of the record directory.
     * @param  integer  $id  The ID of the outbound record
     * @param  string  $subDirectory  Optional subdirectory within the record directory
     * @return string The full path of the record directory
     * @throws NotFoundHttpException If the record directory does not exist
     */
    private function getRecordPath($id, $subDirectory = '')
    {
        $baseUploadPath = Yii::getAlias('@common/uploads');
        $recordPath = $baseUploadPath.'/'.$id.($subDirectory ? '/'.$subDirectory : '');

        if (!file_exists($recordPath) || !is_dir($recordPath)) {
            Yii::info("Record path not found: $recordPath", "fileDownloadAll");
            throw new NotFoundHttpException('The record does not exist.');
        }

        return $recordPath;
    }

    /**
     * Helper method to create a zip archive of files in a directory.
     * @param  string  $recordPath  The full path of the record directory
     * @param  integer  $id  The ID of the outbound record
     * @return string The full path of the created zip archive
     * @throws ServerErrorHttpException If an error occurs while creating the zip archive
     */
    private function createZipArchive($recordPath, $id)
    {
        if (!str_contains($recordPath, 'after')) {
            $name = "full_record_";
        } else {
            $name = "record_";
        }
        $tempDir = Yii::getAlias('@runtime/temp_zip');
        FileHelper::createDirectory($tempDir);

        $zipFileName = "$name$id.zip";
        $zipFilePath = "$tempDir/$zipFileName";

        try {
            $zip = new ZipArchive();
            if ($zip->open($zipFilePath, ZipArchive::CREATE | ZipArchive::OVERWRITE) === true) {
                $files = FileHelper::findFiles($recordPath);
                foreach ($files as $file) {
                    $relativePath = $this->getRelativePath($recordPath, $file);
                    $zip->addFile($file, $relativePath);
                }
                $zip->close();
            } else {
                throw new Exception('Unable to create zip archive.');
            }
        } catch (Exception $e) {
            Yii::info("Error creating zip archive: ".$e->getMessage(), "fileDownloadAll");
            throw new ServerErrorHttpException('An error occurred while creating the zip archive.');
        }

        return $zipFilePath;
    }

    private function getRelativePath($basePath, $file)
    {
        $basePath = rtrim($basePath, '/');
        $file = rtrim($file, '/');

        // Find the last occurrence of '/' to get the last folder
        $lastSlash = strrpos($file, '/');
        $lastFolder = substr($file, $lastSlash + 1);

        return $lastFolder;
    }

    /**
     * Helper method to send a zip file to the user and clean up temporary directory afterward.
     * @param  string  $zipFilePath  The full path of the zip file
     * @throws NotFoundHttpException
     */
    private function sendZipFile($zipFilePath)
    {
        if (file_exists($zipFilePath)) {
            Yii::$app->response->sendFile($zipFilePath, null, ['inline' => false])->on(Response::EVENT_AFTER_SEND,
                function ($event) use ($zipFilePath) {
                    // Clean up temporary directory after the file is sent
                    FileHelper::removeDirectory(dirname($zipFilePath));
                });
        } else {
            Yii::info("Zip file not found: $zipFilePath", "fileDownloadAll");
            throw new NotFoundHttpException('The zip file does not exist.');
        }
    }

    //endregion

    public function actionLoadPeople()
    {
        $selectedValueFromKedio = Yii::$app->request->post("kcdio");
        Yii::info("Selected KCDIO: ".$selectedValueFromKedio, "ajax");

        $people = Poc::find()->where(["KCDIO" => $selectedValueFromKedio])->select([
            "id", "name", "email", "email_cc", "name_cc1", "email_cc_additional", "name_cc2"
        ])->asArray()->all();

        Yii::info("People Data: ".json_encode($people), "ajax");

        Yii::$app->response->format = Response::FORMAT_JSON;
        return $people;
    }

    //region Process Actions

    /**
     * Accepts a request for approval and updates the model's status accordingly.
     *
     * @param  int  $ID  The unique identifier of the model to be processed.
     * @return mixed The response after processing the request.
     */
    public function actionAccept($ID)
    {
        $model = $this->findModel($ID);
        //Check if the request is a POST request
        if ($this->request->isPost) {
            //Get the selected person's ID from the POST data
            $selectedPersonId = $this->request->post("selectedPersonId");
            //Find the corresponding person model based on the selected ID
            $personModel = Poc::findOne($selectedPersonId);
            //Map different statuses to their corresponding next status
            $statusMappings = [
                self::inprocess => self::redirected_to_kulliyyah,
                self::accepted_kulliyyah => self::redirected_to_cps_amad,
                self::accepted_cps_amad => self::redirected_to_student,
                self::documents_uploaded_from_student => self::application_accepted
            ];
            //Check if the model's status exists in the mappings
            if (isset($statusMappings[$model->Status])) {
                $model->Status = $statusMappings[$model->Status];
            }
            //Update model properties based on the new status
            switch ($model->Status) {
                case self::redirected_to_kulliyyah:
                    $model->Token = Yii::$app->security->generateRandomString(32);
                    $model->setAttribute('Kulliyyah', $selectedPersonId);
                    $template = self::template_approval_process;
                    break;
                case self::redirected_to_cps_amad:
                    $model->Token = Yii::$app->security->generateRandomString(32);
                    $model->setAttribute('msd_cps', $selectedPersonId);
                    $template = self::template_issue_offer_letter;
                    break;
                case self::redirected_to_student:
                    $personModel = null;
                    $model->Token = null;
                    $template = self::template_upload_payment_proof;
                    break;
                case self::application_accepted:
                    $personModel = null;
                    $model->Token = null;
                    $template = self::template_congrats;
                    break;
                default:
                    // If $status doesn't match any case, keep the original values
                    break;
            }

            if ($model->save()) {
                $this->sendEmail($model, $personModel, $model->Token, $template, null,);
                return $this->redirect(["index", 'year' => date("Y")]);
            }
        }
    }

    /**
     * Sends an email based on the provided parameters and template.
     *
     * @param  mixed  $model  The application model object representing the data for the email.
     * @param  mixed  $personModel  The person in charge model object, if available, to personalize the email.
     * @param  string  $token  The token to be included in the email link.
     * @param  int  $templateId  The ID of the email template to be used for the email content.
     * @param  string  $reason  The reason to be included in the email body.
     *
     * @return void
     */
    public function sendEmail($model, $personModel, $token, $templateId, $reason)
    {
        $emailTemplate = EmailTemplate::findOne($templateId);

        if (!$emailTemplate) {
            // Handle the case where the template is not found
            return;
        }

        // Replace placeholders in the template content
        $body = $emailTemplate->body;

        //Initialize $viewLink to nulll as a default value
        $viewLink = null;

        switch ($model->Status) {
            case self::redirected_to_kulliyyah:
            case self::application_rejected_kulliyyah:
                $viewLink = Yii::$app->urlManager->createAbsoluteUrl([
                    'kulliyyahworkflow/view', 'ID' => $model->ID, 'token' => $token
                ]);
                break;

            case self::redirected_to_cps_amad:
                $viewLink = Yii::$app->urlManager->createAbsoluteUrl([
                    'higherworkflow/view', 'ID' => $model->ID, 'token' => $token
                ]);
                break;

            case self::redirected_to_student:
                // $viewLink is already set to null as the default value
                break;

            default:
                // If $model->Statue doesn't match any case, keep $viewLink as null
        }

        if ($personModel != null) {
            $body = str_replace('{recipientName}', $personModel->name, $body);
            $body = str_replace('{link}', $viewLink, $body);
            $body = str_replace('{reason}', $reason, $body);

            $mailer = Yii::$app->mailer->compose([
                'html' => '@backend/views/email/emailTemplate.php'
            ], [
                'subject' => $emailTemplate->subject, 'recipientName' => $personModel->name, 'viewLink' => $viewLink,
                'reason' => $reason, 'body' => $body
            ])->setFrom(["noreply@example.com" => "My Application"])->setTo($personModel->email);

            if (!empty($personModel->email_cc) && filter_var($personModel->email_cc, FILTER_VALIDATE_EMAIL)) {
                $mailer->setCc($personModel->email_cc);
            }
            // Check if additional CC is available and valid
            if (!empty($personModel->email_cc_additional) && filter_var($personModel->email_cc_additional,
                    FILTER_VALIDATE_EMAIL)) {
                //Set CC recipients based on the availability of both primary and additional CC
                $ccRecipients = filter_var($personModel->email_cc_additional, FILTER_VALIDATE_EMAIL) ? [
                    $personModel->email_cc, $personModel->email_cc_additional
                ] : $personModel->email_cc_additional;

                $mailer->setCc($ccRecipients);
            }
        } else {
            $body = str_replace('{recipientName}', $model->Name, $body);
            $body = str_replace('{reason}', $reason, $body);
            $mailer = Yii::$app->mailer->compose([
                'html' => '@backend/views/email/emailTemplate.php'
            ], [
                'subject' => $emailTemplate->subject, 'recipientName' => $model->Name, 'viewLink' => $viewLink,
                'reason' => $reason, 'body' => $body
            ])->setFrom(["noreply@example.com" => "My Application"])->setTo($model->Email_address);
        }

        //Set subject and send the email
        $mailer->setSubject($emailTemplate->subject)->send();
    }

    /**
     * Rejects a request and updates the model's status with a reason.
     *
     * @param  int  $ID  The unique identifier of the model to be rejected.
     * @return mixed The response after processing the rejection.
     */
    public function actionReject($ID)
    {
        $model = $this->findModel($ID);

        if ($this->request->isPost) {
            //Get the new status and rejection reason from the POST data
            $model->Status = intval($this->request->post("status"));
            $model->temp = $this->request->post("reason");

            if ($model->save()) {
                $this->sendEmail($model, null, $model->Token, self::template_reject, $model->temp);
                return $this->redirect(["index", 'year' => date("Y")]);
            }
        }
    }

    /**
     * Marks a request as incomplete and updates the model's status with a reason.
     *
     * @param  int  $ID  The unique identifier of the model to be marked as incomplete.
     * @return mixed The response after marking the request as incomplete.
     */
    public function actionComplete($ID)
    {
        $model = $this->findModel($ID);

        $statusMapping = [
            self::inprocess => self::application_not_complete,
            self::documents_uploaded_from_student => self::redirected_to_student,
        ];

        if (isset($statusMapping[$model->Status])) {
            $model->Status = $statusMapping[$model->Status];
        }

        if ($this->request->isPost) {
            $model->temp = $this->request->post("reason");

            if ($model->save()) {
                $this->sendEmail($model, null, $model->Token, self::template_incomplete, $model->temp);
                return $this->redirect(["index", 'year' => date("Y")]);
            }
        }
    }

    //endregion

    /**
     * Resends a request for reconsideration with a new token and reason.
     *
     * @param  int  $ID  The unique identifier of the model to be resent.
     * @return mixed The response after resending the request.
     */
    public function actionResend($ID)
    {
        $model = $this->findModel($ID);

        $model->Token = Yii::$app->security->generateRandomString(32);

        if ($this->request->isPost) {
            $model->temp = $this->request->post("reason");

            switch ($model->Status) {
                case self::application_rejected_kulliyyah:
                    $modelPoc = Poc::findOne(['id' => $model->Kulliyyah]);
                    $model->Status = self::redirected_to_kulliyyah;
                    break;

//                case self::application_rejected_cps_amad:
//                    $modelPoc = Poc::findOne(['id' => $model->msd_cps]);
//                    $model->Status = self::redirected_to_cps_amad;
//                    break;
                default:
                    //If $model->Status doesn't match any case, keep the original values
                    break;
            }
        }

        if ($model->save()) {
            $this->sendEmail($model, $modelPoc, $model->Token, self::template_reconsider, $model->temp);
            return $this->redirect(["index", 'year' => date("Y")]);
        }
    }

    /**
     * Action to export Outbound data to Excel for a specific year.
     *
     * @param  int  $year  The year for which data should be exported.
     *
     * @return void
     */
    public function actionExportExcel($year)
    {
        require Yii::getAlias('@common').'/Helpers/helper.php';
        // Set up data provider with your query
        $dataProvider = new ActiveDataProvider([
            'query' => Inbound::find()->where([
                'and', [
                    'or', ['EXTRACT(YEAR FROM "Propose_duration_start")' => $year],
                    ['EXTRACT(YEAR FROM "Propose_duration_end")' => $year],
                ], ['not', ['Status' => 6]]
            ]), 'pagination' => false,
        ]);

        // Create a new PhpSpreadsheet object
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();

        $sheet->setCellValue('B1',
            'Internationalisation of Academic Program: (Inbound)')->getStyle('B1')->getFont()->setBold(true);

        // Set column headers
        $sheet->setCellValue('A3', 'No')->setCellValue('B3', 'Student Name')->setCellValue('C3',
                'Program')->setCellValue('D3', 'Type of Programme')->setCellValue('E3',
                'Name of Outbound University')->setCellValue('F3', 'Country')->setCellValue('G3',
                'From')->setCellValue('H3', "To")->setCellValue('I3', 'K/C/D/I/O');

        for ($col = 'A'; $col !== 'K'; $col++) {
            $sheet->getStyle($col.'3')->applyFromArray([
                'font' => [
                    'bold' => true,
                ], 'alignment' => [
                    'horizontal' => Alignment::HORIZONTAL_CENTER,
                    'vertical' => Alignment::VERTICAL_CENTER,
                ],
            ]);
            $sheet->getRowDimension('3')->setRowHeight(33);
            $sheet->getStyle($col.'3')->getAlignment()->setWrapText(true);

            switch ($col) {
                case 'A':
                    $sheet->getColumnDimension($col)->setWidth(5);
                    break;
                case 'B':
                    $sheet->getColumnDimension($col)->setWidth(50);
                    break;
                case 'C':
                    $sheet->getColumnDimension($col)->setWidth(35);
                    break;
                case 'D':
                    $sheet->getColumnDimension($col)->setWidth(13);
                    break;
                case 'E':
                    $sheet->getColumnDimension($col)->setWidth(50);
                    break;
                case 'F':
                    $sheet->getColumnDimension($col)->setWidth(17);
                    break;
                case 'G':
                    $sheet->getColumnDimension($col)->setWidth(15);
                    break;
                case 'H':
                    $sheet->getColumnDimension($col)->setWidth(15);
                    break;
                case 'I':
                    $sheet->getColumnDimension($col)->setWidth(12);
                    break;

            }
        }
        // Populate data
        $row = 4;
        foreach ($dataProvider->getModels() as $model) {
            $sheet->setCellValue('A'.$row, $row - 3)->setCellValue('B'.$row, $model->Name)->setCellValue('C'.$row,
                    $model->Propose_type_of_programme)->setCellValue('D'.$row,
                    getCredit($model->Propose_transfer_credit_hours))->setCellValue('E'.$row,
                    $model->Academic_home_university)->setCellValue('F'.$row,
                    getCountry($model->Country_of_origin))->setCellValue('G'.$row,
                    $model->Propose_duration_start)->setCellValue('H'.$row,
                    $model->Propose_duration_end)->setCellValue('I'.$row, $model->Propose_kulliyyah_applied);
            for ($col = 'A'; $col !== 'K'; $col++) {
                if ($col != 'B' || $row != 1) {
                    $style = $sheet->getStyle($col.$row);
                    $style->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
                    $style->getAlignment()->setVertical(Alignment::VERTICAL_CENTER);
                }
            }
            $row++;
        }

        $row += 4;

        $dataCountry = new ActiveDataProvider([
            'query' => Inbound::find()->select([
                    'Country_of_origin AS country', 'COUNT(*) AS count'
                ])->groupBy('country'), 'pagination' => false,
        ]);

        $countryCounts = [];

        foreach ($dataProvider->getModels() as $model) {
            $country = getCountry($model['Country_of_origin']);

            // Increment country count or initialize if not present
            $countryCounts[$country] = isset($countryCounts[$country]) ? $countryCounts[$country] + 1 : 1;
        }

// Display country counts
        foreach ($countryCounts as $country => $count) {
            $sheet->setCellValue('B'.$row, $country)->setCellValue('C'.$row, $count);
            $row++;
        }

// Display total
        $sheet->setCellValue('B'.$row, 'Total')->setCellValue('C'.$row, array_sum($countryCounts));


        // Create a writer
        $writer = new Xlsx($spreadsheet);

        // Set file path
        $filePath = Yii::getAlias('@runtime').'/Outbound_Export_'.date('YmdHis').'.xlsx';

        // Save the file
        $writer->save($filePath);

        // Provide download link
        Yii::$app->response->sendFile($filePath, 'Outbound_Export_'.date('YmdHis').'.xlsx')->send();
        unlink($filePath); // Optionally, you can delete the file after sending it


    }
}
