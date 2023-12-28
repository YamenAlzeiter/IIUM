<?php

namespace backend\controllers;

use backend\models\PasswordResetRequestForm;
use backend\models\ResetPasswordForm;
use backend\models\SignupForm;
use common\models\AdminLoginForm;
use Yii;
use yii\base\InvalidArgumentException;
use yii\db\Expression;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;
use yii\web\BadRequestHttpException;
use yii\web\Controller;
use yii\web\Response;

/**
 * Site controller
 */
class SiteController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::class,
                'rules' => [
                    [
                        'actions' => ['signup', 'reset-password', 'request-password-reset', 'error', 'login', 'error'],
                        // Include 'request-password-reset'
                        'allow' => true,
                    ],
//                    [
//                        'actions' => ['login', 'error'],
//                        'allow' => true,
//                    ],
                    [
                        'actions' => ['logout', 'index', 'inbound-dashboard','outbound-dashboard'],
                        'allow' => true,
                        'roles' => ['@'], // Allow access only for authenticated users
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::class,
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => \yii\web\ErrorAction::class,
                'layout' => 'blank'
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionInboundDashboard()
    {
        $months = $this->getMonthNames();
        $counts = $this->getMonthlyCounts('inbound');

        $maleCount = $this->getGenderCount('M');
        $femaleCount = $this->getGenderCount('F');

        return $this->render('inboundDashboard', [
            'months' => json_encode($months),
            'counts' => json_encode($counts),
            'maleCount' => $maleCount,
            'femaleCount' => $femaleCount,
        ]);
    }

    public function actionOutboundDashboard()
    {
        $months = $this->getMonthNames();
        $counts = $this->getMonthlyCounts('outbound');

        $maleCount = $this->getGenderCountO('M');
        $femaleCount = $this->getGenderCountO('F');

        return $this->render('outboundDashboard', [
            'months' => json_encode($months),
            'counts' => json_encode($counts),
            'maleCount' => $maleCount,
            'femaleCount' => $femaleCount,
        ]);
    }

// Function to get month names
    private function getMonthNames()
    {
        $months = [];
        for ($i = 1; $i <= 12; $i++) {
            $months[] = date("M", mktime(0, 0, 0, $i, 1));
        }
        return $months;
    }

// Function to get counts for each month
    private function getMonthlyCounts($tableName)
    {
        $data = (new \yii\db\Query())
            ->select([
                new Expression('EXTRACT(MONTH FROM created_at) AS month'),
                new Expression('COUNT(*) AS count')
            ])
            ->from($tableName)
            ->where(['not', ['Status' => null]])
            ->groupBy([new Expression('EXTRACT(MONTH FROM created_at)')])
            ->all();

        $counts = [];
        for ($i = 1; $i <= 12; $i++) {
            $found = false;
            foreach ($data as $entry) {
                if ((int)$entry['month'] === $i) {
                    $counts[] = (int)$entry['count'];
                    $found = true;
                    break;
                }
            }
            if (!$found) {
                $counts[] = 0;
            }
        }
        return $counts;
    }

// Function to get gender count
    private function getGenderCount($gender)
    {
        return (new \yii\db\Query())
            ->from('inbound')
            ->where(['and', ['Gender' => $gender], ['not', ['Status' => null]]])
            ->count();
    }
    private function getGenderCountO($gender)
    {
        return (new \yii\db\Query())
            ->from('outbound')
            ->where(['and', ['Gender' => $gender], ['not', ['Status' => null]]])
            ->count();
    }




    /**
     * Login action.
     *
     * @return string|Response
     */
    public function actionLogin()
    {
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $this->layout = 'blank';

        $model = new AdminLoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goHome();
        }

        $model->password = '';

        return $this->render('login', [
            'model' => $model,
        ]);
    }

    /**
     * Logout action.
     *
     * @return Response
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }

    public function actionRequestPasswordReset()
    {
        $this->layout = 'blank';
        $model = new PasswordResetRequestForm();
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            if ($model->sendEmail()) {
                Yii::$app->session->setFlash('success', 'Check your email for further instructions.');

                return $this->redirect(['site/login']);
            }

            Yii::$app->session->setFlash('error',
                'Sorry, we are unable to reset password for the provided email address.');
        }

        return $this->render('requestPasswordResetToken', [
            'model' => $model,
        ]);
    }

    public function actionResetPassword($token)
    {
        $this->layout = 'blank';
        try {
            $model = new ResetPasswordForm($token);
        } catch (InvalidArgumentException $e) {
            throw new BadRequestHttpException($e->getMessage());
        }

        if ($model->load(Yii::$app->request->post()) && $model->validate() && $model->resetPassword()) {
            Yii::$app->session->setFlash('success', 'New password saved.');

            return $this->goHome();
        }

        return $this->render('resetPassword', [
            'model' => $model,
        ]);
    }

    public function actionSignup()
    {
        $model = new SignupForm();
        if ($model->load(Yii::$app->request->post()) && $model->signup()) {
            return $this->goHome();
        }

        return $this->render('signup', [
            'model' => $model,
        ]);
    }
}
