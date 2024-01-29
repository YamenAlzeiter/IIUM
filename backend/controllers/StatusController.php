<?php

namespace backend\controllers;

use common\models\Status;
use Yii;
use yii\data\ActiveDataProvider;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;
use yii\web\Response;

/**
 * StatusController implements the CRUD actions for Ststus model.
 */
class StatusController extends Controller
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
                        'actions' => ['index', 'view', 'update', 'delete', 'get-record'],
                        'allow' => true,
                        'roles' => ['superAdmin'],
                        'denyCallback' => function ($rule, $action) {
                            throw new ForbiddenHttpException('You are not allowed to perform this action.');
                        },
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
     * Lists all Ststus models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $model = new Status();
        $dataProvider = new ActiveDataProvider([
            'query' => Status::find()
                ->orderBy([
                    new \yii\db\Expression("CASE 
                    WHEN type = 'I/O' THEN 1 
                    WHEN type = 'O' THEN 2 
                    WHEN type = 'I' THEN 3 
                    ELSE 4 END"),
                    'ID' => SORT_ASC, // Sort within each type by ID in ascending order
                ]),
        ]);

        $dataProvider->pagination = [
            'pageSize' => 12,
        ];
        if ($this->request->isPost && $model->load($this->request->post())) {

            if ($model->save()) {

                return $this->redirect(['index']);
            }
        }
        return $this->render('index', [
            'dataProvider' => $dataProvider,
            'model' => $model,
        ]);
    }


    public function actionUpdate($id)
    {
        $model = Status::findOne($id);

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

        $model = Status::findOne($id);

        return [
            'status' => $model->status,
        ];
    }

    /**
     * Finds the Ststus model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $ID ID
     * @return Ststus the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($ID)
    {
        if (($model = Status::findOne(['ID' => $ID])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
