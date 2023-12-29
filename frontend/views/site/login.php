<?php

/** @var yii\web\View $this */
/** @var yii\bootstrap5\ActiveForm $form */

/** @var LoginForm $model */

use common\models\LoginForm;
use yii\bootstrap5\Html;
use yii\bootstrap5\ActiveForm;

$this->title = 'Login';

?>




            <?php $form = ActiveForm::begin(['id' => 'login-form']); ?>

            <?= $form->field($model, 'username')->textInput(['autofocus' => true]) ?>

            <?= $form->field($model, 'password')->passwordInput() ?>

            <?= $form->field($model, 'rememberMe')->checkbox() ?>

			<div class = "my-1 mx-0" style = "color:#999;">
				If you forgot your password you can <?= Html::a('reset it',
                    ['site/request-password-reset']) ?>.
				<br>
				Need new verification email? <?= Html::a('Resend',
                    ['site/resend-verification-email']) ?>
			</div>

			<div class = "form-group d-flex align-items-center mt-3 gap-2">
                <?= Html::submitButton('Login',
                    ['class' => 'btn btn-dark fs-5', 'name' => 'login-button']) ?>
				<p class="mb-0">or</p>
                <?= Html::a('Sign Up Here!', ['site/signup'], ['class' => 'text-decoration-underline']) ?>

			</div>

            <?php ActiveForm::end(); ?>

