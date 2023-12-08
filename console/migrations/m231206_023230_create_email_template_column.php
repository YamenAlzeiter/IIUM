<?php

use yii\db\Migration;

/**
 * Class m231206_023230_create_email_template_column
 */
class m231206_023230_create_email_template_column extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('email_template', [
            'subject' => $this->string()->notNull(),
            'body' => $this->text()->notNull(),
        ]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m231206_023230_create_email_template_column cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m231206_023230_create_email_template_column cannot be reverted.\n";

        return false;
    }
    */
}
