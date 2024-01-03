<?php

namespace backend\controllers;

use backend\models\UserAdmin;
use common\models\Admin;
use SebastianBergmann\ObjectReflector\Exception;
use Yii;
use yii\data\ActiveDataProvider;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
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
                'class' => AccessControl::className(), 'rules' => [
                    [
                        'actions' => ['index', 'view', 'create', 'update', 'delete', 'get-record'], 'allow' => true,
                        'roles' => ['superAdmin'],
                    ],
                ],
            ], 'verbs' => [
                'class' => VerbFilter::className(), 'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }


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
                        $existingUser = UserAdmin::findOne(['matric_number' => $model->matric_number]);
                        $existingUserEmail = UserAdmin::findOne(['email' => $model->email]);
                        if ($existingUser && $existingUserEmail) {
                            Yii::$app->session->setFlash('error', 'Matric Number & Email are Already Exist.');
                        } elseif ($existingUser) {
                            Yii::$app->session->setFlash('error', 'Matric Number Already exist.');
                        } else {
                            if ($existingUserEmail) {
                                Yii::$app->session->setFlash('error', 'Email Already Exists.');
                            }
                        }
                    }
                }
            } catch (Exception $e) {
                Yii::$app->session->setFlash('error', 'An error occurred while creating the user.');
                Yii::error($e->getMessage());
            }
        }

        return $this->render('index', [
            'dataProvider' => $dataProvider, 'model' => $model,
        ]);
    }

    public function actionUpdate($id)
    {
        $model = UserAdmin::findOne($id);
        $dataProvider = new ActiveDataProvider([
            'query' => UserAdmin::find(),
        ]);

        if ($this->request->isPost) {
            try {
                if ($model->load($this->request->post())) {
                    // Validate the model before attempting to save
                    if ($model->validate()) {
                        $existingUser = UserAdmin::findOne(['matric_number' => $model->matric_number]);
                        $existingUserEmail = UserAdmin::findOne(['email' => $model->email]);

                        if (($existingUser && $existingUser->id !== $model->id) || ($existingUserEmail && $existingUserEmail->id !== $model->id)) {
                            Yii::$app->session->setFlash('error',
                                'Matric Number or Email already exists for another user.');
                        } else {
                            // Save the updated model
                            if ($model->save()) {
                                Yii::$app->session->setFlash('success', 'User updated successfully.');
                                return $this->redirect(['index']);
                            } else {
                                Yii::$app->session->setFlash('error', 'Unable to update the user.');
                            }
                        }
                    } else {
                        Yii::$app->session->setFlash('error', 'Validation failed while updating the user.');
                    }
                }
            } catch (Exception $e) {
                Yii::$app->session->setFlash('error', 'An error occurred while updating the user.');
                Yii::error($e->getMessage());
            }
        }

        return $this->render('index', [
            'dataProvider' => $dataProvider, 'model' => $model,
        ]);
    }


    public function actionGetRecord($id)
    {
        Yii::$app->response->format = Response::FORMAT_JSON;

        $model = UserAdmin::findOne($id);

        return [
            'username' => $model->username, 'matric_number' => $model->matric_number, 'email' => $model->email,
        ];
    }

    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    protected function findModel($id)
    {
        if (($model = UserAdmin::findOne(['id' => $id])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
