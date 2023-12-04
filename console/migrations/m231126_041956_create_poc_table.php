<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%poc}}`.
 */
class m231126_041956_create_poc_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('{{%poc}}', [
            'id' => $this->primaryKey(),
            'name' => $this->string(512),
            'email' => $this->string(512),
            'email_cc' => $this->string(512),
            'KCDIO'=>$this->string(512),
            'kulliah'=>$this->string(512),
            'phone_number' =>$this->string(15),

        ]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('{{%poc}}');
    }
}
