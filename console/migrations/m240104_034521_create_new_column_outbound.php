<?php

use yii\db\Migration;

/**
 * Class m240104_034521_create_new_column_outbound
 */
class m240104_034521_create_new_column_outbound extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->addColumn('{{%outbound}}', 'driveLink', $this->string());
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m240104_034521_create_new_column_outbound cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m240104_034521_create_new_column_outbound cannot be reverted.\n";

        return false;
    }
    */
}
