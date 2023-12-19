<?php

use yii\db\Migration;

/**
 * Class m231219_011048_add_temp_column
 */
class m231219_011048_add_temp_column extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->addColumn('{{%outbound}}', 'temp', $this->string());
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m231219_011048_add_temp_column cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m231219_011048_add_temp_column cannot be reverted.\n";

        return false;
    }
    */
}
