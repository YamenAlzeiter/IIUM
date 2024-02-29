<?php

/** @var yii\web\View $this */
/** @var yii\bootstrap5\ActiveForm $form */

/** @var SignupForm $model */

use frontend\models\SignupForm;
use yii\bootstrap5\ActiveForm;
use yii\bootstrap5\Html;

$this->title = 'Signup';

?>

<?php $form = ActiveForm::begin([ 'enableClientValidation' => false, 'id' => 'form-signup']); ?>

<?= $form->field($model, 'username')->textInput() ?>

<?= $form->field($model, 'email') ?>

<?= $form->field($model, 'password')->passwordInput(['id' => 'password']) ?>

<div class = "form-check mb-2">
	<input class = "form-check-input" type = "checkbox" id = "show-password-toggle">
	<label class = "form-check-label" for = "show-password-toggle">Show Password</label>
</div>

<?= $form->field($model, 'type', [
    'template' => "{label}\n{input}\n{error}",
])->radioList(['I' => 'Inbound', 'O' => 'Outbound'], [
    'class' => 'form-check-inline mt-2',
    'item' => function($index, $label, $name, $checked, $value) {
        $disabled = $index == 2 ? 'disabled' : ''; // Add condition for disabled item
        $id = "inlineRadio" . ($index + 1); // Generate unique ID for each radio button
        return
            '<div class="form-check form-check-inline">' .
            '<input class="form-check-input" type="radio" name="' . $name . '" id="' . $id . '" value="' . $value . '" ' . $checked . ' ' . $disabled . '>' .
            '<label class="form-check-label" for="' . $id . '">' . $label . ($disabled ? ' (disabled)' : '') . '</label>' .
            '</div>';
    },
])->label('Mobility Type: ', ['class'=>'me-2 fw-semibold']) ?>

	<script>
        $(document).ready(function () {
            $('input[name="SignupForm[type]"]').change(function () {
                var selectedValue = $(this).val();
                if (selectedValue === 'O') {
                    $('#matric-number-field').show();
                    $('#signupform-matric_number').prop('required', true);
                } else {
                    $('#matric-number-field').hide();
                    $('#signupform-matric_number').prop('required', false);
                }
            });
        });
	</script>


	<div id="matric-number-field" style="display: none;">
        <?= $form->field($model, 'matric_number')->textInput() ?>
	</div>

<div class = "form-group">
    <?= Html::submitButton('Signup', ['class' => 'btn btn-dark fs-5  w-100 py-8 mb-4 rounded-2 mt-2', 'name' => 'signup-button']) ?>
</div>

<?php ActiveForm::end(); ?>