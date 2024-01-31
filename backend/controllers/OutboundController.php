<?php

namespace backend\controllers;

use backend\views\outbound\outboundSearch;
use common\models\Courses;
use common\models\EmailTemplate;
use common\models\Iiumcourse;
use common\models\Kcdio;
use common\models\Log;
use common\models\Outbound;
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
 * OutboundController implements the CRUD actions for Outbound model.
 * It manages the outbound operations such as viewing, creating, updating, and deleting outbound records.
 * Additionally, it provides actions for searching, displaying logs, and performing custom actions like accept/ reject/ resend on outbound records.
 * as well as exporting records to spreadsheets.
 */
class OutboundController extends Controller
{

    //region CONST variables
    const inprocess = 10;
    const redirected_to_hod = 1;
    const accepted_hod = 11;
    const redirected_to_dean = 21;
    const accepted_dean = 31;
    const redirected_to_student = 41;
    const documents_uploaded_from_student = 51;
    const application_accepted = 61;
    const application_not_complete = 3;
    const application_rejected_hod = 12;
    const application_rejected_dean = 32;


    const template_approval_process = 7;
    const template_upload_document_before = 8;
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
                            'google-drive', 'download-all', 'download-after', 'actionDeleteMultiple'
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

        $searchModel = new outboundSearch();
        $statusModel = new Status();
        $dataProvider = $searchModel->search($this->request->queryParams);

        $dataProvider->query->andWhere([
            'and', ['EXTRACT(YEAR FROM created_at)' => $year], ['not', ['Status' => null]]
        ]);
        $dataProvider->sort->defaultOrder = ['updated_at' => SORT_DESC];

        $dataProvider->pagination = [
            'pageSize' => 10,
        ];

