<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%email_template}}`.
 */
class m231219_020928_create_email_template_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('{{%email_template}}', [
            'id' => $this->primaryKey(), 'subject' => $this->string(255), 'body' => $this->text(),
        ]);

        $this->insert('{{%email_template}}', [
            'id' => '1', 'subject' => 'Customizable Email Template, this Template will be directed to KCDIO',
            'body' => "Welcome! This serves as a default email template. Please customize the email message according to your preferences.",
        ]);
        $this->insert('{{%email_template}}', [
            'id' => '2', 'subject' => 'Customizable Email Template, this Template will be  for Re-submission to KCDIO after Initial Rejection',
            'body' => "Welcome! This serves as a default email template. Please customize the email message according to your preferences.",
        ]);
        $this->insert('{{%email_template}}', [
            'id' => '3', 'subject' => 'Adjustable Email Template for Incomplete Document Notification to Applicants',
            'body' => "Welcome! This serves as a default email template. Please customize the email message according to your preferences.",
        ]);
        $this->insert('{{%email_template}}', [
            'id' => '4', 'subject' => 'Adjustable Email Template for Rejection Notification to Applicants',
            'body' => "Welcome! This serves as a default email template. Please customize the email message according to your preferences.",
        ]);
        $this->insert('{{%email_template}}', [
            'id' => '5', 'subject' => 'Customizable Email Template, this Template will be directed to Student require the student to upload his document',
            'body' => "Welcome! This serves as a default email template. Please customize the email message according to your preferences.",
        ]);
        $this->insert('{{%email_template}}', [
            'id' => '6', 'subject' => 'Customizable Email Template, this Template will be directed to Student Congratulate the student for acceptance ',
            'body' => "Welcome! This serves as a default email template. Please customize the email message according to your preferences.",
        ]);
        $this->insert('{{%email_template}}', [
            'id' => '7', 'subject' => 'Customizable Email Template, this Template will be directed to Student requesting to upload document before coming back to IIUM',
            'body' => "Welcome! This serves as a default email template. Please customize the email message according to your preferences.",
        ]);

    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('{{%email_template}}');
    }
}
