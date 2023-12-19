<?php

namespace frontend\controllers;

use common\models\Courses;
use common\models\Iiumcourse;
use common\models\Inbound;
use common\models\Ob010;
use Exception;
use Yii;
use yii\data\ActiveDataProvider;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\web\UploadedFile;

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
     * Lists all Inbound models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $dataProvider = new ActiveDataProvider([
            'query' => Inbound::find()->where(['ID' => Yii::$app->user->id])
            // Filter records by the currently logged-in user's ID
        ]);

        return $this->render('index', [
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Inbound model.
     * @param int $ID ID
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($ID)
    {
        try {
            // Attempt to find the student based on the provided ID
            $student = Inbound::findOne($ID);

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

    /**
     * Creates a new Inbound model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        $this->layout = 'progressInbound';
        $id = Yii::$app->user->id;

        // Check if the ID already exists in the Ob010 table.
//        if ($this->idExists($id)) {
//            Yii::$app->session->setFlash('error', "You already created an application.");
//            // Redirect to a different page or reload the current page
//            return $this->redirect(['inbound/index']); // Replace 'controller/action' with the appropriate route
//        }

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
        return Inbound::findOne(['ID' => $id]) !== null;
    }

    private function createModel($id)
    {
        $model = new Inbound(['ID' => $id]);
        return $model;
    }

    private function saveCoursesData($model, $coursesData)
    {
        foreach ($coursesData as $courseInfo) {
            $coursesModel = new Courses();
            $coursesModel->attributes = $courseInfo;
            $coursesModel->student_id = $model->ID;

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
            $iiumcoursesModel->student_id = $model->ID;

            if (!$iiumcoursesModel->save()) {
                throw new Exception('Failed to save IIUM course records.');
            }
        }
    }
    /**
     * Updates an existing Inbound model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $ID ID
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($ID)
    {
        $this->layout = 'progressInbound';
        $model = $this->findModel($ID);

        if ($model ->Status !== 3 && $model -> Status !== null ) {
            Yii::$app->session->setFlash('error', "Your application on process now, Can't update your INFO during that.");
            // Redirect to a different page or reload the current page
            return $this->redirect(['inbound/index']); // Replace 'controller/action' with the appropriate route
        }
        if ($this->request->isPost) {
            $transaction = Yii::$app->db->beginTransaction();

            try {
                // Load data into the model
                if ($model->load($this->request->post())) {
                    // Helper function for updating file
                    $updateFile = function ($attribute, $fileNamePrefix) use ($model) {
                        $file = UploadedFile::getInstance($model, $attribute);
                        if ($file) {
                            $baseUploadPath = 'C:/xampp/htdocs/playground1/common/uploads';
                            $inputName = preg_replace('/[^a-zA-Z0-9]+/', '_', $file->name);
                            $fileName = $fileNamePrefix . '_' . $model->Name . '_' . $model->ID . '.' . $file->extension;
                            $file->saveAs($baseUploadPath . '/' . $fileName);
                            $model->$attribute = $fileName; // Update the model attribute with the new file name
                        }
                    };

                    // Update each file
                    $updateFile('English_certificate', 'English_certificate');
                    $updateFile('Recommendation_letter', 'Recommendation_letter');
                    $updateFile('Passport', 'Passport');
                    $updateFile('Latest_passport_photo', 'Latest_passport_photo');
                    $updateFile('Latest_certified_academic_transcript', 'Latest_certified_academic_transcript');
                    $updateFile('Confirmation_letter', 'Confirmation_letter');
                    $updateFile('Confirmation_letter', 'Confirmation_letter');
                    $updateFile('Sponsorship_letter', 'Sponsorship_letter');



                    // Save the model
                    if ($model->validate() && $model->save()) {
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
            'model' => $model,
        ]);
    }


    /**
     * Deletes an existing Inbound model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $ID ID
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($ID)
    {
        $this->findModel($ID)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Inbound model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $ID ID
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
}