        return $this->render("index", [
            'searchModel' => $searchModel, 'dataProvider' => $dataProvider, 'status' => $statusModel,
        ]);
    }

    /**
     * Displays details of a specific outbound record.
     * @param  integer  $ID  The ID of the outbound record to view
     * @return string The rendering result of the view
     * @throws NotFoundHttpException If the specified outbound record does not exist
     */
    public function actionView($ID)
    {

        $student = Outbound::findOne($ID); // Retrieve the student based on the ID

        if (!$student) {
            throw new NotFoundHttpException('The requested student does not exist.');
        }

        $personInChargeId = $student->Person_in_charge_ID;
        $modelPoc1 = Poc::findOne(['id' => $personInChargeId]);

        $deanId = $student->Dean_ID;
        $modelPoc2 = Poc::findOne(['id' => $deanId]);

        $courses = Courses::find()->where(['student_id' => $student->ID])->all();
        $iiumcourses = Iiumcourse::find()->where(['student_id' => $student->ID])->all();

        return $this->render("view", [
            "model" => $student, "modelPoc1" => $modelPoc1, "modelPoc2" => $modelPoc2, "courses" => $courses,
            'iiumcourses' => $iiumcourses,
        ]);
    }

    /**
     * Creates a new outbound record.
     * @return string|Response
     */
    public function actionCreate()
    {
        $model = new Outbound();

        if ($model->load($this->request->post()) && $model->save()) {
            $model->Status = 10;
            if ($model->save()) {
                return $this->redirect(["view", "ID" => $model->ID]);
            }
        } else {
            $model->loadDefaultValues();
        }

        return $this->render("create", ["model" => $model]);
    }

    /**
     * Displays a search form and search results for outbound records.
     * @return string The rendering result of the search view
     */
    public function actionSearch()
    {
        $searchModel = new outboundSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);
        $dataProvider->pagination = [
            'pageSize' => 5,
        ];
        return $this->render("search", ["searchModel" => $searchModel, "dataProvider" => $dataProvider,]);
    }

    /**
     * Updates an existing outbound record.
     * @param  integer  $ID  The ID of the outbound record to update
     * @return string|Response
     * @throws ForbiddenHttpException If the user is not allowed to perform the action
     */
    public function actionUpdate($ID)
    {
        if (Yii::$app->user->can('superAdmin')) {
            $model = $this->findModel($ID);

            if ($model->load($this->request->post()) && $model->save()) {
                return $this->redirect(["view", "ID" => $model->ID]);
            }

            return $this->render("update", ["model" => $model]);
        } else {
            throw new ForbiddenHttpException('You are not allowed to perform this action.');
        }
    }

    /**
     * Finds the specified outbound record based on its ID.
     * @param  integer  $ID  The ID of the outbound record to find
     * @return Outbound|null The outbound record
     * @throws NotFoundHttpException If the specified outbound record does not exist
     */
    protected function findModel($ID)
    {
        $model = Outbound::findOne(["ID" => $ID]);
        if ($model === null) {
            throw new NotFoundHttpException("The requested page does not exist.");
        }
        return $model;
    }

    /**
     * Deletes an existing outbound record.
     * @param  integer  $ID  The ID of the outbound record to delete
     * @return string|Response
     * @throws ForbiddenHttpException If the user is not allowed to perform the action
     */
    public function actionDelete($ID)
    {
        if (Yii::$app->user->can('superAdmin')) {
            $this->findModel($ID)->delete();
            return $this->redirect(["index", 'year' => date("Y")]);
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
            Outbound::deleteAll(['ID' => $selectedIds]);

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
            'query' => Log::find()->where(['outbound_id' => $ID]), 'pagination' => [
                'pageSize' => 50, // Adjust the page size as needed
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
    /**
     * Downloads a specific file associated with an outbound record.
     * @param  integer  $id  The ID of the outbound record
     * @param  string  $file  The name of the file to download
     * @throws NotFoundHttpException If the specified file does not exist
     */
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

    /**
     * Downloads all files associated with an outbound record's 'after end mobility duration' directory as a zip archive.
     * @param  integer  $id  The ID of the outbound record
     * @throws ServerErrorHttpException If an error occurs while creating the zip archive
     */
    public function actionDownloadAfter($id)
    {
        $recordPath = $this->getRecordPath($id, 'after');
        $zipFilePath = $this->createZipArchive($recordPath, $id);

        $this->sendZipFile($zipFilePath);
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
        // Check if the request is a POST request
        if ($this->request->isPost) {
            // Get the selected person's ID from the POST data
            $selectedPersonId = $this->request->post("selectedPersonId");
            // Find the corresponding person model based on the selected ID
            $personModel = Poc::findOne($selectedPersonId);
            // Map different statuses to their corresponding next status
            $statusMappings = [
                self::inprocess => self::redirected_to_hod, self::accepted_hod => self::redirected_to_dean,
                self::accepted_dean => self::redirected_to_student,
                self::documents_uploaded_from_student => self::application_accepted,
            ];
            // Check if the model's status exists in the mappings
            if (isset($statusMappings[$model->Status])) {
                $model->Status = $statusMappings[$model->Status];
            }
            // Update model properties based on the new status
            switch ($model->Status) {
                case self::redirected_to_hod:
                    $model->Token = Yii::$app->security->generateRandomString(32);
                    $model->setAttribute('Person_in_charge_ID', $selectedPersonId);
                    $template = self::template_approval_process;
                    break;

                case self::redirected_to_dean:
                    $model->Token = Yii::$app->security->generateRandomString(32);
                    $model->setAttribute('Dean_ID', $selectedPersonId);
                    $template = self::template_approval_process;
                    break;

                case self::redirected_to_student:
                    $personModel = null;
                    $model->Token = null;
                    $template = self::template_upload_document_before;
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
                $this->sendEmail($model, $personModel, $model->Token, $template, null);
                return $this->redirect(["index", 'year' => date("Y")]);
            }
        }
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
            // Get the new status and rejection reason from the POST data
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

        $statusMappings = [
            self::inprocess => self::application_not_complete,
            self::documents_uploaded_from_student => self::redirected_to_student,
        ];

        // Check if the model's status exists in the mappings
        if (isset($statusMappings[$model->Status])) {
            $model->Status = $statusMappings[$model->Status];
        }

        if ($this->request->isPost) {
            $model->temp = $this->request->post("reason");

            if ($model->save()) {
                $this->sendEmail($model, null, $model->Token, self::template_incomplete, $model->temp);
                return $this->redirect(["index", 'year' => date("Y")]);
            }
        }
    }

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
                case self::application_rejected_hod:
                    $modelPoc = Poc::findOne(['id' => $model->Person_in_charge_ID]);
                    $model->Status = self::redirected_to_hod;
                    break;

                case self::application_rejected_dean:
                    $modelPoc = Poc::findOne(['id' => $model->Dean_ID]);
                    $model->Status = self::redirected_to_dean;
                    break;

                default:
                    // If $model->Status doesn't match any case, keep the original values
                    break;
            }
        }

        if ($model->save()) {
            $this->sendEmail($model, $modelPoc, $model->Token, self::template_reconsider, $model->temp);
            return $this->redirect(["index", 'year' => date("Y")]);
        }
    }

   //endregion

    /**
     * Sends an email based on the provided parameters and template.
     *
     * @param mixed $model The application model object representing the data for the email.
     * @param mixed $personModel The person in charge model object, if available, to personalize the email.
     * @param string $token The token to be included in the email link.
     * @param int $templateId The ID of the email template to be used for the email content.
     * @param string $reason The reason to be included in the email body.
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

        // Initialize $viewLink to null as a default value
        $viewLink = null;

        switch ($model->Status) {
            case self::redirected_to_hod:
            case self::application_rejected_hod:
                $viewLink = Yii::$app->urlManager->createAbsoluteUrl([
                    'hodworkflow/view', 'ID' => $model->ID, 'token' => $token
                ]);
                break;

            case self::redirected_to_dean:
            case self::application_rejected_dean:
                $viewLink = Yii::$app->urlManager->createAbsoluteUrl([
                    'workflow/view', 'ID' => $model->ID, 'token' => $token
                ]);
                break;

            case self::redirected_to_student:
                // $viewLink is already set to null as the default value
                break;

            default:
                // If $model->Status doesn't match any case, keep $viewLink as null
                break;
        }


        if ($personModel != null) {
            // Replace placeholders in the email body with personModel data
            $body = str_replace('{recipientName}', $personModel->name, $body);
            $body = str_replace('{reason}', $reason, $body);
            $body = str_replace('{link}', $viewLink, $body);

            // Create mailer instance with personModel data
            $mailer = Yii::$app->mailer->compose([
                    'html' => '@backend/views/email/emailTemplate.php'
                ],[
                    'subject' => $emailTemplate->subject,
                  'recipientName' => $personModel->name,
                  'viewLink' => $viewLink,
                  'reason' => $reason,
                   'body' => $body
            ])->setFrom(["noreply@example.com" => "My Application"])
                ->setTo($personModel->email);

            // Add CC recipients if available and valid
            if (!empty($personModel->email_cc) && filter_var($personModel->email_cc, FILTER_VALIDATE_EMAIL)) {
                $mailer->setCc($personModel->email_cc);
            }

            // Check if additional CC is available and valid
            if (!empty($personModel->email_cc_additional) && filter_var($personModel->email_cc_additional, FILTER_VALIDATE_EMAIL)) {
                // Set CC recipients based on the availability and validity of both primary and additional CC
                $ccRecipients = filter_var($personModel->email_cc_additional, FILTER_VALIDATE_EMAIL)
                    ? [$personModel->email_cc, $personModel->email_cc_additional]
                    : $personModel->email_cc_additional;

                $mailer->setCc($ccRecipients);
            }
        } else {
            // Replace placeholders in the email body with model data
            $body = str_replace('{recipientName}', $model->Name, $body);
            $body = str_replace('{reason}', $reason, $body);

            // Create mailer instance with model data
            $mailer = Yii::$app->mailer->compose([
                'html' => '@backend/views/email/emailTemplate.php'
            ], [
                'subject' => $emailTemplate->subject, 'recipientName' => $model->Name, 'viewLink' => $viewLink,
                'reason' => $reason, 'body' => $body
            ])->setFrom(["noreply@example.com" => "My Application"])->setTo($model->Email);
        }

        // Set subject and send the email
        $mailer->setSubject($emailTemplate->subject)->send();
    }
    /**
     * Action to export Outbound data to Excel for a specific year.
     *
     * @param int $year The year for which data should be exported.
     *
     * @return void
     */
    public function actionExportExcel($year)
    {
        require Yii::getAlias('@common').'/Helpers/helper.php';
        // Set up data provider with your query
        $dataProvider = new ActiveDataProvider([
            'query' => Outbound::find()->where([
                'and', ['EXTRACT(YEAR FROM created_at)' => $year], ['not', ['Status' => 2]]
            ]), 'pagination' => false,
        ]);

        // Create a new PhpSpreadsheet object
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();

        $sheet->setCellValue('B1',
            'Internationalisation of Academic Program: (Outbound)')->getStyle('B1')->getFont()->setBold(true);

        // Set column headers
        $sheet->setCellValue('A3', 'No')->setCellValue('B3', 'Student Name')->setCellValue('C3',
            'Studnet ID')->setCellValue('D3', 'Program')->setCellValue('E3', 'Type of Programme')->setCellValue('F3',
            'Name of Outbound University')->setCellValue('G3', 'Country')->setCellValue('H3',
            'From')->setCellValue('I3', "To")->setCellValue('J3', 'K/C/D/I/O');

        for ($col = 'A'; $col !== 'K'; $col++) {
            $sheet->getStyle($col.'3')->applyFromArray([
                'font' => [
                    'bold' => true,
                ], 'alignment' => [
                    'horizontal' => Alignment::HORIZONTAL_CENTER, 'vertical' => Alignment::VERTICAL_CENTER,
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
                    $sheet->getColumnDimension($col)->setWidth(9);
                    break;
                case 'D':
                    $sheet->getColumnDimension($col)->setWidth(35);
                    break;
                case 'E':
                    $sheet->getColumnDimension($col)->setWidth(13);
                    break;
                case 'F':
                    $sheet->getColumnDimension($col)->setWidth(50);
                    break;
                case 'G':
                    $sheet->getColumnDimension($col)->setWidth(17);
                    break;
                case 'H':
                    $sheet->getColumnDimension($col)->setWidth(15);
                    break;
                case 'I':
                    $sheet->getColumnDimension($col)->setWidth(15);
                    break;
                case 'J':
                    $sheet->getColumnDimension($col)->setWidth(12);
                    break;

            }
        }
        // Populate data
        $row = 4;
        foreach ($dataProvider->getModels() as $model) {
            $sheet->setCellValue('A'.$row, $row - 3)->setCellValue('B'.$row, $model->Name)->setCellValue('C'.$row,
                $model->Matric_Number)->setCellValue('D'.$row, $model->Type_mobility_program)->setCellValue('E'.$row,
                getCredit($model->credit_transfer_availability))->setCellValue('F'.$row,
                $model->Host_university_name)->setCellValue('G'.$row,
                getCountry($model->Country_host_university))->setCellValue('H'.$row,
                $model->Mobility_from)->setCellValue('I'.$row,
                $model->Mobility_until)//                ->setCellValue('J' . $row, $model->Mobility_from)
            ;
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
            'query' => Outbound::find()->select([
                'Country_host_university AS country', 'COUNT(*) AS count'
            ])->groupBy('country'), 'pagination' => false,
        ]);

        $countryCounts = [];

        foreach ($dataProvider->getModels() as $model) {
            $country = getCountry($model['Country_host_university']);

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
