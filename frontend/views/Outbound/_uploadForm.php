<?php

use yii\bootstrap5\Html;
use yii\bootstrap5\ActiveForm;

/** @var yii\web\View $this */
/** @var common\models\Ob010 $model */

?>
<?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]); ?>
	<div class = "row d-flex align-items-center justify-content-center">
		<div class = "col-md-6">
			<div class = "mb-3">
				<label for = "formFile" class = "form-label">Proof of sponsorship/ Funding/ Grant(Official Letter)</label>
			</div>
		</div>
		<div class = "col-md-6">
			<div class = "mb-3">
                <?= $form->field($model, 'proof_of_sponsorship')->fileInput([
                    'class' => 'form-control', 'id' => 'formFile' , 'required' => true,
                ])->label(false) ?>
			</div>
		</div>
	</div>
	<div class = "row d-flex align-items-center justify-content-center">
		<div class = "col-md-6">
			<div class = "mb-3">
				<label for = "formFile" class = "form-label">Proof of purchased insurance coverage</label>
			</div>
		</div>
		<div class = "col-md-6">
			<div class = "mb-3">
                <?= $form->field($model, 'proof_insurance_cover')->fileInput([
                    'class' => 'form-control', 'id' => 'formFile' , 'required' => true,
                ])->label(false) ?>
			</div>
		</div>
	</div>
	<div class = "row d-flex align-items-center justify-content-center">
		<div class = "col-md-6">
			<div class = "mb-3">
				<label for = "formFile" class = "form-label">Letter of indemnity (Download the tamplate from International Office website)</label>
			</div>
		</div>
		<div class = "col-md-6">
			<div class = "mb-3">
                <?= $form->field($model, 'letter_of_indemnity')->fileInput([
                    'class' => 'form-control', 'id' => 'formFile' , 'required' => true,
                ])->label(false) ?>
			</div>
		</div>
	</div>
	<div class = "row d-flex align-items-center justify-content-center">
		<div class = "col-md-6">
			<div class = "mb-3">
				<label for = "formFile" class = "form-label">Copy of flight ticket</label>
			</div>
		</div>
		<div class = "col-md-6">
			<div class = "mb-3">
                <?= $form->field($model, 'flight_ticket')->fileInput([
                    'class' => 'form-control', 'id' => 'formFile', 'required' => true,
                ])->label(false) ?>
			</div>
		</div>
	</div>

	<div class = "form-group mt-2">
        <?= Html::submitButton('Submit', ['class' => 'btn btn-primary btn-lg']) ?>
	</div>

<?php ActiveForm::end(); ?>