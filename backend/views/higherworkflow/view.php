<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
/** @var common\models\Inbound $model */

$this->title = 'Approval';
$creationYearLastTwoDigits = date('y', strtotime($model->created_at));

$fileName = $creationYearLastTwoDigits . '_' . $model->ID;
/** @var common\models\Inbound $model */
require Yii::getAlias('@common').'/Helpers/helper.php';
?>

<div class = "d-flex gap-2 justify-content-end mb-4 align-items-center">
	<a href="/higherworkflow/view-file?ID=<?= $model->ID ?>&fileName=<?= $fileName ?>_offerLetter.pdf&token=<?= $model->Token ?>" class = "btn btn-outline-dark d-flex align-items-center px-3"
	   id = "action"><span class = "d-none d-md-block font-weight-medium fs-3">View Passport</span></a>

    <?= Html::a('<button class="btn btn-warning p-3 rounded-circle d-flex align-items-center justify-content-center customizer-btn"><i class="ti ti-eye fs-5"></i></button>',
        ['view-full', 'ID' => $model->ID, 'token' => $model->Token],) ?>
</div>
<div class = "row">
	<div class = "col-lg-7 d-flex flex-column">
		<div class = "card shadow-none border bg-light-subtle flex-fill">
			<div class = "card-body">
				<div class = "d-flex justify-content-between">
					<div class = "d-flex align-items-center header-info gap-1 mb-3">
						<i class = "ti ti-user-circle text-dark"></i>
						<strong>
							<h4 class = "fw-semibold m-0">Personal Info</h4>
						</strong>
					</div>


				</div>
				<div class = "row">
					<div class = "col-lg-6">
						<p class = "mb-2"><strong>Name:</strong> <?= $model->Name ?></p>
						<p class = "mb-2"><strong>Gender:</strong> <?= getGenderMeaning($model->Gender) ?></p>
						<p class = "mb-2"><strong>Date of Birth:</strong> <?= $model->Date_of_Birth ?></p>
						<p class = "mb-2"><strong>Citizenship:</strong> <?= $model->Citizenship ?></p>
					</div>
					<div class = "col-lg-6">
						<p class = "mb-2"><strong>Country of Origin:</strong> <?= $model->Country_of_origin ?></p>
						<p class = "mb-2"><strong>Email Address:</strong> <?= $model->Email_address ?></p>
						<p class = "mb-2"><strong>Passport Number:</strong> <?= $model->Passport_Number ?></p>
						<p class = "mb-2"><strong>Expiration Date:</strong> <?= $model->Passport_Expiration ?></p>
					</div>
				</div>


			</div>
		</div>
	</div>
	<div class = "col-lg-5 d-flex flex-column">
		<div class = "card shadow-none border bg-light-danger flex-fill ">
			<div class = "card-body">
				<div class = "d-flex justify-content-between">
					<div class = "d-flex align-items-center header-info gap-1 mb-3">
						<i class = "ti ti-school text-dark"></i>
						<strong>
							<h4 class = "fw-semibold m-0">Applicant Academic Background</h4>
						</strong>
					</div>
				</div>
				<div class = "row">
					<div class = "col">
						<div>
							<p class = "mb-2"><strong>Reference Number:</strong> <?= $model->reference_number ?></p>
							<p class = "mb-2"><strong>Programme:</strong> <?= $model->Propose_type_of_programme ?></p>
							<p class = "mb-2"><strong>Kulliyyah:</strong> <?= $model->Propose_kulliyyah_applied ?></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<?php $form = ActiveForm::begin([
    'action' => ['approve', 'ID' => $model->ID, 'token' => $model->Token], 'options' => ['class' => 'form-inline']
]) ?>


<h5 class = "fw-semibold">Upload Offer Letter</h5>
<?= $form->field($model, 'offer_letter')->fileInput([
    'class' => 'form-control mb-2', 'required' => true
])->label(false) ?>


<div class = "form-group">
    <?= Html::submitButton('Submit', ['class' => 'button submit-btn submity', 'name' => 'saveWithoutValidation']) ?>
</div>

<?php ActiveForm::end(); ?>









