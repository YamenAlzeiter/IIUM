<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var backend\models\UserAdmin $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="user-admin-form">
    <?php $form = ActiveForm::begin(); ?>

	<div class="row">
		<div class="col-md-6">
            <?= $form->field($model, 'username')->textInput(['maxlength' => true, 'required' => true]) ?>
		</div>
		<div class="col-md-6">
            <?= $form->field($model, 'matric_number')->textInput(['required' => true]) ?>
		</div>
	</div>

    <?= $form->field($model, 'email')->textInput(['maxlength' => true, 'required' => true]) ?>

	<div class="form-group mt-2">
        <?= Html::submitButton('Save', ['class' => 'btn btn-info']) ?>
	</div>

    <?php ActiveForm::end(); ?>
</div>


