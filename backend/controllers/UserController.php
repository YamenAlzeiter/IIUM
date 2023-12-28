<?php

namespace backend\controllers;

use backend\models\SignupForm;
use backend\models\UserAdmin;
use common\models\Admin;
use common\models\Kcdio;
use common\models\Poc;
use common\models\User;
use SebastianBergmann\ObjectReflector\Exception;
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

        if ($this->request->isPost) {
            try {
                if ($model->load($this->request->post())) {
                    // Validate the model before attempting to save
                    if ($model->validate()) {
                        // Check if the matric number already exists

                        $existingUser = UserAdmin::findOne(['matric_number' => $model->matric_number]);
                        if ($existingUser) {
                            Yii::$app->session->setFlash('error', 'Matric number already exists.');
                            return $this->redirect(['index']);
                        }

                        // Assign values and save the Admin model
                        $user->username = $model->username;
                        $user->email = $model->email;
                        $user->matric_number = $model->matric_number;

                        $password = 'admin'; // Set the initial password
                        $user->setPassword($password);
                        $user->generateAuthKey();

                        // Try saving the Admin model
                        if ($user->save()) {
                            Yii::$app->session->setFlash('success', 'User created successfully.');
                            return $this->redirect(['index']);
                        } else {
                            Yii::$app->session->setFlash('error', 'Unable to save the user.');
                        }
                    } else {
                        Yii::$app->session->setFlash('error', 'Unable to save the User, failed validation: try to use different Email or Matric Number.');
                    }
                }
            } catch (Exception $e) {
                Yii::$app->session->setFlash('error', 'An error occurred while creating the user.');
                Yii::error($e->getMessage());
            }
        }

        return $this->render('index', [
            'dataProvider' => $dataProvider,
            'model' => $model,
        ]);
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
