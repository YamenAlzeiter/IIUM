<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%iiumcourses}}`.
 */
class m231126_042322_create_iiumcourses_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('{{%iiumcourse}}', [
            'id' => $this->primaryKey(),
            'course_code' => $this->string(20),
            'course_name' => $this->string(255),
            'credit_hours' => $this->integer(),
            'student_id' => $this->integer(), // Define a foreign key here
        ]);

        $this->addForeignKey(
            'fk_iiumcourses_student', // ForeignKey name
            '{{%iiumcourse}}', // Source table
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
        $this->dropTable('{{%iiumcourses}}');
    }
}
