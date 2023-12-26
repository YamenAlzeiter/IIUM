<?php

use yii\db\Migration;

/**
 * Class m231226_140519_user_new_column
 */
class m231226_140519_user_new_column extends Migration
{
    public function safeUp()
    {
        $this->addColumn('{{%user}}', 'type', $this->char(1)->notNull()->defaultValue('I'));
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropColumn('{{%user}}', 'type');
    }
}
