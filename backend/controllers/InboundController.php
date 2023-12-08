<?php

namespace backend\controllers;

use common\models\Inbound;
use backend\views\Inbound\inboundSearch;
use common\models\Kcdio;
use common\models\Poc;
use common\models\Status;
use Yii;
use yii\base\Exception;
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
                            'load-people', 'dean-approval', 'resend', 'download', 'complete'
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
            'pageSize' => 5,
        ];

        // Exclude records with null status
        $dataProvider->query->andWhere(['not', ['Status' => null]]);

        return $this->render("index",
            ['searchModel' => $searchModel, 'dataProvider' => $dataProvider, 'status' => $statusModel]);
    }


    /**
     * Displays a single Inbound model.
     * @param  int  $ID  ID
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($ID)
    {
        return $this->render('view', [
            'model' => $this->findModel($ID),
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
                $model->setAttribute('Kulliyyah', $selectedPersonId);
                $path = '@backend/views/email/emailForwardToDepartment.php';
                $subject = 'take a look';
            } else {
                if ($status === 21) {
                    $token = Yii::$app->security->generateRandomString(32);
                    $model->setAttribute('msd_cps', $selectedPersonId);
                    $path = '@backend/views/email/emailForwardToDepartment.php';
                    $subject = 'take a look';
                } else {
                    if ($status === 41 || $status === 61) {
                        $subject = 'Congratulations';
                        $path = '@backend/views/email/emailApprove.php';
                        $selectedPersonInChargeName = $model->Name;
                        $email = $model->Email_address;
                        $token = null;
                    }
                }
            }

            $model->Token = $token;
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
                'kulliyyahworkflow/view', 'ID' => $model->ID, 'token' => $token
            ]);
            //21for accept and 2 for reject
        } elseif ($model->Status === 21 || $model->Status === 22) {
            $viewLink = Yii::$app->urlManager->createAbsoluteUrl([
                'higherworkflow/view', 'ID' => $model->ID, 'token' => $token
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

    /**
     * @throws NotFoundHttpException
     */
    public function actionReject($ID)
    {
        $model = $this->findModel($ID);
        $name = $model->Name;
        $email = $model->Email_address;
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
        $model->Token = $token;
        $kulliyyah = $model->getAttribute('Kulliyyah');
        $msd_cps = $model->getAttribute('msd_cps');
        if ($this->request->isPost) {
            $reason = $this->request->post("reason");
            if ($model->Status === 12) {
                $modelPoc = Poc::findOne(['id' => $kulliyyah]);
                $model->Status = 1;
            } else {
                if ($model->Status === 32) {
                    $modelPoc = Poc::findOne(['id' => $msd_cps]);
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

    public function actionDownload($id, $file)
    {
        $filePath = 'C:\xampp\htdocs\playground1\frontend\uploads/'.$file;
        Yii::info("File Path: ".$filePath, "fileDownload");

        if (file_exists($filePath)) {
            Yii::$app->response->sendFile($filePath);
        } else {
            Yii::$app->session->setFlash('error', 'The file does not exist.');

            return $this->redirect(['view', 'ID' => $id]);
        }
    }
}
