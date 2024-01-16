<?php

namespace backend\controllers;

use common\models\EmailTemplate;
use common\models\Iiumcourse;
use common\models\Inbound;
use backend\views\Inbound\inboundSearch;
use common\models\InCourses;
use common\models\Inlog;
use common\models\Kcdio;
use common\models\Log;
use common\models\Outbound;
use common\models\Poc;
use common\models\Status;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use Yii;
use yii\base\Exception;
use yii\data\ActiveDataProvider;
use yii\db\Expression;
use yii\db\Query;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Response;
require Yii::getAlias('@common').'/Helpers/helper.php';
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
                'class' => AccessControl::class, 'rules' => [
                    [
                        'actions' => [
                            'index', 'view', 'update', 'delete', 'action', 'create', 'search', 'accept', 'reject',
                            'load-people', 'dean-approval', 'resend', 'download', 'complete', 'log', 'export-excel'
                        ], 'allow' => true, 'roles' => ['@'],
                    ],
                ],
            ], 'verbs' => ['class' => VerbFilter::class, 'actions' => ['delete' => ['POST']],],
        ];
    }

    /**
     * Lists all Inbound models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new inboundSearch();
        $statusModel = new Status();


        $dataProvider = $searchModel->search($this->request->queryParams);
        $dataProvider->pagination = [
            'pageSize' => 10,
        ];

        // Exclude records with null status
        $dataProvider->query->andWhere(['and', ['EXTRACT(YEAR FROM created_at)' => date('Y')],['not', ['Status' => null]]]);
        $dataProvider->sort->defaultOrder = ['updated_at' => SORT_DESC];

        return $this->render("index",
            ['searchModel' => $searchModel, 'dataProvider' => $dataProvider, 'status' => $statusModel,]);
    }

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

// Function to get counts for each month

    /**
     * Displays a single Inbound model.
     * @param  int  $ID  ID
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($ID)
    {
        // Assuming you pass the student ID to the action
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
     */
    public function actionUpdate($ID)
    {
        $model = $this->findModel($ID);

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            return $this->redirect(['view', 'ID' => $model->ID]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
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
        $this->findModel($ID)->delete();

        return $this->redirect(['index']);
    }

    public function actionSearch()
    {
        $searchModel = new inboundSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);
        $dataProvider->pagination = [
            'pageSize' => 5,
        ];
        return $this->render("search", ["searchModel" => $searchModel, "dataProvider" => $dataProvider,]);
    }

    public function actionAction($ID)
    {
        $modelKedio = new Kcdio();
        $modelPoc = new Poc();
        return $this->render("action",
            ["model" => $this->findModel($ID), "modelKedio" => $modelKedio, "modelPoc" => $modelPoc,]);
    }

    public function actionLoadPeople()
    {
        $selectedValueFromKedio = Yii::$app->request->post("kcdio");
        Yii::info("Selected KCDIO: ".$selectedValueFromKedio, "ajax");

        $people = Poc::find()->where(["KCDIO" => $selectedValueFromKedio])->select([
            "id", "name", "email"
        ])->asArray()->all();

        Yii::info("People Data: ".json_encode($people), "ajax");

        Yii::$app->response->format = Response::FORMAT_JSON;
        return $people;
    }

    public function actionAccept($ID)
    {
        $model = $this->findModel($ID);
        $token = Yii::$app->security->generateRandomString(32);

        $subject = '';
        $emailCc2 = '';
        $emailCc = '';

        if ($this->request->isPost) {
            $status = intval($this->request->post("status"));
            $email = $this->request->post("emailAddress");
            $selectedPersonId = $this->request->post("selectedPersonId");
            $selectedPersonInCharge = $this->request->post("personInChargeDropdown");
            $selectedPersonInChargeName = null;

            if ($selectedPersonInCharge) {
                $personModel = Poc::findOne($selectedPersonInCharge);
                if ($personModel) {
                    $selectedPersonInChargeName = $personModel->name;
                    if ($personModel->email_cc != null) {
                        $emailCc = $personModel->email_cc;
                    }
                    if ($personModel->email_cc_additional != null) {
                        $emailCc2 = $personModel->email_cc_additional;
                    }
                }
            }

            if ($model->Status === 10) {
                $status = 5;
            } elseif ($model->Status === 15) {
                $status = 25;
            } elseif ($model->Status === 35) {
                $status = 45;
            } elseif ($model->Status === 55) {
                $status = 65;
            }

            if ($status === 5) {
                $token = Yii::$app->security->generateRandomString(32);
                $model->setAttribute('Kulliyyah', $selectedPersonId);
                $template = 3;
            } elseif ($status === 25) {
                $token = Yii::$app->security->generateRandomString(32);
                $model->setAttribute('msd_cps', $selectedPersonId);
                $template = 4;
            } elseif ($status === 45) {
                $token = null;
                $selectedPersonInChargeName = $model->Name;
                $template = 5;
                $email = $model->Email_address;
            } elseif ($status === 65) {
                $token = null;
                $selectedPersonInChargeName = $model->Name;
                $template = 10;
                $email = $model->Email_address;
            }

            $model->Token = $token;
            $reason = '';

            $model->Status = $status;
            if ($model->save()) {
                $this->sendEmailWithLink($model, $selectedPersonInChargeName, $email, $token, $template, $reason, $emailCc, $emailCc2);
                return $this->redirect(["index"]);
            }
        }
    }

    public function sendEmailWithLink($model, $name, $email, $token, $templateId, $reason, $emailCc1, $emailCc2)
    {

        $recipientEmail = $email;
        $recipientName = $name;
        $viewLink = '';


        $emailTemplate = EmailTemplate::findOne($templateId);
        if (!$emailTemplate) {
            // Handle the case where the template is not found
            return;
        }

        // Replace placeholders in the template content
        $body = $emailTemplate->body;


        if ($model->Status === 5 || $model->Status === 6) {
            $viewLink = Yii::$app->urlManager->createAbsoluteUrl([
                'kulliyyahworkflow/view', 'ID' => $model->ID, 'token' => $token
            ]);
            //21for accept and 2 for reject
        } elseif ($model->Status === 25 || $model->Status === 26) {
            $viewLink = Yii::$app->urlManager->createAbsoluteUrl([
                'higherworkflow/view', 'ID' => $model->ID, 'token' => $token
            ]);
        } elseif ($model->Status === 45) {
            $viewLink = null;
        }

        $body = str_replace('{recipientName}', $recipientName, $body);
        $body = str_replace('{link}', $viewLink, $body);
        $body = str_replace('{reason}', $reason, $body);

        $mailer = Yii::$app->mailer->compose([
            'html' => '@backend/views/email/emailTemplate.php'
        ], [
            'subject' => $emailTemplate->subject,
            'recipientName' => $recipientName,
            'viewLink' => $viewLink,
            'reason' => $reason,
            'body' => $body
        ])->setFrom(["noreply@example.com" => "My Application"])
            ->setTo($recipientEmail);

        if (!empty($emailCc1) && filter_var($emailCc1, FILTER_VALIDATE_EMAIL)) {
            $mailer->setCc($emailCc1);
        }

        if(!empty($emailCc2) && filter_var($emailCc2, FILTER_VALIDATE_EMAIL)){
            if(empty($emailCc1) || !filter_var($emailCc1,FILTER_VALIDATE_EMAIL)){
                $mailer->setCc($emailCc2);
            }else{
                $mailer->setCc([$emailCc1, $emailCc2]);
            }
        }

        $mailer->setSubject($emailTemplate->subject)->send();
    }

    /**
     * @throws NotFoundHttpException
     */
    public function actionReject($ID)
    {
        $model = $this->findModel($ID);
        $name = $model->Name;
        $email = $model->Email_address;

        $templateId = 2;

        if ($this->request->isPost) {
            $status = intval($this->request->post("status"));
            $reason = $this->request->post("reason");

            $model->temp = $reason;
            $model->Status = $status;
            if ($model->save()) {
                $this->sendEmailToApplicant($name, $email, $reason, $templateId);
                return $this->redirect(["index"]);
            }
        }
    }


    //accept, reject, resend, email

    public function sendEmailToApplicant($name, $email, $reason, $templateId)
    {
        $recipientEmail = $email;
        $recipientName = $name;

        $emailTemplate = EmailTemplate::findOne($templateId);
        if (!$emailTemplate) {
            // Handle the case where the template is not found
            return;
        }

        // Replace placeholders in the template content
        $body = $emailTemplate->body;

        $body = str_replace('{recipientName}', $recipientName, $body);
        $body = str_replace('{reason}', $reason, $body);


        Yii::$app->mailer->compose([
            'html' => '@backend/views/email/emailTemplate.php'
        ], [
            'subject' => $emailTemplate->subject, 'recipientName' => $recipientName, 'reason' => $reason,
            'body' => $body
        ])->setFrom(["noreply@example.com" => "My Application"])->setTo($recipientEmail)->setSubject($emailTemplate->subject)->send();

    }

    public function actionComplete($ID)
    {
        $model = $this->findModel($ID);
        $name = $model->Name;
        $email = $model->Email_address;
        if ($model->Status === 10) {
            $status = 7;
        } elseif ($model->Status === 55) {
            $status = 45;
        }
        $templateId = 1;

        if ($this->request->isPost) {
            $reason = $this->request->post("reason");
            $model->temp = $reason;
            $model->Status = $status;
            if ($model->save()) {
                $this->sendEmailToApplicant($name, $email, $reason, $templateId);
                return $this->redirect(["index"]);
            }
        }
    }

    /**
     * @throws Exception
     * @throws NotFoundHttpException
     */
    public function actionResend($ID)
    {
        $token = Yii::$app->security->generateRandomString(32);

        $model = $this->findModel($ID);
        $model->Token = $token;
        $kulliyyah = $model->getAttribute('Kulliyyah');
        $msd_cps = $model->getAttribute('msd_cps');

        if ($this->request->isPost) {
            $reason = $this->request->post("reason");
            if ($model->Status === 16) {
                $modelPoc = Poc::findOne(['id' => $kulliyyah]);
                $model->Status = 5;
            } else {
                if ($model->Status === 36) {
                    $modelPoc = Poc::findOne(['id' => $msd_cps]);
                    $model->Status = 25;
                }
            }

            $templateId = 11;

            $this->sendEmailWithLink($model, $modelPoc->name, $modelPoc->email, $token, $templateId, $reason, $modelPoc->email_cc, $modelPoc->email_cc_additional);
        }

        $model->temp = $reason;
        if ($model->save()) {
            return $this->redirect(["index"]);
        }
    }
    
    public function actionDownload($id, $file)
    {
        $baseUploadPath = Yii::getAlias('@common/uploads');
        $filePath = $baseUploadPath.'/'.$id.'/'.$file;
        Yii::info("File Path: ".$filePath, "fileDownload");
        if (file_exists($filePath)) {
            Yii::$app->response->sendFile($filePath);
        } else {
            Yii::info("File not found: ".$file, "fileDownload");
            throw new NotFoundHttpException('The file does not exist.');
        }
    }

    public function actionExportExcel($year)
    {
        // Set up data provider with your query
        $dataProvider = new ActiveDataProvider([
            'query' => Inbound::find()->where(['and',['EXTRACT(YEAR FROM created_at)' => $year],['not',['Status'=> 6]]]),
            'pagination' => false,
        ]);

        // Create a new PhpSpreadsheet object
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();

        $sheet->setCellValue('B1', 'Internationalisation of Academic Program: (Inbound)')
            ->getStyle('B1')
            ->getFont()
            ->setBold(true);

        // Set column headers
        $sheet->setCellValue('A3', 'No')
            ->setCellValue('B3', 'Student Name')
            ->setCellValue('C3', 'Program')
            ->setCellValue('D3','Type of Programme')
            ->setCellValue('E3', 'Name of Outbound University')
            ->setCellValue('F3', 'Country')
            ->setCellValue('G3', 'From')
            ->setCellValue('H3', "To")
            ->setCellValue('I3', 'K/C/D/I/O');

        for ($col = 'A'; $col !== 'K'; $col++) {
            $sheet->getStyle($col . '3')->applyFromArray([
                'font' => [
                    'bold' => true,
                ],
                'alignment' => [
                    'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
                    'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER,
                ],
            ]);
            $sheet->getRowDimension('3')->setRowHeight(33);
            $sheet->getStyle($col . '3')->getAlignment()->setWrapText(true); ;

            switch ($col){
                case 'A':$sheet->getColumnDimension($col)->setWidth(5); break;
                case 'B':$sheet->getColumnDimension($col)->setWidth(50); break;
                case 'C':$sheet->getColumnDimension($col)->setWidth(35); break;
                case 'D':$sheet->getColumnDimension($col)->setWidth(13); break;
                case 'E':$sheet->getColumnDimension($col)->setWidth(50); break;
                case 'F':$sheet->getColumnDimension($col)->setWidth(17); break;
                case 'G':$sheet->getColumnDimension($col)->setWidth(15); break;
                case 'H':$sheet->getColumnDimension($col)->setWidth(15); break;
                case 'I':$sheet->getColumnDimension($col)->setWidth(12); break;

            }
        }
        // Populate data
        $row = 4;
        foreach ($dataProvider->getModels() as $model) {
            $sheet->setCellValue('A' . $row, $row - 3)
                ->setCellValue('B' . $row, $model->Name)
                ->setCellValue('C' . $row, $model->Propose_type_of_programme)
                ->setCellValue('D' . $row, getCredit($model->Propose_transfer_credit_hours))
                ->setCellValue('E' . $row, $model->Academic_home_university)
                ->setCellValue('F' .$row, getCountry($model->Country_of_origin))
                ->setCellValue('G' . $row, $model->Propose_duration_start)
                ->setCellValue('H' . $row, $model->Propose_duration_end)
                ->setCellValue('I' . $row, $model-> Propose_kulliyyah_applied)
            ;
            for ($col = 'A'; $col !== 'K'; $col++) {
                if ($col != 'B' || $row != 1) {
                    $style = $sheet->getStyle($col.$row);
                    $style->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);
                    $style->getAlignment()->setVertical(\PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER);
                }
            }
            $row++;
        }

        $row += 4;

        $dataCountry = new ActiveDataProvider([
            'query' => Inbound::find()
                ->select(['Country_of_origin AS country', 'COUNT(*) AS count'])
                ->groupBy('country'),
            'pagination' => false,
        ]);

        $countryCounts = [];

        foreach ($dataProvider->getModels() as $model) {
            $country = getCountry($model['Country_of_origin']);

            // Increment country count or initialize if not present
            $countryCounts[$country] = isset($countryCounts[$country]) ? $countryCounts[$country] + 1 : 1;
        }

// Display country counts
        foreach ($countryCounts as $country => $count) {
            $sheet->setCellValue('B' . $row, $country)
                ->setCellValue('C' . $row, $count);
            $row++;
        }

// Display total
        $sheet->setCellValue('B' . $row, 'Total')
            ->setCellValue('C' . $row, array_sum($countryCounts));



        // Create a writer
        $writer = new Xlsx($spreadsheet);

        // Set file path
        $filePath = Yii::getAlias('@runtime') . '/Outbound_Export_' . date('YmdHis') . '.xlsx';

        // Save the file
        $writer->save($filePath);

        // Provide download link
        Yii::$app->response->sendFile($filePath, 'Outbound_Export_' . date('YmdHis') . '.xlsx')->send();
        unlink($filePath); // Optionally, you can delete the file after sending it


    }
}
