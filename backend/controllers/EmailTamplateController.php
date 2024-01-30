<?php

namespace backend\controllers;

use common\models\EmailTemplate;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\web\Response;

/**
 * EmailTamplateController implements the CRUD actions for EmailTemplate model.
 */
class EmailTamplateController extends Controller
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
                            'view', 'update'
                        ], 'allow' => true, 'roles' => ['@'],
                    ],
                ],
            ], 'verbs' => ['class' => VerbFilter::class, 'actions' => ['delete' => ['POST']],],
        ];
    }

    /**
     * Displays a single EmailTemplate model.
     * @param  int  $id  ID
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
     * Finds the EmailTemplate model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param  int  $id  ID
     * @return EmailTemplate the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = EmailTemplate::findOne(['id' => $id])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    /**
     * Updates an existing EmailTemplate model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param  int  $id  ID
     * @return string|Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }
}
