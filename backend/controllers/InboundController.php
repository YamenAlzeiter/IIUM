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
use Yii;
use yii\base\Exception;
use yii\data\ActiveDataProvider;
use yii\db\Expression;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Response;

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
                            'load-people', 'dean-approval', 'resend', 'download', 'complete', 'log'
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
        $dataProvider->query->andWhere(['not', ['Status' => null]]);
        $dataProvider->sort->defaultOrder = ['updated_at' => SORT_DESC];

        return $this->render("index",
            [  'searchModel' => $searchModel, 'dataProvider' => $dataProvider, 'status' => $statusModel,]);
    }
    private function getMonthNames()
    {
        $months = [];
        for ($i = 1; $i <= 12; $i++) {
            $months[] = date("M", mktime(0, 0, 0, $i, 1));
        }
        return $months;
    }

// Function to get counts for each month
    private function getMonthlyCounts()
    {
        $data = (new \yii\db\Query())
            ->select([
                new Expression('EXTRACT(MONTH FROM created_at) AS month'),
                new Expression('COUNT(*) AS count')
            ])
            ->from('inbound')
            ->where(['not', ['Status' => null]])
            ->groupBy([new Expression('EXTRACT(MONTH FROM created_at)')])
            ->all();

        $counts = [];
        for ($i = 1; $i <= 12; $i++) {
            $found = false;
            foreach ($data as $entry) {
                if ((int)$entry['month'] === $i) {
                    $counts[] = (int)$entry['count'];
                    $found = true;
                    break;
                }
            }
            if (!$found) {
                $counts[] = 0;
            }
        }
        return $counts;
    }

// Function to get gender count
    private function getGenderCount($gender)
    {
        return (new \yii\db\Query())
            ->from('inbound')
            ->where(['Gender' => $gender])
            ->count();
    }
    public function actionLog($ID)
    {
        $logsDataProvider = new ActiveDataProvider([
            'query' => Inlog::find()->where(['outbound_id' => $ID]),
            'pagination' => [
                'pageSize' => 20, // Adjust the page size as needed
            ],
            'sort' => [
                'defaultOrder' => ['created_at' => SORT_DESC], // Display logs by creation time in descending order
            ],
        ]);

        return $this->render('log', [
            'logsDataProvider' => $logsDataProvider,
        ]);
    }



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


    //accept, reject, resend, email

    public function actionAccept($ID)
    {
        $model = $this->findModel($ID);
        $token = Yii::$app->security->generateRandomString(32);

        $subject = '';

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
                $this->sendEmailWithLink($model, $selectedPersonInChargeName, $email, $token, $template, $reason);
                return $this->redirect(["index"]);
            }
        }
    }

    public function sendEmailWithLink($model, $name, $email, $token, $templateId, $reason)
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

        Yii::$app->mailer->compose([
            'html' => '@backend/views/email/emailTemplate.php'
        ], [
            'subject' => $emailTemplate->subject, 'recipientName' => $recipientName, 'viewLink' => $viewLink,
            'reason' => $reason, 'body' => $body
        ])->setFrom(["noreply@example.com" => "My Application"])->setTo($recipientEmail)->setSubject($emailTemplate->subject)->send();
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
            'subject' => $emailTemplate->subject, 'recipientName' => $recipientName, 'reason' => $reason, 'body' => $body
        ])->setFrom(["noreply@example.com" => "My Application"])->setTo($recipientEmail)->setSubject($emailTemplate->subject)->send();

    }

    public function actionComplete($ID)
    {
        $model = $this->findModel($ID);
        $name = $model->Name;
        $email = $model->Email_address;
        if ($model->Status === 10) {
            $status = 7;
        } elseif ($model->Status === 51) {
            $status = 41;
        }
        $path = '@backend/views/email/emailReject.php';
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

            $templateId = 2;

            $this->sendEmailWithLink($model, $modelPoc->name, $modelPoc->email, $token, $templateId, $reason);
        }

        $model->temp = $reason;
        if ($model->save()) {
            return $this->redirect(["index"]);
        }
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
}
