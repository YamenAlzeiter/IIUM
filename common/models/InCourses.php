<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "in_courses".
 *
 * @property int $id
 * @property string|null $course_code
 * @property string|null $course_name
 * @property int|null $credit_hours
 * @property int|null $student_id
 *
 * @property Inbound $student
 */
class InCourses extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'in_courses';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['credit_hours', 'student_id'], 'integer'],
            [['course_code'], 'string', 'max' => 20],
            [['course_name'], 'string', 'max' => 255],
            [['student_id'], 'exist', 'skipOnError' => true, 'targetClass' => Inbound::class, 'targetAttribute' => ['student_id' => 'ID']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'course_code' => 'Course Code',
            'course_name' => 'Course Name',
            'credit_hours' => 'Credit Hours',
            'student_id' => 'Student ID',
        ];
    }

    /**
     * Gets query for [[Student]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getStudent()
    {
        return $this->hasOne(Inbound::class, ['ID' => 'student_id']);
    }
}
