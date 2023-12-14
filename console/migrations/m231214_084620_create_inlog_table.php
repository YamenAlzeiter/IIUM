<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%inlog}}`.
 */
class m231214_084620_create_inlog_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('{{%inlog}}', [
            'id' => $this->primaryKey(),
            'outbound_id' => $this->integer(),
            'old_status' => $this->integer(),
            'new_status' => $this->integer(),
            'message' => $this->string(),

            'created_at' => $this->timestamp()->defaultExpression('CURRENT_TIMESTAMP'),
            'updated_at' => $this->timestamp()->defaultValue(null),

        ]);
        $this->addForeignKey(
            'fk-status_log-outbound_id',
            '{{inlog}}',
            'outbound_id',
            '{{inbound}}',
            'ID',
            'CASCADE',
            'CASCADE'
        );
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('{{%inlog}}');
    }
}
