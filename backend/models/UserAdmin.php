<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "user_admin".
 *
 * @property int $id
 * @property string $username
 * @property int $matric_number
 * @property string $auth_key
 * @property string $password_hash
 * @property string|null $password_reset_token
 * @property string $email
 * @property int $status
 * @property int $created_at
 * @property int $updated_at
 * @property string|null $verification_token
 *
 */
class UserAdmin extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'ac_iosys.user_admin';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [

            [['matric_number', 'status', 'created_at', 'updated_at'], 'integer'],
            [['username', 'password_hash', 'password_reset_token', 'email', ], 'string', 'max' => 255],
            [['auth_key'], 'string', 'max' => 32],
            [['email','email','matric_number'], 'unique'],
            [['password_reset_token'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'username' => 'Username',
            'matric_number' => 'Matric Number',
            'auth_key' => 'Auth Key',
            'password_hash' => 'Password Hash',
            'password_reset_token' => 'Password Reset Token',
            'email' => 'Email',
            'status' => 'Status',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',

        ];
    }
}
