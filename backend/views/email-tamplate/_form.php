<?php

use dosamigos\tinymce\TinyMce;
use Itstructure\CKEditor\CKEditor;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\EmailTemplate */
/* @var $form yii\widgets\ActiveForm */
?>

<?php $form = ActiveForm::begin(); ?>
<div class = "row g-3 align-items-center">
    <div class = "col-1">
        <label for = "inputPassword6" class = "col-form-label">Subject:</label>
    </div>
    <div class = "col-11">
        <?= $form->field($model, 'subject')->textInput(['maxlength' => true])->label(false) ?>
    </div>
    <div class = "row g-3 align-items-start">
        <div class = "col-1">
            <label for = "inputPassword6" class = "col-form-label">Body:</label>
        </div>
        <div class = "col-11">
            <?= $form->field($model, 'body')->widget(CKEditor::class, [
                'options' => ['id' => 'emailtemplate-body'],
            ])->label(false) ?>

            <!-- Buttons for inserting content -->
            <button class = "btn btn-outline-dark" type = "button" id = "recipientNameButton">Insert Recipient Name
            </button>
            <button class = "btn btn-outline-dark" type = "button" id = "reasonButton">Insert Reason</button>
            <button class = "btn btn-outline-dark" type = "button" id = "linkButton">Insert Link</button>
        </div>
        <div class = "form-group text-end">
            <?= Html::submitButton('Save', ['class' => 'btn btn-dark']) ?>
        </div>
    </div>
</div>
<?php ActiveForm::end(); ?>
