<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%user_admin}}`.
 */
class m231126_042929_create_user_admin_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $tableOptions = null;
        if ($this->db->driverName === 'mysql') {
            // https://stackoverflow.com/questions/766809/whats-the-difference-between-utf8-general-ci-and-utf8-unicode-ci
            $tableOptions = 'CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE=InnoDB';
        }

        $this->createTable('{{%user_admin}}', [
            'id' => $this->primaryKey(), 'username' => $this->string()->notNull()->unique(),
            'matric_number' => $this->integer(8)->notNull()->unique(), 'auth_key' => $this->string(32)->notNull(),
            'password_hash' => $this->string()->notNull(), 'password_reset_token' => $this->string()->unique(),
            'email' => $this->string()->notNull()->unique(),

            'status' => $this->smallInteger()->notNull()->defaultValue(10), 'created_at' => $this->integer()->notNull(),
            'updated_at' => $this->integer()->notNull(),
        ], $tableOptions);


        //-----------------default super admin account-----------------

        $this->insert('{{%user_admin}}', [
            'username' => 'superAdmin', 'matric_number' => 1725635,
            'auth_key' => Yii::$app->security->generateRandomString(),
            'password_hash' => Yii::$app->security->generatePasswordHash('admin'), 'email' => 'admin@example.com',
            'status' => 10, 'created_at' => time(), 'updated_at' => time(),
        ]);

    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('{{%user_admin}}');
    }
}
