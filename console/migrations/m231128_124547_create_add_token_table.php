<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%add_token}}`.
 */
class m231128_124547_create_add_token_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->addColumn('{{%outbound}}', 'Connect_host_email', $this->string(512));
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
//        $this->dropTable('{{%add_token}}');
    }
}
