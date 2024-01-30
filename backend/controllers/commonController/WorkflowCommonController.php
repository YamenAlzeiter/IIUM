<?php

namespace backend\controllers\commonController;

use common\models\Status;
use Yii;
use yii\base\Action;
use yii\web\Controller;
use yii\web\NotFoundHttpException;


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

    /**
     * Downloads a file associated with the given ID.
     *
     * @param  int  $ID  The ID of the model.
     * @param  string  $file  The filename to be downloaded.
     * @throws NotFoundHttpException If the file does not exist.
     */
    public function actionDownload($ID, $file)
    {
        $baseUploadPath = Yii::getAlias('@common/uploads');
        $filePath = $baseUploadPath.'/'.$ID.'/'.$file;
        Yii::info("File Path: ".$filePath, "fileDownload");
        if (file_exists($filePath)) {
            Yii::$app->response->sendFile($filePath);
        } else {
            Yii::info("File not found: ".$file, "fileDownload");
            throw new NotFoundHttpException('The file does not exist.');
        }
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

        if ($action->id !== 'error' && !$this->isValidToken($ID, $token)) {
            $model = $this->findModel($ID);
            $statusModel = Status::findOne($model->Status);

            $this->layout = 'main';
            throw new NotFoundHttpException("The Applicant $model->Name has already been Processed, Current Applicant Status: $statusModel->status");
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