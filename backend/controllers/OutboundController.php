<?php

namespace backend\controllers;

use backend\views\outbound\outboundSearch;
use common\models\Courses;
use common\models\Iiumcourse;
use common\models\Kcdio;
use common\models\Outbound;
use common\models\Poc;
use common\models\Status;
use Throwable;
use Yii;
use yii\base\Exception;

use yii\db\StaleObjectException;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;
use yii\web\Response;

class OutboundController extends Controller
{
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::class, 'rules' => [
                    [
                        'actions' => [
                            'index', 'view', 'update', 'delete', 'action', 'create', 'search', 'accept', 'reject',
                            'load-people', 'dean-approval', 'resend', 'download', 'complete'
                        ], 'allow' => true, 'roles' => ['@'],
                    ],
                ],
            ], 'verbs' => ['class' => VerbFilter::class, 'actions' => ['delete' => ['POST']],],
        ];
    }

    public function actionIndex()
    {
        $searchModel = new outboundSearch();
        $statusModel = new Status();
        $dataProvider = $searchModel->search($this->request->queryParams);
        $dataProvider->pagination = [
            'pageSize' => 5,
        ];

        // Exclude records with null status
        $dataProvider->query->andWhere(['not', ['Status' => null]]);

        return $this->render("index",
            ['searchModel' => $searchModel, 'dataProvider' => $dataProvider, 'status' => $statusModel]);
    }

    public function actionView($ID)
    {
        // Assuming you pass the student ID to the action
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
            "model" => $student,
            "modelPoc1" => $modelPoc1,
            "modelPoc2" => $modelPoc2,
            "courses" => $courses,
            'iiumcourses' => $iiumcourses,
        ]);
    }


    public function actionDownload($id, $file)
    {
        $filePath = 'C:\xampp\htdocs\playground1\frontend\uploads/'.$file;
        Yii::info("File Path: ".$filePath, "fileDownload");
        if (file_exists($filePath)) {
            Yii::$app->response->sendFile($filePath);
        } else {
            Yii::info("File not found: ".$file, "fileDownload");
            throw new NotFoundHttpException('The file does not exist.');
        }
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

    public function actionSearch()
    {
        $searchModel = new outboundSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);
        $dataProvider->pagination = [
            'pageSize' => 5,
        ];
        return $this->render("search", ["searchModel" => $searchModel, "dataProvider" => $dataProvider,]);
    }

    public function actionUpdate($ID)
    {
        $model = $this->findModel($ID);

        if ($model->load($this->request->post()) && $model->save()) {
            return $this->redirect(["view", "ID" => $model->ID]);
        }

        return $this->render("update", ["model" => $model]);
    }

    protected function findModel($ID)
    {
        $model = Outbound::findOne(["ID" => $ID]);
        if ($model === null) {
            throw new NotFoundHttpException("The requested page does not exist.");
        }
        return $model;
    }

    /**
     * @throws Throwable
     * @throws StaleObjectException
     * @throws ForbiddenHttpException
     * @throws NotFoundHttpException
     */
    public function actionDelete($ID)
    {
        if (Yii::$app->user->can('superAdmin')) {
            $this->findModel($ID)->delete();
            return $this->redirect(["index"]);
        } else {
            throw new ForbiddenHttpException();
        }
    }

    public function actionAction($ID)
    {
        $modelKedio = new Kcdio();
        $modelPoc = new Poc();
        return $this->render("action",
            ["model" => $this->findModel($ID), "modelKedio" => $modelKedio, "modelPoc" => $modelPoc,]);
    }

    /**
     * @throws Exception
     * @throws NotFoundHttpException
     */
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
                $status = 1;
            } elseif ($model->Status === 11) {
                $status = 21;
            } elseif ($model->Status === 31) {
                $status = 41;
            } elseif ($model->Status === 51) {
                $status = 61;
            }

            if ($status === 1) {
                $token = Yii::$app->security->generateRandomString(32);
                $model->setAttribute('Person_in_charge_ID', $selectedPersonId);
                $path = '@backend/views/email/emailForwardToDepartment.php';
                $subject = 'take a look';
            } else {
                if ($status === 21) {
                    $token = Yii::$app->security->generateRandomString(32);
                    $model->setAttribute('Dean_ID', $selectedPersonId);
                    $path = '@backend/views/email/emailForwardToDepartment.php';
                    $subject = 'take a look';
                } else {
                    if ($status === 41 || $status === 61) {
                        $subject = 'Congratulations';
                        $path = '@backend/views/email/emailApprove.php';
                        $selectedPersonInChargeName = $model->Name;
                        $email = $model->Email;
                        $token = null;
                    }
                }
            }

            $model->token = $token;
            $reason = '';

            $model->Status = $status;
            if ($model->save()) {
                $this->sendEmailWithLink($model, $selectedPersonInChargeName, $email, $token, $path, $subject, $reason);

//                $model->save();
                return $this->redirect(["index"]);
            }
        }
    }

    public function sendEmailWithLink($model, $name, $email, $token, $path, $subject, $reason)
    {

        $recipientEmail = $email;
        $recipientName = $name;
        $viewLink = '';
//1 for accept and 2 for reject
        if ($model->Status === 1 || $model->Status === 2) {
            $viewLink = Yii::$app->urlManager->createAbsoluteUrl([
                'hodworkflow/view', 'ID' => $model->ID, 'token' => $token
            ]);
            //21for accept and 2 for reject
        } elseif ($model->Status === 21 || $model->Status === 22) {
            $viewLink = Yii::$app->urlManager->createAbsoluteUrl([
                'workflow/view', 'ID' => $model->ID, 'token' => $token
            ]);
        } elseif ($model->Status === 41) {
            $viewLink = null;
        }

        Yii::$app->mailer->compose([
            'html' => $path
        ], [
            'subject' => $subject, 'recipientName' => $recipientName, 'viewLink' => $viewLink, 'reason' => $reason
        ])->setFrom(["noreply@example.com" => "My Application"])->setTo($recipientEmail)->setSubject($subject)->send();
    }

    public function actionReject($ID)
    {
        $model = $this->findModel($ID);
        $name = $model->Name;
        $email = $model->Email;
        $path = '@backend/views/email/emailReject.php';
        if ($this->request->isPost) {
            $status = intval($this->request->post("status"));
            $reason = $this->request->post("reason");

            $model->Status = $status;
            if ($model->save()) {
                $this->sendEmailToApplicant($model, $name, $email, $reason, $path);
                return $this->redirect(["index"]);
            }
        }
    }

    public function sendEmailToApplicant($model, $name, $email, $reason, $path)
    {
        $recipientEmail = $email;
        $recipientName = $name;

        $subject = 'Rejection message';


        Yii::$app->mailer->compose([
            'html' => $path
        ], [
            'subject' => $subject, 'recipientName' => $recipientName, 'reason' => $reason
        ])->setFrom(["noreply@example.com" => "My Application"])->setTo($recipientEmail)->setSubject($subject)->send();

    }

    public function actionComplete($ID)
    {
        $model = $this->findModel($ID);
        $name = $model->Name;
        $email = $model->Email;
        if ($model->Status === 10) {
            $status = 3;
        } elseif ($model->Status === 51) {
            $status = 41;
        }
        $path = '@backend/views/email/emailReject.php';
        if ($this->request->isPost) {
            $reason = $this->request->post("reason");

            $model->Status = $status;
            if ($model->save()) {
                $this->sendEmailToApplicant($model, $name, $email, $reason, $path);
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
        $model->token = $token;
        $personInChargeId = $model->getAttribute('person-in-charge-ID');
        $deanId = $model->getAttribute('dean-ID');
        if ($this->request->isPost) {
            $reason = $this->request->post("reason");
            if ($model->Status === 12) {
                $modelPoc = Poc::findOne(['id' => $personInChargeId]);
                $model->Status = 1;
            } else {
                if ($model->Status === 32) {
                    $modelPoc = Poc::findOne(['id' => $deanId]);
                    $model->Status = 21;
                }
            }

            $path = '@backend/views/email/emailReconseder.php';
            $subject = 'Reconsideration';
            $this->sendEmailWithLink($model, $modelPoc->name, $modelPoc->email, $token, $path, $subject, $reason);
        }


        if ($model->save()) {
            return $this->redirect(["index"]);
        }
    }
}
