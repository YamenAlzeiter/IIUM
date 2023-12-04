<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%courses}}`.
 */
class m231126_042305_create_courses_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('{{%courses}}', [
            'id' => $this->primaryKey(),
            'course_code' => $this->string(20)->notNull(),
            'course_name' => $this->string(255)->notNull(),
            'credit_hours' => $this->integer()->notNull(),
            'student_id' => $this->integer(), // Define a foreign key here
        ]);

// Add a foreign key constraint
        $this->addForeignKey(
            'fk_courses_student', // ForeignKey name
            '{{%courses}}', // Source table
            'student_id', // Source column
            '{{%outbound}}', // Target table (Assuming 'ob010' is the table name in your database)
            'ID', // Target column
            'CASCADE' // Optional: Define the ON DELETE behavior (e.g., CASCADE, SET NULL)
        );
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('{{%courses}}');
    }
}
