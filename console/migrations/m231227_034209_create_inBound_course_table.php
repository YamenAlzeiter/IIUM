<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%in_courses}}`.
 */
class m231227_034209_create_inBound_course_table extends Migration
{
    public function safeUp()
    {
        $this->createTable('{{%in_courses}}', [
            'id' => $this->primaryKey(),
            'course_code' => $this->string(20),
            'course_name' => $this->string(255),
            'credit_hours' => $this->integer(),
            'student_id' => $this->integer(), // Define a foreign key here
        ]);

// Add a foreign key constraint
        $this->addForeignKey(
            'fk_courses_student', // ForeignKey name
            '{{%in_courses}}', // Source table
            'student_id', // Source column
            '{{%inbound}}', // Target table (Assuming 'ob010' is the table name in your database)
            'ID', // Target column
            'CASCADE' // Optional: Define the ON DELETE behavior (e.g., CASCADE, SET NULL)
        );
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('{{%in_courses}}');
    }
}
