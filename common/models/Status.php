<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "Status".
 *
 * @property int $ID
 * @property string|null $description
 * @property string $status
 */
class Status extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'ac_iosys.Status';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['description','status'], 'string', 'max' => 512],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'ID' => 'ID',
            'description' => 'Description',
        ];
    }
}
