<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "poc".
 *
 * @property int $id
 * @property string|null $name
 * @property string|null $email
 * @property string|null $email_cc
 * @property string|null $KCDIO
 * @property string|null $kulliah
 * @property string|null $phone_number
 */
class Poc extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'poc';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'email', 'email_cc', 'KCDIO', 'kulliah'], 'string', 'max' => 512],
            [['phone_number'], 'string', 'max' => 15],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'email' => 'Email',
            'email_cc' => 'Email Cc',
            'KCDIO' => 'Kcdio',
            'kulliah' => 'Kulliah',
            'phone_number' => 'Phone Number',
        ];
    }
}
