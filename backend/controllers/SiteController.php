<?php

namespace backend\controllers;

use backend\models\PasswordResetRequestForm;
use backend\models\ResetPasswordForm;
use backend\models\SignupForm;
use common\models\AdminLoginForm;
use common\models\Outbound;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use Yii;
use yii\base\InvalidArgumentException;
use yii\data\ActiveDataProvider;
use yii\db\Expression;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;
use yii\helpers\FileHelper;
use yii\web\BadRequestHttpException;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;
use yii\web\Response;
require Yii::getAlias('@common').'/Helpers/helper.php';

/**
 * SiteController is the controller responsible for handling site-related actions.
 * It includes actions for user authentication, dashboard display, password management,
 * and data export functionalities.
 *
 * @property \common\models\AdminLoginForm|\backend\models\PasswordResetRequestForm|\backend\models\ResetPasswordForm|\backend\models\SignupForm $model The model for the current action.
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
                        'actions' => ['signup', 'reset-password', 'request-password-reset','login', 'error','not','out-backup', 'in-backup'],
                        'allow' => true,
                    ],

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
     * Displays the inbound dashboard for a specific year.
     *
     * @param int $year The year for which to display the dashboard.
     * @return string The rendered view of the inbound dashboard.
     */
    public function actionInboundDashboard($year)
    {
        $months = $this->getMonthNames();
        $counts = $this->getMonthlyCounts('inbound', $year);

        $maleCount = $this->getGenderCount('M', 'inbound', $year);
        $femaleCount = $this->getGenderCount('F', 'inbound', $year);

        return $this->render('inboundDashboard', [
            'months' => json_encode($months),
            'counts' => json_encode($counts),
            'maleCount' => $maleCount,
            'femaleCount' => $femaleCount,
        ]);
    }

    /**
     * Displays the outbound dashboard for a specific year or the current year if no year is provided.
     *
     * @param int|null $year The year for which to display the dashboard. If not provided, the current year is used.
     * @return string The rendered view of the outbound dashboard.
     */
    public function actionOutboundDashboard($year = null)
    {
        if($year === null){
            $year = date('Y');
        }

        $months = $this->getMonthNames();
        $counts = $this->getMonthlyCounts('outbound', $year);

        $maleCount = $this->getGenderCount('M', 'outbound', $year);
        $femaleCount = $this->getGenderCount('F', 'outbound', $year);

        return $this->render('outboundDashboard', [
            'months' => json_encode($months),
            'counts' => json_encode($counts),
            'maleCount' => $maleCount,
            'femaleCount' => $femaleCount,
        ]);
    }

    /**
     * Retrieves an array of month names.
     *
     * @return array An array containing the names of all months.
     */
    private function getMonthNames()
    {
        $months = [];
        for ($i = 1; $i <= 12; $i++) {
            $months[] = date("M", mktime(0, 0, 0, $i, 1));
        }
        return $months;
    }

    /**
     * Retrieves the monthly counts of records for a given table and year.
     *
     * @param string $tableName The name of the database table.
     * @param int $year The year for which to retrieve counts.
     * @return array An array containing the counts of records for each month of the year.
     */
    private function getMonthlyCounts($tableName, $year)
    {
        $data = (new \yii\db\Query())
            ->select([
                new Expression('EXTRACT(MONTH FROM created_at) AS month'),
                new Expression('COUNT(*) AS count')
            ])
            ->from($tableName)
            ->where(['and', ['EXTRACT(YEAR FROM created_at)' => $year], ['not', ['Status' => null]]])
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

    /**
     * Retrieves the count of records for a specific gender in a given table and year.
     *
     * @param string $gender The gender for which to retrieve the count.
     * @param string $table The name of the database table.
     * @param int $year The year for which to retrieve the count.
     * @return int The count of records matching the specified gender.
     */
    private function getGenderCount($gender, $table, $year)
    {
        return (new \yii\db\Query())
            ->from($table)
            ->where(['and', ['Gender' => $gender],['EXTRACT(YEAR FROM created_at)' => $year], ['not', ['Status' => null]]])
            ->count();
    }




    /**
     * Renders the login view or redirects to the home page if the user is already authenticated.(current home page: "outbound-dashboard" can be changed throw backend/config/main.php -> url management )
     *
     * @return string|Response The rendered login view or a redirection response to the home page.
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
     * Logs out the current user and redirects to the home page.
     *
     * @return Response A redirection response to the home page.
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }

    /**
     * Initiates the process for requesting a password reset.
     *
     * @return string The rendered view for requesting a password reset token.
     */
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

    /**
     * Resets the user's password using the provided token.
     *
     * @param string $token The password reset token.
     * @return string The rendered view indicating the success or failure of the password reset operation.
     * @throws BadRequestHttpException If the provided token is invalid.
     */
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

    /**
     * Renders the signup view or processes the signup form submission.
     *
     * @return string|Response The rendered signup view or a redirection response to the home page upon successful signup.
     */
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
    /**
     * Renders the error view based on the type of exception encountered.
     *
     * @return string The rendered error view.
     */
    public function actionError()
    {
        $exception = Yii::$app->errorHandler->exception;
        if ($exception instanceof \yii\web\NotFoundHttpException) {
            return $this->render('error404', ['exception' => $exception]);
        } elseif ($exception instanceof \yii\web\BadRequestHttpException) {
            return $this->render('error400', ['exception' => $exception]);
        } else {
            return $this->render('error', ['exception' => $exception]);
        }
    }

    /**
     * Exports data from the 'outbound' table to an Excel file.
     */
    public function actionOutBackup()
    {
        // Get the list of columns for the 'outbound' table
        $tableColumns = Yii::$app->db->getTableSchema('outbound')->columns;

        // Filter out blob columns
        $nonBlobColumns = array_filter($tableColumns, function ($column) {
            return !in_array($column->type, ['binary', 'varbinary', 'blob']);
        });

        // Columns to exclude from export
        $columnsToExclude = ['temp', 'ID', 'updated_at', 'created_at', 'Token'];

        // Extract column names
        $columnsToFetch = array_map(function ($column) {
            // Check if $column is an object before accessing 'name' property
            return is_object($column) ? $column->name : $column;
        }, array_diff(array_keys($nonBlobColumns), $columnsToExclude));

        // Fetch data excluding blob columns and specified columns
        $data = (new \yii\db\Query())
            ->select($columnsToFetch)
            ->from('outbound')
            ->all();

        // Columns to process for specific values
        $countryColumns = ['Country', 'Mailing_Country', 'Emergency_country', 'Connect_host_country'];
        $stateColumns   = ['State', 'Mailing_State', 'Emergency_state'];
        $otherColumns   = ['credit_transfer_availability', 'host_scholarship', 'Sponsoring_funding'];

        // Process country columns
        $this->processColumns($data, $countryColumns, 'getCountry');

        // Process state columns
        $this->processColumns($data, $stateColumns, 'getState');

        // Process other columns
        $this->processColumns($data, $otherColumns, 'getAnswer');

        // Create a new Spreadsheet
        $spreadsheet = new \PhpOffice\PhpSpreadsheet\Spreadsheet();

        // Set the worksheet title
        $spreadsheet->getActiveSheet()->setTitle('Outbound Backup');

        // Add headers to the Excel file
        $spreadsheet->getActiveSheet()->fromArray($columnsToFetch, null, 'A1');

        // Add data to the Excel file
        $spreadsheet->getActiveSheet()->fromArray($data, null, 'A2');

        // Set the width of all columns to 20
        foreach (range('A', 'ZZZ') as $column) {
            $spreadsheet->getActiveSheet()->getColumnDimension($column)->setWidth(20);
        }

        // Save the Excel file
        $filePath = $this->saveExcelFile($spreadsheet);

        // Provide download link
        Yii::$app->response->sendFile($filePath)->send();
    }

    /**
     * Exports data from the 'inbound' table to an Excel file.
     */
    public function actionInBackup()
    {
        // Get the list of columns for the 'outbound' table
        $tableColumns = Yii::$app->db->getTableSchema('inbound')->columns;

        // Filter out blob columns
        $nonBlobColumns = array_filter($tableColumns, function ($column) {
            return !in_array($column->type, ['binary', 'varbinary', 'blob']);
        });

        // Columns to exclude from export
        $columnsToExclude = ['temp', 'ID', 'updated_at', 'created_at', 'Token'];

        // Extract column names
        $columnsToFetch = array_map(function ($column) {
            // Check if $column is an object before accessing 'name' property
            return is_object($column) ? $column->name : $column;
        }, array_diff(array_keys($nonBlobColumns), $columnsToExclude));

        // Fetch data excluding blob columns and specified columns
        $data = (new \yii\db\Query())
            ->select($columnsToFetch)
            ->from('inbound')
            ->all();

        // Columns to process for specific values
        $countryColumns = ['Country_of_origin', 'Country_of_residence', 'Country', 'Emergency_country'];

        $otherColumns   = ['Propose_transfer_credit_hours', 'host_scholarship', 'Sponsoring_funding','Mou_or_Moa', 'English_native',];

        // Process country columns
        $this->processColumns($data, $countryColumns, 'getCountry');

        // Process other columns
        $this->processColumns($data, $otherColumns, 'getAnswer');

        // Create a new Spreadsheet
        $spreadsheet = new \PhpOffice\PhpSpreadsheet\Spreadsheet();

        // Set the worksheet title
        $spreadsheet->getActiveSheet()->setTitle('inbound Backup');

        // Add headers to the Excel file
        $spreadsheet->getActiveSheet()->fromArray($columnsToFetch, null, 'A1');

        // Add data to the Excel file
        $spreadsheet->getActiveSheet()->fromArray($data, null, 'A2');

        // Set the width of all columns to 20
        foreach (range('A', 'ZZZ') as $column) {
            $spreadsheet->getActiveSheet()->getColumnDimension($column)->setWidth(20);
        }

        // Save the Excel file
        $filePath = $this->saveExcelFile($spreadsheet);

        // Provide download link
        Yii::$app->response->sendFile($filePath)->send();
    }
    /**
     * Process columns by applying a specified function to their values
     *
     * @param array  $data       Data array to be processed
     * @param array  $columns    Columns to process
     * @param string $methodName Method to apply to column values
     */

    private function processColumns(&$data, $columns, $methodName)
    {
        foreach ($data as &$row) {
            foreach ($columns as $column) {
                if (isset($row[$column])) {
                    // Call the specified method on the column value
                    $processedValue = $methodName($row[$column]);

                    // Update the value in the $data array for the corresponding column
                    $row[$column] = $processedValue;
                }
            }
        }
    }
    /**
     * Saves the Excel file and returns the file path.
     *
     * @param \PhpOffice\PhpSpreadsheet\Spreadsheet $spreadsheet The spreadsheet instance.
     * @return string The file path of the saved Excel file.
     */
    private function saveExcelFile($spreadsheet)
    {
        $writer = new \PhpOffice\PhpSpreadsheet\Writer\Xlsx($spreadsheet);

        // Set file path
        $filePath = Yii::getAlias('@runtime') . '/Outbound_Export_' . date('YmdHis') . '.xlsx';

        // Save the file
        $writer->save($filePath);

        return $filePath;
    }

}
