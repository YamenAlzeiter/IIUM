<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

$this->title = 'Approval';

/** @var common\models\Inbound $model */
require Yii::getAlias('@common').'/Helpers/helper.php';
?>


<div class = "row">
	<div class = "col-lg-6 d-flex flex-column">
		<div class = "card shadow-none border bg-light-subtle flex-fill">
			<div class = "card-body">
				<div class = "d-flex justify-content-between">
					<div class = "d-flex align-items-center header-info gap-1 mb-3">
						<i class = "ti ti-user-circle text-dark"></i>
						<strong>
							<h4 class = "fw-semibold m-0">Personal Info</h4>
						</strong>
					</div>
                    <?= Html::a('<button class="btn btn-warning p-3 rounded-circle d-flex align-items-center justify-content-center customizer-btn"><i class="ti ti-eye fs-5"></i></button>',
                        ['view-full', 'ID' => $model->ID, 'token' => $model->Token],) ?>
				</div>
				<p class = "mb-2"><strong>Name:</strong> <?= $model->Name ?></p>
				<p class = "mb-2"><strong>Citizenship:</strong> <?= $model->Citizenship ?></p>
				<p class = "mb-2"><strong>Email Address:</strong> <?= $model->Email_address ?></p>
				<p class = "mb-2"><strong>Date of Birth:</strong> <?= $model->Date_of_Birth ?></p>
				<p class = "mb-2"><strong>Gender:</strong> <?= getGenderMeaning($model->Gender) ?></p>
				<p class = "mb-2"><strong>Passport Number:</strong> <?= $model->Country_of_origin ?></p>
			</div>
		</div>
	</div>
	<div class = "col-lg-6 d-flex flex-column">
		<div class = "card shadow-none border bg-light-danger flex-fill">
			<div class = "card-body">
				<div class = "d-flex justify-content-between">
					<div class = "d-flex align-items-center header-info gap-1 mb-3">
						<i class = "ti ti-school text-dark"></i>
						<strong>
							<h4 class = "fw-semibold m-0">Applicant Academic Background</h4>
						</strong>
					</div>
				</div>
				<p class = "mb-2"><strong>Reference Number:</strong> <?= $model->reference_number ?></p>
				<p class = "mb-2"><strong>Programme:</strong> <?= $model->Propose_type_of_programme ?></p>
				<p class = "mb-2"><strong>Kulliyyah:</strong> <?= $model->Propose_kulliyyah_applied ?></p>
			</div>
		</div>
	</div>
</div>



<div class = "d-flex justify-content-between">


</div>
<div class = "ob010-view">

<?php $form = ActiveForm::begin([
    'action' => ['approve', 'ID' => $model->ID, 'token' => $model->Token], 'options' => ['class' => 'form']
]) ?>

<div class = "mb-3">
    <?= $form->field($model, 'offer_letter')->fileInput([
        'class' => 'form-control', 'required' => true
    ])->label('Upload Offer Letter') ?>
</div>

<div class = "form-group">
    <?= Html::submitButton('Submit', ['class' => 'button submit-btn submity', 'name' => 'saveWithoutValidation']) ?>
</div>

<?php ActiveForm::end(); ?>




