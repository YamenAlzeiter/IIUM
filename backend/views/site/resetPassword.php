<?php

/** @var yii\web\View $this */
/** @var yii\bootstrap5\ActiveForm $form */

/** @var ResetPasswordForm $model */

use frontend\models\ResetPasswordForm;
use yii\bootstrap5\ActiveForm;
use yii\bootstrap5\Html;

$this->title = 'Reset password';
?>
<div class = "site-reset-password">
    <div id = "main-wrapper">
        <div class = "position-relative overflow-hidden radial-gradient min-vh-100 w-100 d-flex align-items-center justify-content-center">
            <div class = "d-flex align-items-center justify-content-center w-100">
                <div class = "row justify-content-center w-100">
                    <div class = "col-md-8 col-lg-6 col-xxl-3 auth-card">
                        <div class = "card mb-0">
                            <div class = "card-body">
                                <h1 class = "text-center fs-8"><?= Html::encode($this->title) ?></h1>
                                <p class = "text-center">Please choose your new password:</p>
                                <?php $form = ActiveForm::begin(['id' => 'reset-password-form']); ?>
                                <?= $form->field($model, 'password')->passwordInput(['autofocus' => true]) ?>
                                <?= Html::submitButton('Save',
                                    ['class' => 'btn btn-primary w-100 py-8 mb-4 rounded-2']) ?>
                                <?php ActiveForm::end(); ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


