<?php

use yii\db\Migration;

/**
 * Class m231213_064744_create_alter_matric_number
 */
class m231213_064744_create_alter_matric_number extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function up()
    {
        // Change the matric_number column to string
        $this->alterColumn('{{%user_admin}}', 'matric_number', $this->string(8)->notNull()->unique());
    }

    /**
     * {@inheritdoc}
     */
    public function down()
    {
        // Revert the changes if needed
        $this->alterColumn('{{%user_admin}}', 'matric_number', $this->integer(8)->notNull()->unique());
    }
    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m231213_064744_create_alter_matric_number cannot be reverted.\n";

        return false;
    }
    */
}
