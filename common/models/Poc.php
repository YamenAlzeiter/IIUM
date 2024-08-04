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
 * @property string|null $email_cc_additional
 * @property string|null $name_cc1
 * @property string|null $name_cc2
 */
class Poc extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'ac_iosys.poc';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'email', 'email_cc', 'KCDIO', 'email_cc_additional', 'name_cc1', 'name_cc2'], 'string', 'max' => 512],
            [['name','email', 'email_cc', 'KCDIO', 'email_cc_additional', 'name_cc1', 'name_cc2'],  'filter', 'filter' => 'htmlspecialchars']
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
            'email_cc_additional' => 'Additional Email Cc',
            'name_cc1' => 'Name of Cc',
            'name_cc2' => 'Name of Cc 2',
        ];
    }
}
