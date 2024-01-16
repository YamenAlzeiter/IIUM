<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%outFiles}}`.
 */
class m240116_004016_create_outFiles_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('{{%outFiles}}', [
            'ID' => $this->primaryKey(),
            'Student_ID' => $this->integer(),
            'location' => $this->string(),
            'created_at' => $this->dateTime(),
        ]);
        $this->addForeignKey(
            'fk-outbound-files-student_id',
            'outFiles',
            'Student_ID',
            'outbound',
            'ID',
            'CASCADE'
        );
    }

    /**
     * {@inheritdoc}
     */
    public function down()
    {
        $this->dropForeignKey('fk-outbound-files-student_id', 'OutboundFiles');
        $this->dropTable('outFiles');
    }
}
