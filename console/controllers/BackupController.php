<?php


namespace console\controllers;

use Yii;
use yii\console\Controller;
use yii\helpers\FileHelper;

class BackupController extends Controller
{
     public function actionIndex()
{
    $this->backupFiles();
    $this->backupTables();

    $this->stdout("Backup completed successfully.\n");
}

    protected function backupFiles()
    {
        $baseUploadPath = Yii::getAlias('@common/uploads');
        $backupPath = Yii::getAlias('@common/backup');

        // Create a backup folder with the current date as the folder name
        $backupFolder = $backupPath . '/' . date('Y-m-d');
        FileHelper::createDirectory($backupFolder);

        // Copy files from the uploads directory to the backup folder
        FileHelper::copyDirectory($baseUploadPath, $backupFolder);
    }

    protected function backupTables()
    {
        $db = Yii::$app->db;
        $username = $db->username;
        $password = $db->password;
        $database = $db->dsn; // The DSN includes the host and database name

        $backupPath = Yii::getAlias('@common/backup');

        // Generate a backup file name with the current date
        $backupFileName = 'pg_backup_' . date('Y-m-d') . '.sql';

        // Set the PGUSER environment variable to specify the username
        putenv("PGUSER=$username");

        putenv("PGPASSWORD=$password");
        // Build the pg_dump command
        $command = "pg_dump -h localhost -d IIUM_Inbound_Outbound -Fp -f $backupPath/$backupFileName -w";

        // Execute the pg_dump command
        exec($command);
    }

}
