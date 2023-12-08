<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use dosamigos\ckeditor\CKEditor;

/* @var $this yii\web\View */
/* @var $model common\models\EmailTemplate */
/* @var $form yii\widgets\ActiveForm */
?>


    <?php $form = ActiveForm::begin(); ?>
<div class="row g-3 align-items-center">
	<div class="col-1">
		<label for="inputPassword6" class="col-form-label">Subject:</label>
	</div>
	<div class="col-11">
    <?= $form->field($model, 'subject')->textInput(['maxlength' => true])->label(false) ?>
	</div>
<div class="row g-3 align-items-start">
	<div class="col-1">
		<label for="inputPassword6" class="col-form-label">Body:</label>
	</div>
	<div class="col-11">
    <?= $form->field($model, 'body')->widget(CKEditor::class, [
        'options' => ['rows' => 12],
        'preset' => 'full', // You can customize the preset as needed
    ])->hint('You can use placeholders like {recipientName} in the content.')->label(false); ?>
	</div>
	<div class="form-group text-end">
        <?= Html::submitButton('Save', ['class' => 'btn btn-dark']) ?>
	</div>

    <?php ActiveForm::end(); ?>

