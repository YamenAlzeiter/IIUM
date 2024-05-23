<?php

namespace backend\controllers;

use common\models\Kcdio;
use common\models\Poc;
use Yii;
use yii\data\ActiveDataProvider;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Response;

/**
 * KcdioController implements the CRUD actions for Kcdio model.
 */
class KcdioController extends Controller
{
    /**
     * @inheritDoc
     */
    public function behaviors()
    {
        return array_merge(
            parent::behaviors(),
            [
                'verbs' => [
                    'class' => VerbFilter::className(),
                    'actions' => [
                        'delete' => ['POST'],
                    ],
                ],
            ]
        );
    }

    /**
     * Lists all Kcdio models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $model = new Kcdio();
        $dataProvider = new ActiveDataProvider([
            'query' => Kcdio::find(),

            'pagination' => [
                'pageSize' => 8
            ],
            'sort' => [
                'defaultOrder' => [
                    'kcdio' => SORT_ASC,
                ]
            ],

        ]);

        return $this->render('index', [
            'dataProvider' => $dataProvider,
            'model' => $model
        ]);
    }

    /**
     * Displays a single Kcdio model.
     * @param int $id ID
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Kcdio model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {

        $model = new Kcdio();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            // Handle successful creation
            return $this->redirect(['index']);
        }

        return $this->render('create', [
            'model' => $model,
        ]);

    }

    /**
     * Updates an existing Kcdio model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $id ID
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            return $this->redirect(['index']);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Retrieves a person in charge model record as JSON data.
     *
     * @param int $id The ID of the person in charge model.
     * @return array JSON response containing the person in charge model data.
     */
    public function actionGetRecord($id)
    {
        Yii::$app->response->format = Response::FORMAT_JSON;
        $model = Kcdio::findOne($id);

        return [
            'kcdio' => $model->kcdio,
        ];
    }

    /**
     * Deletes an existing Kcdio model.
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
     * Finds the Kcdio model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $id ID
     * @return Kcdio the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Kcdio::findOne(['id' => $id])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
