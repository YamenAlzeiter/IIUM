<?php

namespace backend\controllers;

use backend\models\SignupForm;
use backend\models\UserAdmin;
use common\models\Admin;
use common\models\Kcdio;
use common\models\Poc;
use common\models\User;
use Yii;
use yii\data\ActiveDataProvider;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Response;

/**
 * UserController implements the CRUD actions for UserAdmin model.
 */
class UserController extends Controller
{
    /**
     * @inheritDoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['index', 'view', 'create', 'update', 'delete','get-record'],
                        'allow' => true,
                        'roles' => ['superAdmin'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all UserAdmin models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $model = new UserAdmin();
        $user = new Admin();
        $dataProvider = new ActiveDataProvider([
            'query' => UserAdmin::find(),
        ]);

        if ($this->request->isPost && $model->load($this->request->post())) {
            if ($model->save()) {
                // Redirect to the view page after successful creation
                return $this->redirect(['index']);
            }
        }
        if ($model->load(Yii::$app->request->post())) {
            // Handle successful creation

            $password = 'admin'; // Set the initial password


            $user->username = $model->username;
            $user->email = $model->email;
            $user->matric_number = $model->matric_number;

            $user->setPassword($password); // Set the password for the Admin model
            $user->generateAuthKey(); // Generate an authentication key
            if ($user->save()) {
                return $this->redirect(['index']);
            }
        }


        return $this->render('index', [
            'dataProvider' => $dataProvider,
            'model' => $model,
        ]);
    }

    /**
     * Displays a single UserAdmin model.
     * @param int $id ID
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        $model = UserAdmin::findOne($id);

        return $this->render('view', [
            'model' => $model,
        ]);
    }
    /**
     * Creates a new UserAdmin model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
   public function actionCreate()
   {
       $model = new SignupForm();
        if ($model->load(Yii::$app->request->post()) && $model->signup()) {
            $password = 'admin'; // Set the initial password
            $model->setPassword($password); // Set the password for the Admin model
            $model->generateAuthKey(); // Generate an authentication key
            Yii::$app->session->setFlash('success', 'Thank you for registration. Please check your inbox for verification email.');
            return $this->redirect(['index']);
        }
   }







    /**
     * Updates an existing UserAdmin model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $id ID
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = UserAdmin::findOne($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            // Handle successful update
            return $this->redirect(['index']);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    public function actionGetRecord($id)
    {
        Yii::$app->response->format = Response::FORMAT_JSON;

        $model = UserAdmin::findOne($id);

        return [
            'username' => $model->username,
            'matric_number' => $model->matric_number,
            'email' => $model->email,
        ];
    }

    /**
     * Deletes an existing UserAdmin model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $id ID
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the UserAdmin model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $id ID
     * @return UserAdmin the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = UserAdmin::findOne(['id' => $id])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
