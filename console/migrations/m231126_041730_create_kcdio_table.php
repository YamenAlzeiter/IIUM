<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%kcdio}}`.
 */
class m231126_041730_create_kcdio_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('{{%kcdio}}', [
            'id' => $this->primaryKey(),
            'kcdio' => $this-> string(100),
        ]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('{{%kcdio}}');
    }
}
