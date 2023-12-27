<?php

use yii\db\Migration;

/**
 * Class m231227_042435_add_status_column_table
 */
class m231227_042435_add_status_column_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->addColumn('{{%Status}}', 'status', $this->string(512));
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m231227_042435_add_status_column_table cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m231227_042435_add_status_column_table cannot be reverted.\n";

        return false;
    }
    */
}
