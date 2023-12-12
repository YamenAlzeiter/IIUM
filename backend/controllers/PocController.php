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
 * PocController implements the CRUD actions for Poc model.
 */
class PocController extends Controller
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
     * Lists all Poc models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $model = new Poc();
        $modelKedio = new Kcdio();
        $dataProvider = new ActiveDataProvider([
            'query' => Poc::find(),
        ]);

        if ($this->request->isPost && $model->load($this->request->post())) {
            $selectedValueFromKedio = $this->request->post('Poc')['KCDIO'];
            $model->KCDIO = $selectedValueFromKedio;
            if ($model->save()) {
                // Redirect to the view page after successful creation
                return $this->redirect(['index']);
            }
        }

        return $this->render('index', [
            'dataProvider' => $dataProvider,
            'model' => $model,
            'modelKedio' => $modelKedio,
        ]);
    }


    /**
     * Displays a single Poc model.
     * @param int $id ID
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        $model = Poc::findOne($id);

        return $this->render('view', [
            'model' => $model,
        ]);
    }

    public function actionUpdate($id)
    {
        $model = Poc::findOne($id);

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

        $model = Poc::findOne($id);

        return [
            'name' => $model->name,
            'email' => $model->email,
            'email_cc' => $model->email_cc,
            'phone_number' => $model->phone_number,
            'KCDIO' => $model->KCDIO,
            'kulliah' => $model->kulliah,
        ];
    }
    public function actionCreate()
    {
        $model = new Poc();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            // Handle successful creation
            return $this->redirect(['index']);
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }




    /**
     * Deletes an existing Poc model.
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
     * Finds the Poc model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $id ID
     * @return Poc the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Poc::findOne(['id' => $id])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}