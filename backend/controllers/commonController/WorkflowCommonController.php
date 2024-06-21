<?php

namespace backend\controllers\commonController;

use common\models\Status;
use Yii;
use yii\base\Action;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;
use yii\web\Response;


/**
 * Class CommonController
 * @package backend\controllers
 */
class WorkflowCommonController extends Controller
{
    /**
     * @var string The layout to be used by the controllers.
     */
    public $layout = 'blank';

    public function actionDownload($id, $file)
    {
        $baseUploadPath = Yii::getAlias('@common/uploads');
        $filePath = $baseUploadPath.'/'.$id.'/'.$file;
        Yii::info("File Path: ".$filePath, "fileDownload");

        if (file_exists($filePath)) {
            Yii::$app->response->format = Response::FORMAT_JSON;


            return ['success' => true];
        } else {
            Yii::$app->response->format = Response::FORMAT_JSON;
            return ['success' => false];
        }
    }

    public function actionDownloader($id, $file)
    {
        $baseUploadPath = Yii::getAlias('@common/uploads');
        $filePath = $baseUploadPath.'/'.$id.'/'.$file;
        Yii::$app->response->sendFile($filePath);
    }


    /**
     * Executed before an action.
     *
     * @param  Action  $action  The action to be executed.
     * @return bool Whether the action should continue.
     * @throws NotFoundHttpException If the token is invalid.
     */
    public function beforeAction($action)
    {
        $ID = Yii::$app->getRequest()->get('ID');
        $token = Yii::$app->getRequest()->get('token');
        if($action->id ==='download' || $action->id === 'downloader'){
            return parent::beforeAction($action);
        }
        else if ($action->id !== 'error' && !$this->isValidToken($ID, $token)) {
            $model = $this->findModel($ID);
            $statusModel = Status::findOne($model->Status);

            $this->layout = 'main';

            if (in_array($model->Status, [2, 12, 22, 32, 42,
                                          6, 16, 26, 36])) {
                $class = 'badge bg-danger-subtle text-danger fw-semibold fs-9';
            } elseif (in_array($model->Status, [61, 65, 81])) {
                $class = 'badge bg-success-subtle text-success-style2 fw-semibold fs-9';
            } elseif (in_array($model->Status, [1, 21, 41, 71,
                                                5, 25, 45, 75])) {
                $class = 'badge bg-primary-subtle text-primary fw-semibold fs-9';
            } else {
                $class = 'badge bg-warning-subtle text-warning fw-bolder fs-9 ';
            }

            throw new ForbiddenHttpException("The Applicant  <span class='text-bg-light fw-bolder'>$model->Name</span> has already been Processed.</br> Current Applicant Status: <span class='font-monospace .$class'>$statusModel->status</span>");

        }

        return parent::beforeAction($action);

    }

    /**
     * Checks if the token is valid for the given ID.
     *
     * @param  int|null  $ID  The ID of the model.
     * @param  string|null  $token  The token to validate.
     * @return bool Whether the token is valid.
     */
    protected function isValidToken($ID, $token)
    {
        if ($ID === null || $token === null) {
            return false;
        }

        $model = $this->findModel($ID);
        return $model->Token === $token;
    }
}