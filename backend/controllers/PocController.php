<?php

namespace backend\controllers;

use backend\views\Outbound\outboundSearch;
use backend\views\poc\pocSearch;
use common\models\Kcdio;
use common\models\Poc;
use Yii;
use yii\data\ActiveDataProvider;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Response;

/**
 * PocController implements the CRUD actions for person in charge model.
 */
class PocController extends Controller
{
    /**
     * @inheritDoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::class,
                'rules' => [
                    [
                        'actions' => ['index', 'view', 'update', 'delete', 'create', 'get-record'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::class,
                'actions' => ['delete' => ['POST']],
            ],
        ];
    }

    /**
     * Lists all person in charge models.
     *
     * @return string The rendering result.
     */
    public function actionIndex()
    {
        $searchModel = new pocSearch();
        $model = new Poc();
        $modelKedio = new Kcdio();
        $dataProvider = $searchModel->search($this->request->queryParams);

        if ($this->request->isPost && $model->load($this->request->post())) {
            $selectedValueFromKedio = $this->request->post('Poc')['KCDIO'];
            $model->KCDIO = $selectedValueFromKedio;
            if ($model->save()) {
                // Redirect to the index page after successful creation
                return $this->redirect(['index']);
            }
        }

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'model' => $model,
            'modelKedio' => $modelKedio,
        ]);
    }

    /**
     * Displays a single person in charge model record.
     *
     * @param int $id The ID of the person in charge model.
     * @return string The rendering result.
     * @throws NotFoundHttpException if the model cannot be found.
     */
    public function actionView($id)
    {
        $model = Poc::findOne($id);

        return $this->render('view', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Person in charge model.
     *
     * @param int $id The ID of the person in charge model to be updated.
     * @return string|\yii\web\Response The rendering result or a redirection response.
     */
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

    /**
     * Retrieves a person in charge model record as JSON data.
     *
     * @param int $id The ID of the person in charge model.
     * @return array JSON response containing the person in charge model data.
     */
    public function actionGetRecord($id)
    {
        Yii::$app->response->format = Response::FORMAT_JSON;
        $model = Poc::findOne($id);

        return [
            'name' => $model->name,
            'email' => $model->email,
            'email_cc' => $model->email_cc,
            'name_cc1' => $model->name_cc1,
            'name_cc2' => $model->name_cc2,
            'email_cc_additional' => $model->email_cc_additional,
            'KCDIO' => $model->KCDIO,
        ];
    }

    /**
     * Creates a new person in charge record.
     *
     * @return string|\yii\web\Response The rendering result or a redirection response.
     */
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
     * Deletes an existing person in charge record.
     *
     * @param int $id The ID of the Person in charge model to be deleted.
     * @return \yii\web\Response A redirection response to the 'index' page.
     * @throws NotFoundHttpException if the model cannot be found.
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the person in charge model based on its primary key value.
     *
     * @param int $id The ID of the person in charge model.
     * @return Poc The loaded model.
     * @throws NotFoundHttpException if the model cannot be found.
     */
    protected function findModel($id)
    {
        if (($model = Poc::findOne(['id' => $id])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
