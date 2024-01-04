<?php
namespace console\controllers;

use Carbon\Carbon;
use common\models\EmailTemplate;
use common\models\Outbound;
use Yii;
use yii\console\Controller;

class ReminderController extends Controller
{
    public function actionSendEmailReminders()
    {
        $mailer = Yii::$app->mailer;
        $emailTemplate = EmailTemplate::findOne(9);
        // Fetch records where the mobility_until date is two weeks from now

        $twoWeeksFromNow = Carbon::now()->addWeeks(2)->startOfDay()->format('Y-m-d');
        $users = Outbound::find()
            ->where(['<=', 'Mobility_until', $twoWeeksFromNow])
            ->all();

        foreach ($users as $user) {
            $recipientEmail = $user->Email; // Assuming Email is the attribute in your Outbound model

if ($user->Status === 61){
    $body = $emailTemplate->body;

    $body = str_replace('{recipientName}', $user->Name, $body);

    Yii::$app->mailer->compose(['html' => '@backend/views/email/emailTemplate.php'],
        ['subject' => $emailTemplate->subject, 'body' => $body])->
        setFrom(["noreply@example.com" => "My Application"])->setTo($recipientEmail)->setSubject($emailTemplate->subject)->send();

    $user->Status = 71;
    $user->save();
}
            // Compose the email using the view file and pass necessary variables


        }

        echo "Reminders sent successfully.\n";
    }
}
