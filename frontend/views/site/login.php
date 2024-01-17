<?php

/** @var yii\web\View $this */
/** @var yii\bootstrap5\ActiveForm $form */

/** @var LoginForm $model */

use common\models\LoginForm;
use yii\bootstrap5\ActiveForm;
use yii\bootstrap5\Html;

$this->title = 'Login';

?>

<?php $form = ActiveForm::begin(['id' => 'login-form']); ?>

<?= $form->field($model, 'username')->textInput()->label('Email') ?>


<?= $form->field($model, 'password', ['options' => ['class' => 'mb-4']])->passwordInput(['id'=>'password']) ?>
<div class = "form-check mb-2">
	<input class = "form-check-input" type = "checkbox" id = "show-password-toggle">
	<label class = "form-check-label" for = "show-password-toggle">Show Password</label>
</div>

<div class="d-flex align-items-center justify-content-between mb-4">

    <?= $form->field($model, 'rememberMe',
        ['options' => ['class' => 'mb-0']])->checkbox(['class' => 'form-check-input primary'])->label('Remember this Device', ['class' => 'form-check-label text-dark fs-3']) ?>

    <?= Html::a('Forgot Password?', ['site/request-password-reset'],['class' =>'text-primary fw-medium fs-3']) ?>
</div>

<?= Html::submitButton('Login', ['class' => 'btn btn-dark fs-5  w-100 py-8 mb-4 rounded-2', 'name' => 'login-button']) ?>

<div class="d-flex align-items-center justify-content-center">
	<p class="fs-4 mb-0 fw-medium">New to IIUM?</p>
    <?= Html::a('Create an Account', ['site/signup'], ['class' => 'text-primary fw-medium ms-2']) ?>
</div>




<?php ActiveForm::end(); ?>

