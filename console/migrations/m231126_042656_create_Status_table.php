<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%Status}}`.
 */
class m231126_042656_create_Status_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('{{%Status}}', [
            'id' => $this->primaryKey(),
            'description' => $this->string(35),
        ]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('{{%Status}}');
    }
}
