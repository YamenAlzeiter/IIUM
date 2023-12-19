<?php

use yii\db\Migration;

/**
 * Class m231219_013427_add_temp_column_for_inbound
 */
class m231219_013427_add_temp_column_for_inbound extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->addColumn('{{%inbound}}', 'temp', $this->string());
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m231219_013427_add_temp_column_for_inbound cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m231219_013427_add_temp_column_for_inbound cannot be reverted.\n";

        return false;
    }
    */
}
