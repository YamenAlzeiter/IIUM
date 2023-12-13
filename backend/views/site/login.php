<?php

/** @var yii\web\View $this */
/** @var yii\bootstrap5\ActiveForm $form */

/** @var \common\models\AdminLoginForm $model */

use common\models\LoginForm;
use yii\bootstrap5\ActiveForm;
use yii\bootstrap5\Html;

$this->title = 'Login';
?>
<div class = "site-login">
	<div class = "mt-5 offset-lg-3 col-lg-6">
		<h1 class = "text-center"><?= Html::encode($this->title) ?></h1>

		<p class = "text-center">Please fill out the following fields to login:</p>

        <?php $form = ActiveForm::begin(['id' => 'login-form']); ?>

        <?= $form->field($model, 'username')->textInput([
            'autofocus' => true, 'placeholder' => 'Enter Matric Card'
        ])->label(false) ?>

        <?= $form->field($model,
            'password')->passwordInput(['placeholder' => 'Please Enter your Password'])->label(false) ?>

        <?= $form->field($model, 'rememberMe')->checkbox() ?>
		<div class = "my-1 mx-0" style = "color:#999;">
			If you forgot your password you can <?= Html::a('reset it', ['site/request-password-reset']) ?>.
			<br>

		</div>

		<div class = "form-group mt-4">
            <?= Html::submitButton('Login', ['class' => 'btn btn-primary px-3', 'name' => 'login-button']) ?>
		</div>

        <?php ActiveForm::end(); ?>
	</div>
</div>
