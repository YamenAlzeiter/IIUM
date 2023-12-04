<?php

use yii\db\Migration;

/**
 * Class m231204_025430_create_host_email_column
 */
class m231204_025430_create_host_email_column extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->addColumn('{{%outbound}}', 'Connect_host_email', $this->string(512));
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m231204_025430_create_host_email_column cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m231204_025430_create_host_email_column cannot be reverted.\n";

        return false;
    }
    */
}
