<?php

use common\models\Kcdio;
use common\models\Outbound;
use common\models\Status;
use yii\bootstrap5\ActiveForm;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\helpers\Json;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/** @var yii\web\View $this */
/** @var yii\data\ActiveDataProvider $dataProvider */
/** @var common\models\Outbound $model */

require Yii::getAlias('@common') . '/Helpers/helper.php';
if (!isset($noRecord)) {
	$creationYearLastTwoDigits = date('y', strtotime($model->created_at));

	$fileName = $creationYearLastTwoDigits . '_' . $model->ID;
}

?>

<?php if (isset($noRecord) && $noRecord === true) : ?>
	<div class="alert alert-warning d-flex justify-content-center align-items-center gap-1">
		<h4 class="fw-semibold">Hello <?= Yii::$app->user->identity->username?></h4>
		<p class="text-capitalize alert m-0 p-0">No records found yet</p>
		<p class="text-capitalize alert m-0 p-0">
			<strong><?php echo Html::a('Create One', ['create'], ['class' => ' m-0 p-0 alert']); ?></strong>
		</p>
	</div>
<?php else : ?>


	<div class="mb-3 d-flex flex-row justify-content-between align-items-center">
		<div>
			<h1 class="text-capitalize text-start m-0"><?= $model->Name ?></h1>
			<div class="d-flex gap-1 align-items-center">
				<?php if ($model->Status !== null) : ?>
					<?php
					$statusModel = Status::findOne(['ID' => $model->Status]);
					$iconClass = getStatusIconClass($model->Status); // Implement your own logic to get the icon class based on status
					$statusClass = getStatusClass($model->Status);
					echo Html::tag('span', '', [
						'class' => '' . $iconClass,
					]);
					echo Html::tag(
						'p',
						($statusModel = Status::findOne(['ID' => $model->Status])) ? $statusModel->status : '',
						[
							'class' => ' fw-semibold m-0 ' . $statusClass, 'id' => 'status-badge',
						]
					);
					?>
				<?php endif; ?>
			</div>
		</div>
		<div>
			<?php if ($model->Status === null || $model->Status === 3) : ?>
				<?= Html::a(
					'<i class="ti ti-refresh"></i> Update your Info',
					['update', 'ID' => $model->ID],
					[
						'class' => 'btn btn-danger mb-0',
						'title' => 'Update your Info', // Tooltip for the link
					]
				); ?>

			<?php endif; ?>
			<?php if ($model->Status === 41 || $model->Status === 71) : ?>
				<div class="mt-3 px-4 d-flex flex-row gap-2">
					<a class="update-button btn btn-outline-dark d-flex align-items-center px-3" id="upload" data-toggle="modal" title="View" data-target="#form-upload">
						<i class="ti ti-upload me-0 me-md-1 fs-4"></i>
						<span class="d-none d-md-block font-weight-medium fs-3">Upload Required Files</span>
					</a>

				</div>
			<?php endif; ?>
		</div>

	</div>

	<div class="row">
		<div class="col-lg-8">
			<div class="card shadow-none border bg-light-subtle">
				<div class="card-body">
					<div class="d-flex align-items-center header-info gap-1 mb-3">
						<i class="ti ti-user-circle text-dark"></i>
						<strong>
							<h4 class="fw-semibold m-0">Personal Info</h4>
						</strong>
					</div>
					<div class="row">
						<div class="col-md-6">
							<p class="mb-2 fw-light mb-1"><strong>Name: </strong> <?= $model->Name ?></p>
							<p class="mb-2 fw-light mb-1"><strong>Matric
									Number: </strong> <?= $model->Matric_Number ?>
							</p>
							<p class="mb-2 fw-light mb-1">
								<strong>Citizenship: </strong> <?= $model->Citizenship ?>
							</p>
							<p class="mb-2 fw-light mb-1">
								<strong>Gender: </strong> <?= getGenderMeaning($model->Gender) ?>
							</p>
							<p class="mb-2 fw-light mb-1"><strong>Postcode: </strong> <?= $model->Postcode ?></p>
							<p class="mb-2 fw-light mb-1"><strong>State: </strong> <?= $model->State ?></p>
							<p class="mb-2 fw-light mb-1"><strong>Country: </strong> <?= $model->Country ?></p>
						</div>
						<div class="col-md-6">
							<p class="mb-2 fw-light mb-1"><strong>Date of
									Birth: </strong> <?= $model->Date_of_Birth ?>
							</p>
							<p class="mb-2 fw-light mb-1"><strong>Passport
									Number: </strong> <?= $model->Passport_Number ?>
							</p>
							<p class="mb-2 fw-light mb-1"><strong>Passport
									Expiration: </strong> <?= $model->Passport_Expiration ?>
							</p>
							<p class="mb-2 fw-light mb-1"><strong>Mobile
									Number:</strong> <?= $model->Mobile_Number ?>
							</p>
							<p class="mb-2 fw-light mb-1"><strong>Mailing
									Address: </strong> <?= $model->Mailing_Address ?>
							</p>
							<p class="mb-2 fw-light mb-1"><strong>Mailing
									state: </strong> <?= $model->Mailing_State ?>
							</p>
							<p class="mb-2 fw-light mb-1"><strong>Mailing
									Country: </strong> <?= $model->Mailing_Country ?>
							</p>
						</div>
					</div>
					<ul class="list-unstyled mt-2">
						<li class="d-flex align-items-center gap-3 mb-2">
							<i class="ti ti-mail text-dark fs-6"></i>
							<h6 class="fs-4 fw-semibold mb-0">Email Address: <a href="mailto:<?= $model->Email ?>"><?= $model->Email ?></a></h6>
						</li>
						<li class="d-flex align-items-center gap-3 mb-2">
							<i class="ti ti-map-pin text-dark fs-6"></i>
							<h6 class="fs-4 fw-semibold mb-0">Permanent Address:</h6>
							<p class="fs-4 mb-0"><?= $model->Permanent_Address ?></p>
						</li>
					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6 d-flex flex-column">
					<div class="card shadow-none border flex-fill bg-light-autom">
						<div class="card-body">
							<div class="d-flex align-items-center header-info gap-1 mb-3">
								<i class="ti ti-school text-dark"></i>
								<strong>
									<h4 class="fw-semibold m-0">Academic Background</h4>
								</strong>
							</div>
							<p class="mb-2 fw-light mb-1"><strong>Level Of
									Education: </strong> <?= $model->Academic_lvl_edu ?>
							</p>
							<p class="mb-2 fw-light mb-1">
								<strong>Kulliyyah: </strong> <?= $model->Academic_kulliyyah ?>
							</p>
							<p class="mb-2 fw-light mb-1"><strong>Other
									Kulliyyah: </strong> <?= $model->Academic_kulliyyah_others ?>
							</p>
							<p class="mb-2 fw-light mb-1"><strong>Current
									Semester: </strong> <?= $model->Academic_current_semester ?>
							</p>
							<p class="mb-2 fw-light mb-1">
								<strong>Programme: </strong> <?= $model->Academic_name_of_programme ?>
							</p>
							<p class="mb-2 fw-light mb-1"><strong>CGPA: </strong> <?= $model->Academic_cgpa ?></p>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="card shadow-none border bg-light-pink">
						<div class="card-body">
							<div class="d-flex align-items-center header-info gap-1 mb-3">
								<i class="ti ti-map-pins text-dark"></i>
								<strong>
									<h4 class="fw-semibold m-0">Mobility Program Info</h4>
								</strong>
							</div>
							<p class="mb-2 fw-light mb-1"><strong>Mobility
									Type: </strong> <?= $model->Type_mobility ?></p>
							<p class="mb-2 fw-light mb-1"><strong>Programme
									Type: </strong> <?= $model->Type_mobility_program ?>
							</p>
							<p class="mb-2 fw-light mb-1"><strong>Programme Type
									(Other): </strong> <?= $model->Type_mobility_program_other ?>
							</p>
							<p class="mb-2 fw-light mb-1"><strong>Host University
									Name: </strong> <?= $model->Host_university_name ?>
							</p>
							<p class="mb-2 fw-light mb-1"><strong>Duration:</strong></p>
							<div class="d-flex gap-3 ">
								<p class="mb-2 fw-light mb-1"><strong>From: </strong> <?= $model->Mobility_from ?>
								</p>
								<p class="mb-2 fw-light mb-1">
									<strong>Until: </strong> <?= $model->Mobility_until ?>
								</p>
							</div>
							<p class="mb-2 fw-light mb-1"><strong>Host University
									Country: </strong> <?= $model->Country_host_university ?>
							</p>
							<p class="mb-2 fw-light mb-1"><strong>Avability for Credit
									Transfer: </strong> <?= $model->credit_transfer_availability ?>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="card shadow-none border">
						<div class="card-body">
							<div class="row">
								<div class="d-flex align-items-center header-info gap-1 mb-3">
									<i class="ti ti-user-check text-dark"></i>
									<strong>
										<h4 class="fw-semibold m-0">Host Person Info</h4>
									</strong>
								</div>
								<div class="col-lg-6">
									<p class="mb-2 fw-light mb-1">
										<strong>Name: </strong> <?= $model->Connect_host_name ?>
									</p>
									<p class="mb-2 fw-light mb-1">
										<strong>Position: </strong> <?= $model->Connect_host_position ?>
									</p>
									<p class="mb-2 fw-light mb-1"><strong>Mobile
											Number: </strong> <?= $model->Connect_host_mobile_number ?>
									</p>
									<p class="mb-2 fw-light mb-1"><strong>Email
											Address: </strong> <?= $model->Connect_host_email ?>
									</p>
								</div>
								<div class="col-lg-6">
									<p class="mb-2 fw-light mb-1"><strong>Post
											Code:</strong> <?= $model->Connect_host_postcode ?>
									</p>
									<p class="mb-2 fw-light mb-1">
										<strong>Country:</strong> <?= $model->Connect_host_country ?>
									</p>
									<p class="mb-2 fw-light mb-1">
										<strong>Address:</strong> <?= $model->Connect_host_address ?>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-4">
			<div class="card shadow-none border bg-light-secondary">
				<div class="card-body">
					<div class="d-flex align-items-center header-info gap-1 mb-3">
						<i class="ti ti-report-medical text-dark"></i>
						<strong>
							<h4 class="fw-semibold m-0">Emergency Information</h4>
						</strong>
					</div>
					<p class="mb-2 fw-light mb-1"><strong>Name: </strong> <?= $model->Emergency_name ?></p>
					<p class="mb-2 fw-light mb-1">
						<strong>RelationShip: </strong> <?= $model->Emergency_relationship ?>
					</p>
					<p class="mb-2 fw-light mb-1"><strong>Phone
							Number: </strong> <?= $model->Emergency_phoneNumber ?>
					</p>
					<p class="mb-2 fw-light mb-1"><strong>Post Code: </strong> <?= $model->Emergency_postCode ?>
					</p>
					<p class="mb-2 fw-light mb-1"><strong>State: </strong> <?= $model->Emergency_tate ?></p>
					<p class="mb-2 fw-light mb-1"><strong>Country:</strong> <?= $model->Emergency_country ?></p>
					<p class="mb-2 fw-light mb-1"><strong>Home
							Address: </strong> <?= $model->Emergency_homeAddress ?>
					</p>
				</div>
			</div>
			<div class="card shadow-none border bg-light-warning">
				<div class="card-body">
					<div class="d-flex align-items-center header-info gap-1 mb-3">
						<i class="ti ti-report-money text-dark"></i>
						<strong>
							<h4 class="fw-semibold m-0">Financial Information</h4>
						</strong>
					</div>
					<!--		<p class = "mb-2 fw-light mb-1"><strong>Funded:</strong> -->
					<?php //= $model->academic_accept 
					?><!--</p>-->
					<p class="mb-2 fw-light mb-1"><strong>Name of Sponsoring
							Body:</strong> <?= $model->Sponsoring_name ?>
					</p>
					<p class="mb-2 fw-light mb-1"><strong>Other
							(sponser):</strong> <?= $model->Sponsoring_name_other ?>
					</p>
					<p class="mb-2 fw-light mb-1"><strong>Funding:</strong> <?= $model->Sponsoring_funding ?></p>
				</div>
			</div>
			<div class="card shadow-none border bg-light-danger">
				<div class="card-body">
					<div class="d-flex align-items-center header-info gap-1 mb-3">
						<i class="ti ti-language text-dark"></i>
						<strong>
							<h4 class="fw-semibold m-0">English Proficiency</h4>
						</strong>
					</div>
					<p class="mb-2 fw-light mb-1"><strong>English
							Proficiency: </strong> <?= $model->English_language_proficiency ?>
					</p>
					<p class="mb-2 fw-light mb-1"><strong>Result: </strong> <?= $model->English_result ?></p>
					<p class="mb-2 fw-light mb-1"><strong>Third Language: </strong> <?= $model->Third_language ?>
					</p>
				</div>
			</div>

			<div class="card shadow-none border bg-light-info">
				<div class="card-body">
					<div class="d-flex align-items-center header-info gap-1 mb-3">
						<i class="ti ti-file text-dark"></i>
						<strong>
							<h4 class="fw-semibold m-0">Files</h4>
						</strong>
					</div>
					<p class="fw-semibold"><?= ($model->Offer_letter) ? Html::a('Offer Letter', [
												'download', 'id' => $model->ID, 'file' => $fileName . '_offerLetter' . '.pdf'
											]) : ''; ?></p>
					<p class="fw-semibold"><?= ($model->Academic_transcript) ? Html::a('Academic Transcript', [
												'download', 'id' => $model->ID, 'file' => $fileName . '_AcademicTranscript' . '.pdf'
											]) : ''; ?></p>
					<p class="fw-semibold"><?= ($model->Program_brochure) ? Html::a('Program Brochure', [
												'download', 'id' => $model->ID, 'file' => $fileName . '_ProgramBrochure' . '.pdf'
											]) : ''; ?></p>
					<p class="fw-semibold"><?= ($model->Latest_pay_slip) ? Html::a('Latest Pay Slip', [
												'download', 'id' => $model->ID, 'file' => $fileName . '_LatestPaySlip' . '.pdf'
											]) : ''; ?></p>
					<p class="fw-semibold"><?= ($model->Other_latest_pay_slip) ? Html::a('Other Latest Pay Slip', [
												'download', 'id' => $model->ID, 'file' => $fileName . '_OtherLatestPaySlip' . '.pdf'
											]) : ''; ?></p>

					<?php if ($model->Status >= 41) : ?>
						<p class="fw-semibold"><?= ($model->Proof_of_sponsorship) ? Html::a('Proof of sponsorship', [
													'download', 'id' => $model->ID, 'file' => $fileName . '_ProofOfSponsorship' . '.pdf']) : ''; ?></p>
						<p class="fw-semibold"><?= ($model->Proof_insurance_cover) ? Html::a('Other Latest Pay Slip',[
													'download', 'id' => $model->ID, 'file' => $fileName . '_ProofInsuranceCover' . '.pdf']) : ''; ?></p>
						<p class="fw-semibold"><?= ($model->Letter_of_indemnity) ? Html::a('Letter of Indemnity', [
													'download', 'id' => $model->ID, 'file' => $fileName . '_LetterOfIndemnity' . '.pdf']) : ''; ?></p>
						<p class="fw-semibold"><?= ($model->Flight_ticket) ? Html::a('Flight Ticket', [
													'download', 'id' => $model->ID, 'file' => $fileName . '_FlightTicket' . '.pdf']) : ''; ?></p>
					<?php endif; ?>
				</div>
			</div>
		</div>
	</div>
	<div class="card shadow-none border ">
		<div class="card-body">
			<div class="d-flex align-items-center header-info gap-1 mb-3">
				<i class="ti ti-books text-dark"></i>
				<?php if ($model->Academic_lvl_edu !== 'PG') : ?>
					<strong>
						<h4 class="fw-semibold m-0">Course Information</h4>
					</strong>
				<?php else : ?>
					<strong>
						<h4 class="fw-semibold m-0">Research Information</h4>
					</strong>
				<?php endif; ?>
			</div>
			<?php if ($model->Academic_lvl_edu !== 'PG') : ?>
				<div class="row">
					<div class="col-md-6 border-end">
						<h4 class="font-monospace text-center mb-4">Courses offered by the Host University</h4>
						<table class="table table-hover table-light">
							<!-- Table headers -->
							<thead>
								<tr>
									<th style="width: 30%" class="text-center font-monospace">Course Code</th>
									<th style="width: 40%" class="text-center font-monospace">Course Name</th>
									<th style="width: 30%" class="text-center font-monospace">Credit Hours</th>
								</tr>
							</thead>
							<tbody>
								<?php foreach ($courses as $course) : ?>
									<tr>
										<td class="text-center py-2 px-1"><?= $course->course_code ?></td>
										<td class="text-center py-2 px-1"><?= $course->course_name ?></td>
										<td class="text-center py-2 px-1"><?= $course->credit_hours ?></td>
									</tr>
								<?php endforeach; ?>
							</tbody>
						</table>
					</div>
					<div class="col-md-6">
						<h4 class="font-monospace text-center mb-4">IIUM Courses</h4>
						<table class="table table-hover table-light">
							<!-- Table headers -->
							<thead>
								<tr>
									<th style="width: 30%" class="text-center font-monospace">Course Code</th>
									<th style="width: 40%" class="text-center font-monospace">Course Name</th>
									<th style="width: 30%" class="text-center font-monospace">Credit Hours</th>
								</tr>
							</thead>
							<tbody>
								<?php foreach ($iiumcourses as $iiumcourse) : ?>
									<tr>
										<td class="text-center py-2 px-1"><?= $iiumcourse->course_code ?></td>
										<td class="text-center py-2 px-1"><?= $iiumcourse->course_name ?></td>
										<td class="text-center py-2 px-1"><?= $iiumcourse->credit_hours ?></td>
									</tr>
								<?php endforeach; ?>
							</tbody>
						</table>
					</div>
				</div>
				<div>
				</div>
			<?php else : ?>
				<div>
					<p class="mb-2 fw-light mb-1 text-dark"><strong>Academic
							Research:</strong> <?= $model->Research ?></p>
				</div>
			<?php endif; ?>
		</div>
	</div>

	<div class="modal fade" id="form-upload" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content border-0">
				<div class="modal-header bg-dark">
					<h6 id="form-upload-header" class="text-white mb-0"></h6>

					<button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="form-box">
						<div class="form-content">
							<?php if($model->Status === 41):?>
                                <?php $form = ActiveForm::begin([
                                    'options' => ['enctype' => 'multipart/form-data'],
                                    'action' => ['outbound/upload', 'ID' => $model->ID], // Pass the ID to the action
                                ]); ?>
                                <?= Html::hiddenInput('ID', $model->ID) ?>
								<div class="row d-flex align-items-center justify-content-center">
									<div class="col-md-6">
										<div class="mb-3">
											<label for="formFile" class="form-label">Proof of sponsorship/ Funding/ Grant(Official Letter)</label>
										</div>
									</div>
									<div class="col-md-6">
										<div class="mb-3">
                                            <?= $form->field($model, 'Proof_of_sponsorship')->fileInput([
                                                'class' => 'form-control', 'id' => 'Proof_of_sponsorship'
                                            ])->label(false) ?>
										</div>
									</div>
								</div>
								<div class="row d-flex align-items-center justify-content-center">
									<div class="col-md-6">
										<div class="mb-3">
											<label for="formFile" class="form-label">Proof of purchased insurance coverage</label>
										</div>
									</div>
									<div class="col-md-6">
										<div class="mb-3">
                                            <?= $form->field($model, 'Proof_insurance_cover')->fileInput([
                                                'class' => 'form-control', 'id' => 'Proof_insurance_cover'
                                            ])->label(false) ?>
										</div>
									</div>
								</div>
								<div class="row d-flex align-items-center justify-content-center">
									<div class="col-md-6">
										<div class="mb-3">
											<label for="formFile" class="form-label">Letter of indemnity (Download the tamplate from International Office website)</label>
										</div>
									</div>
									<div class="col-md-6">
										<div class="mb-3">
                                            <?= $form->field($model, 'Letter_of_indemnity')->fileInput([
                                                'class' => 'form-control', 'id' => 'Letter_of_indemnity'
                                            ])->label(false) ?>
										</div>
									</div>
								</div>
								<div class="row d-flex align-items-center justify-content-center">
									<div class="col-md-6">
										<div class="mb-3">
											<label for="formFile" class="form-label">Copy of flight ticket</label>
										</div>
									</div>
									<div class="col-md-6">
										<div class="mb-3">
                                            <?= $form->field($model, 'Flight_ticket')->fileInput([
                                                'class' => 'form-control', 'id' => 'Flight_ticket',
                                            ])->label(false) ?>
										</div>
									</div>
								</div>

								<div class="form-group mt-2">
									<div class="form-group">
                                        <?= Html::submitButton('', ['class' => 'btn btn-outline-dark px-4 py-2', 'name' => 'save-button', 'id' => 'form-upload-button']) ?>
									</div>
								</div>
                                <?php ActiveForm::end(); ?>

							<?php elseif ($model->Status === 71):?>
                                <?php $form = ActiveForm::begin([
                                    'options' => ['enctype' => 'multipart/form-data'],
                                    'action' => ['outbound/upload', 'ID' => $model->ID], // Pass the ID to the action
                                ]); ?>
                                <?= Html::hiddenInput('ID', $model->ID) ?>


                                <?= $form->field($model, 'driveLink')->textInput(['maxlength' => true]) ?>
								<div class="form-group mt-2">
									<div class="form-group">
                                        <?= Html::submitButton('', ['class' => 'btn btn-outline-dark px-4 py-2', 'name' => 'save-button', 'id' => 'form-upload-button']) ?>
									</div>
								</div>
                                <?php ActiveForm::end(); ?>

							<?php endif;?>

						</div>
					</div>
				</div>


			<?php endif; ?>