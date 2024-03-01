<?php

namespace backend\models;

use common\models\Admin;
use Yii;
use yii\base\Model;
use common\models\User;

/**
 * Signup form
 */
class SignupForm extends Model
{
    public $username;
    public $email;
    public $password;
    public $matric_number;


    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            ['username', 'trim'],
            ['username', 'required'],
            ['username', 'unique', 'targetClass' => '\common\models\Admin', 'message' => 'This username has already been taken.'],
            ['username', 'string', 'min' => 2, 'max' => 255],

            ['email', 'trim'],
            ['email', 'required'],
            ['email', 'email'],
            ['email', 'string', 'max' => 255],
            ['email', 'unique', 'targetClass' => '\common\models\Admin', 'message' => 'This email address has already been taken.'],

            ['password', 'required'],
            ['password', 'string', 'min' => Yii::$app->params['user.passwordMinLength']],

            ['matric_number', 'required'],
            ['matric_number', 'unique', 'targetClass' => '\common\models\Admin', 'message' => 'This matric number has already been taken.'],
            ['matric_number', 'integer', 'min' => 7],
            [['username', 'email', 'matric_number'],  'filter', 'filter' => 'htmlspecialchars']


        ];
    }



    /**
     * Signs user up.
     *
     * @return bool whether the creating new account was successful and email was sent
     */
    public function signup()
    {
        if (!$this->validate()) {
            return null;
        }
        $user = new Admin();
        $user->username = $this->username;
        $user->email = $this->email;
        $user->matric_number = $this->matric_number;
        $user->setPassword($this->password);
        $user->generateAuthKey();

        return $user->save();
    }
}
