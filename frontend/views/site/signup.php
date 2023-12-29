<?php

/** @var yii\web\View $this */
/** @var yii\bootstrap5\ActiveForm $form */
/** @var \frontend\models\SignupForm $model */

use yii\bootstrap5\Html;
use yii\bootstrap5\ActiveForm;

$this->title = 'Signup';

?>


			<p>Please fill out your email. A link to reset password will be sent there.</p>

            <?php $form = ActiveForm::begin(['id' => 'form-signup']); ?>

            <?= $form->field($model, 'username')->textInput(['autofocus' => true]) ?>

            <?= $form->field($model, 'email') ?>

            <?= $form->field($model, 'type')->radioList(['I' => 'Inbound', 'O' => 'Outbound'])->label('IDK ?') ?>

            <?= $form->field($model, 'password')->passwordInput() ?>

			<div class="form-group">
                <?= Html::submitButton('Signup', ['class' => 'btn btn-dark', 'name' => 'signup-button']) ?>
			</div>

            <?php ActiveForm::end(); ?>




