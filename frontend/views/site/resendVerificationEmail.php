<?php

/** @var yii\web\View $this */
/** @var yii\bootstrap5\ActiveForm $form */

/** @var ResetPasswordForm $model */

use frontend\models\ResetPasswordForm;
use yii\bootstrap5\Html;
use yii\bootstrap5\ActiveForm;

$this->title = 'Resend verification email';

?>


<p>Please fill out your email. A link to reset password will be sent there.</p>


<?php $form = ActiveForm::begin(['id' => 'resend-verification-email-form']); ?>

<?= $form->field($model, 'email')->textInput(['autofocus' => true]) ?>

<div class = "form-group">
    <?= Html::submitButton('Send', ['class' => 'btn btn-primary']) ?>
</div>

<?php ActiveForm::end(); ?>

