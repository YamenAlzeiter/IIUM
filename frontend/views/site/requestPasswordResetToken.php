<?php

/** @var yii\web\View $this */
/** @var yii\bootstrap5\ActiveForm $form */
/** @var \frontend\models\PasswordResetRequestForm $model */

use yii\bootstrap5\Html;
use yii\bootstrap5\ActiveForm;

$this->title = 'Request password reset';
?>


			<p>Please fill out your email. A link to reset password will be sent there.</p>


                    <?php $form = ActiveForm::begin(['id' => 'request-password-reset-form']); ?>

                    <?= $form->field($model, 'email')->textInput(['autofocus' => true]) ?>

					<div class="text-center">
                        <?= Html::submitButton('Send', ['class' => 'btn btn-dark fs-5  w-100 py-8 mb-4 rounded-2 mt-2']) ?>
					</div>

                    <?php ActiveForm::end(); ?>


