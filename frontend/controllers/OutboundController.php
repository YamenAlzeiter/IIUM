<?php

namespace frontend\controllers;

use common\models\Courses;
use common\models\Iiumcourse;
use common\models\Outbound;
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
        $dataProvider = new ActiveDataProvider([
            'query' => Outbound::find()->where(['ID' => Yii::$app->user->id]),
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
                            $this->saveCoursesData($model, $coursesData);
//
//                            // Load and save IIUM Courses data
                            $iiumcourseData = Yii::$app->request->post('IiumcoursesModel', []);
                            $this->saveIiumCoursesData($model, $iiumcourseData);

                            $transaction->commit();

                            Yii::$app->session->setFlash('success', 'Application created successfully.');
                            return $this->redirect(['view', 'ID' => $model->ID]);
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
        $model = $this->findModel($ID);

        if ($this->request->isPost && $model->load($this->request->post())) {
            if ($this->request->post('saveWithoutValidation') === 'validate') {
                // Set status to 10 only when the 'submit' button is clicked
                $model->Status = 10;
            }
            if ($model->save()) {
                return $this->redirect(['view', 'ID' => $model->ID]);
            }
        }

        return $this->render('update', [
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

    private function saveCoursesData($model, $coursesData)
    {
        if(!empty($coursesData)){
            foreach ($coursesData as $courseInfo) {
                $coursesModel = new Courses();
                $coursesModel->attributes = $courseInfo;
                $coursesModel->student_id = $model->ID;

                if (!$coursesModel->save()) {
                    throw new Exception('Failed to save Courses records.');
                }
            }
        }
    }

    private function saveIiumCoursesData($model, $iiumcourseData)
    {
        if(!empty($iiumcourseData)){
            foreach ($iiumcourseData as $iiumcourseInfo) {
                $iiumcoursesModel = new Iiumcourse();
                $iiumcoursesModel->attributes = $iiumcourseInfo;
                $iiumcoursesModel->student_id = $model->ID;

                if (!$iiumcoursesModel->save()) {
                    throw new Exception('Failed to save IIUM course records.');
                }
            }
        }
    }
}
