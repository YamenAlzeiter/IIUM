<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "outFiles".
 *
 * @property int $ID
 * @property int|null $Student_ID
 * @property string|null $location
 * @property string|null $created_at
 *
 * @property Outbound $student
 */
class OutFiles extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'outFiles';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['Student_ID'], 'default', 'value' => null],
            [['Student_ID'], 'integer'],
            [['created_at'], 'safe'],
            [['location'], 'file', 'extensions' => 'png, pdf, jpg, mp4, mov', 'maxFiles' => 5, 'skipOnEmpty' => false, 'skipOnError' => false],
            [['Student_ID'], 'exist', 'skipOnError' => true, 'targetClass' => Outbound::class, 'targetAttribute' => ['Student_ID' => 'ID']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'ID' => 'ID',
            'Student_ID' => 'Student ID',
            'location' => 'Location',
            'created_at' => 'Created At',
        ];
    }

    /**
     * Gets query for [[Student]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getStudent()
    {
        return $this->hasOne(Outbound::class, ['ID' => 'Student_ID']);
    }
}
