<?php

use common\models\Countries;
use common\models\Poc;
use common\models\Status;
use Psy\Util\Json;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\web\YiiAsset;

/** @var yii\web\View $this */
/** @var common\models\Outbound $model */
/** @var common\models\Poc $modelPoc1 */

$creationYearLastTwoDigits = date('y', strtotime($model->created_at));

$fileName = $creationYearLastTwoDigits . '_' . $model->ID;

?>

<div class = "mb-3">
	<h1 class = "text-capitalize text-start m-0"><?= $model->Name ?></h1>
	<div class = "d-flex gap-1 align-items-center">
        <?php
        $statusModel = Status::findOne(['ID' => $model->Status]);
        $iconClass = getStatusIconClass($model->Status); // Implement your own logic to get the icon class based on status
        $statusClass = getStatusClass($model->Status);
        echo Html::tag('span', '', [
            'class' => ''.$iconClass,
        ]);
        echo Html::tag('p',($statusModel = Status::findOne(['ID' => $model->Status])) ? $statusModel->status : '', [
            'class' => ' fw-semibold m-0 '.$statusClass, 'id' => 'status-badge',
        ]);
        ?>
	</div>
</div>
<div class = "row">
	<div class = "col-lg-8">
		<div class = "card shadow-none border bg-light-subtle">
			<div class = "card-body">
				<div class = "d-flex align-items-center header-info gap-1 mb-3">
					<i class = "ti ti-user-circle text-dark"></i>
					<strong>
						<h4 class = "fw-semibold m-0">Personal Info</h4>
					</strong>
				</div>
				<div class = "row">
					<div class = "col-md-6">
						<p class = "mb-2 fw-light mb-1"><strong>Name: </strong> <?= $model->Name ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Matric Number: </strong> <?= $model->Matric_Number ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Citizenship: </strong> <?= $model->Citizenship ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Gender: </strong> <?= getGenderMeaning($model->Gender) ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Postcode: </strong> <?= $model->Postcode ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>State: </strong> <?= getState($model->State); ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Country: </strong> <?= getCountry($model->Country); ?></p>
					</div>
					<div class = "col-md-6">
						<p class = "mb-2 fw-light mb-1"><strong>Date of Birth: </strong> <?= $model->Date_of_Birth ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Passport Number: </strong> <?= $model->Passport_Number ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Passport Expiration: </strong> <?= $model->Passport_Expiration ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Mobile Number:</strong> <?= $model->Mobile_Number ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Mailing Address: </strong> <?= $model->Mailing_Address ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Mailing state: </strong> <?= getState($model->Mailing_State); ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Mailing Country: </strong> <?= getCountry($model->Mailing_Country); ?></p>
					</div>
				</div>
				<ul class = "list-unstyled mt-2">
					<li class = "d-flex align-items-center gap-3 mb-2">
						<i class = "ti ti-mail text-dark fs-6"></i>
						<h6 class = "fs-4 fw-semibold mb-0">Email Address: <a href = "mailto:<?= $model->Email ?>"><?= $model->Email ?></a></h6>
					</li>
					<li class = "d-flex align-items-center gap-3 mb-2">
						<i class = "ti ti-map-pin text-dark fs-6"></i>
						<h6 class = "fs-4 fw-semibold mb-0">Permanent Address:</h6>
						<p class="fs-4 mb-0"><?= $model->Permanent_Address ?></p>
					</li>
					<?php if ($model->Status >= 71):?>
					<li class = "d-flex align-items-center gap-3 mb-2">
						<i class = "ti ti-brand-google-drive text-dark fs-6"></i>
						<h6 class = "fs-4 fw-semibold mb-0">Drive Link:</h6>
					<a href = "<?= $model->driveLink?>" target="_blank" class="text-decoration-underline">click to open applicant google drive</a>
					</li>
					<?php endif ;?>
				</ul>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-6 d-flex flex-column">
				<div class = "card shadow-none border flex-fill bg-light-autom">
					<div class = "card-body">
						<div class = "d-flex align-items-center header-info gap-1 mb-3">
							<i class = "ti ti-school text-dark"></i>
							<strong>
								<h4 class = "fw-semibold m-0">Academic Background</h4>
							</strong>
						</div>
						<p class = "mb-2 fw-light mb-1"><strong>Level Of Education: </strong> <?= $model->Academic_lvl_edu ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Kulliyyah: </strong> <?= $model->Academic_kulliyyah ?></p>
                        <?php if ($model->Academic_kulliyyah_others !== "" && $model->Academic_kulliyyah_others !== null): ?>
							<p class="mb-2 fw-light mb-1">
								<strong>Other Kulliyyah:</strong> <?= $model->Academic_kulliyyah_others ?>
							</p>
                        <?php endif; ?>


						<p class = "mb-2 fw-light mb-1"><strong>Current Semester: </strong> <?= $model->Academic_current_semester ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Programme: </strong> <?= $model->Academic_name_of_programme ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>CGPA: </strong> <?= $model->Academic_cgpa ?></p>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class = "card shadow-none border bg-light-pink">
					<div class = "card-body">
						<div class = "d-flex align-items-center header-info gap-1 mb-3">
							<i class = "ti ti-map-pins text-dark"></i>
							<strong>
								<h4 class = "fw-semibold m-0">Mobility Program Info</h4>
							</strong>
						</div>
						<p class = "mb-2 fw-light mb-1"><strong>Mobility Type: </strong> <?= getMobilityType($model->Type_mobility) ?></p>

						<p class = "mb-2 fw-light mb-1"><strong>Host University Name: </strong> <?= $model->Host_university_name ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Host University Country: </strong><?= getCountry($model->Connect_host_country); ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Avability for Credit Transfer: </strong> <?= getAnswer($model->credit_transfer_availability )?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Programme Type: </strong> <?= $model->Type_mobility_program ?></p>
                        <?php if ($model->Type_mobility_program_other !== "" && $model->Type_mobility_program_other !== null): ?>
							<p class = "mb-2 fw-light mb-1"><strong>Programme Type
							                                        (Other): </strong> <?= $model->Type_mobility_program_other ?>
							</p>
                        <?php endif;?>
						<p class = "mb-2  fw-semibold mb-1 text-decoration-underline">Duration</p>
						<div class = "d-flex justify-content-evenly ">
							<p class = "mb-2 fw-light mb-1"><strong>From: </strong> <?= $model->Mobility_from ?></p>
							<p class = "mb-2 fw-light mb-1"><strong>Until: </strong> <?= $model->Mobility_until ?></p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<div class="card shadow-none border">
					<div class="card-body">
						<div class="row">
							<div class = "d-flex align-items-center header-info gap-1 mb-3">
								<i class = "ti ti-user-check text-dark"></i>
								<strong>
									<h4 class = "fw-semibold m-0">Host Person Info</h4>
								</strong>
							</div>
							<div class="col-lg-6">
								<p class = "mb-2 fw-light mb-1"><strong>Name: </strong> <?= $model->Connect_host_name ?></p>
								<p class = "mb-2 fw-light mb-1"><strong>Position: </strong> <?= $model->Connect_host_position ?></p>
								<p class = "mb-2 fw-light mb-1"><strong>Mobile Number: </strong> <?= $model->Connect_host_mobile_number ?></p>
								<p class = "mb-2 fw-light mb-1"><strong>Email Address: </strong> <?= $model->Connect_host_email ?></p>
							</div>
							<div class="col-lg-6">
								<p class = "mb-2 fw-light mb-1"><strong>Post Code:</strong> <?= $model->Connect_host_postcode ?></p>
								<p class = "mb-2 fw-light mb-1"><strong>Country:</strong> <?= getCountry($model->Connect_host_country); ?></p>
								<p class = "mb-2 fw-light mb-1"><strong>Address:</strong> <?= $model->Connect_host_address ?></p>
								<p class = "mb-2 fw-light mb-1"><strong>Host Scholarship:</strong> <?= getAnswer($model->host_scholarship); ?></p>
								<?php if($model->host_scholarship === 1):?>
								<p class = "mb-2 fw-light mb-1"><strong>Amount:</strong> <?= $model->host_scholarship_amount ?></p>
								<?php endif;?>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<div class="card shadow-none border bg-light-gray">
					<div class="card-body">
						<div class="row">
							<div class = "d-flex align-items-center header-info gap-1 mb-3">
								<i class = "ti ti-file text-dark"></i>
								<strong>
									<h4 class = "fw-semibold m-0">Files</h4>
								</strong>
							</div>
							<div class = "col-md-6">
								<p class="fw-semibold"><?= ($model->Offer_letter) ? Html::a('Offer Letter', [
                                        'download', 'id' => $model->ID,
                                        'file' => $fileName.'_offerLetter'.'.pdf']) : ''; ?></p>
								<p class="fw-semibold"><?= ($model->Academic_transcript) ? Html::a('Academic Transcript', [
                                        'download', 'id' => $model->ID,
                                        'file' => $fileName.'_AcademicTranscript'.'.pdf']) : ''; ?></p>
								<p class="fw-semibold"><?= ($model->Program_brochure) ? Html::a('Program Brochure', [
                                        'download', 'id' => $model->ID,
                                        'file' => $fileName.'_ProgramBrochure'.'.pdf']) : ''; ?></p>
								<p class="fw-semibold"><?= ($model->Latest_pay_slip) ? Html::a('Latest Pay Slip', [
                                        'download', 'id' => $model->ID,
                                        'file' => $fileName.'_LatestPaySlip'.'.pdf']) : ''; ?></p>
								<p class="fw-semibold"><?= ($model->Other_latest_pay_slip) ? Html::a('Other Latest Pay Slip', [
                                        'download', 'id' => $model->ID,
                                        'file' => $fileName.'_OtherLatestPaySlip'.'.pdf']) : ''; ?></p>
							</div>
                            <?php if ($model->Status >= 41): ?>
								<div class = "col-md-6">
									<p class="fw-semibold"><?= ($model->Proof_of_sponsorship) ? Html::a('Proof of sponsorship', [
                                            'download', 'id' => $model->ID, 'file' => $fileName . '_ProofOfSponsorship' . '.pdf']) : ''; ?></p>
									<p class="fw-semibold"><?= ($model->Proof_insurance_cover) ? Html::a('Other Latest Pay Slip',[
                                            'download', 'id' => $model->ID, 'file' => $fileName . '_ProofInsuranceCover' . '.pdf']) : ''; ?></p>
									<p class="fw-semibold"><?= ($model->Letter_of_indemnity) ? Html::a('Letter of Indemnity', [
                                            'download', 'id' => $model->ID, 'file' => $fileName . '_LetterOfIndemnity' . '.pdf']) : ''; ?></p>
									<p class="fw-semibold"><?= ($model->Flight_ticket) ? Html::a('Flight Ticket', [
                                            'download', 'id' => $model->ID, 'file' => $fileName . '_FlightTicket' . '.pdf']) : ''; ?></p>
								</div>
                            <?php endif; ?>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class = "col-lg-4">
		<div class = "card shadow-none border bg-light-secondary">
			<div class = "card-body">
				<div class = "d-flex align-items-center header-info gap-1 mb-3">
					<i class = "ti ti-report-medical text-dark"></i>
					<strong>
						<h4 class = "fw-semibold m-0">Emergency Information</h4>
					</strong>
				</div>
				<p class = "mb-2 fw-light mb-1"><strong>Name: </strong> <?= $model->Emergency_name ?></p>
				<p class = "mb-2 fw-light mb-1"><strong>RelationShip: </strong> <?= $model->Emergency_relationship ?></p>
				<p class = "mb-2 fw-light mb-1"><strong>Phone Number: </strong> <?= $model->Emergency_phoneNumber ?></p>
				<p class = "mb-2 fw-light mb-1"><strong>Post Code: </strong> <?= $model->Emergency_postCode ?></p>
				<p class = "mb-2 fw-light mb-1"><strong>State: </strong> <?= getState($model->Emergency_tate); ?></p>
				<p class = "mb-2 fw-light mb-1"><strong>Country:</strong> <?= getCountry($model->Emergency_country); ?></p>
				<p class = "mb-2 fw-light mb-1"><strong>Home Address: </strong> <?= $model->Emergency_homeAddress ?></p>
			</div>
		</div>
		<div class = "card shadow-none border bg-light-warning">
			<div class = "card-body">
				<div class = "d-flex align-items-center header-info gap-1 mb-3">
					<i class = "ti ti-report-money text-dark"></i>
					<strong>
						<h4 class = "fw-semibold m-0">Financial Information</h4>
					</strong>
				</div>
				<!--		<p class = "mb-2 fw-light mb-1"><strong>Funded:</strong> -->
                <?php //= $model->academic_accept ?><!--</p>-->
				<p class = "mb-2 fw-light mb-1"><strong>Name of Sponsoring Body:</strong> <?= $model->Sponsoring_name ?>
				</p>
                <?php if ($model->Sponsoring_name_other !== "" && $model->Sponsoring_name_other !== null): ?>
				<p class = "mb-2 fw-light mb-1"><strong>Other (sponser):</strong> <?= $model->Sponsoring_name_other ?></p>
				<?php endif;?>
				<p class = "mb-2 fw-light mb-1"><strong>Funding:</strong> <?=getAnswer($model->Sponsoring_funding)?></p>

			</div>
		</div>
		<div class = "card shadow-none border bg-light-danger">
			<div class = "card-body">
				<div class = "d-flex align-items-center header-info gap-1 mb-3">
					<i class = "ti ti-language text-dark"></i>
					<strong>
						<h4 class = "fw-semibold m-0">English Proficiency</h4>
					</strong>
				</div>
				<p class = "mb-2 fw-light mb-1"><strong>English
				                                        Proficiency: </strong> <?= $model->English_language_proficiency ?>
				</p>
				<p class = "mb-2 fw-light mb-1"><strong>Result: </strong> <?= $model->English_result ?></p>
                <?php if ($model->Third_language !== "" && $model->Third_language !== null): ?>
				<p class = "mb-2 fw-light mb-1"><strong>Third Language: </strong> <?= $model->Third_language ?></p>
				<?php endif;?>
			</div>
		</div>
		<div class="card shadow-none border bg-light-primary">
			<div class="card-body">
				<div class = "mb-3">
					<h4 class = "fw-semibold m-0">Person in charge</h4>
				</div>
                <?php if ($modelPoc1): ?>
					<p class="mb-2 fw-light mb-1"><strong>name: </strong> <?= $modelPoc1->name ?></p>
					<p class="mb-2 fw-light mb-1"><strong>Email: </strong> <a href="mailto:<?= $modelPoc1->email ?>"><?= $modelPoc1->email ?></a></p>
                <?php else: ?>
					<p>Person in charge not set yet.</p>
                <?php endif; ?>
			</div>
		</div>
		<div class="card shadow-none border bg-light-info">
			<div class="card-body">
				<div class = "mb-3">
					<h4 class = "fw-semibold m-0">Dean</h4>
				</div>
                <?php if ($modelPoc2): ?>
					<p class="mb-2 fw-light mb-1"><strong>name: </strong> <?= $modelPoc2->name ?></p>
					<p class="mb-2 fw-light mb-1"><strong>kulliyyah: </strong> <?= $modelPoc2->kulliah ?></p>
					<p class="mb-2 fw-light mb-1"><strong>Email: </strong> <a href="mailto:<?= $modelPoc2->email ?>"><?= $modelPoc2->email ?></a></p>
                <?php else: ?>
					<p>Dean not set yet.</p>
                <?php endif; ?>
			</div>
		</div>
	</div>
</div>
<div class="card shadow-none border ">
	<div class="card-body">
		<div class = "d-flex align-items-center header-info gap-1 mb-3">
			<i class = "ti ti-books text-dark"></i>
            <?php if ($model->Academic_lvl_edu !== 'PG') : ?>
				<strong>
					<h4 class = "fw-semibold m-0">Course Information</h4>
				</strong>
            <?php else: ?>
				<strong>
					<h4 class = "fw-semibold m-0">Research Information</h4>
				</strong>
            <?php endif; ?>
		</div>
        <?php if ($model->Academic_lvl_edu !== 'PG') : ?>
			<div class = "row">
				<div class = "col-md-6 border-end">
					<h4 class = "font-monospace text-center mb-4">Courses offered by the Host University</h4>
					<table class = "table table-hover table-light">
						<!-- Table headers -->
						<thead>
						<tr>
							<th style = "width: 30%" class = "text-center font-monospace">Course Code</th>
							<th style = "width: 40%" class = "text-center font-monospace">Course Name</th>
							<th style = "width: 30%" class = "text-center font-monospace">Credit Hours</th>
						</tr>
						</thead>
						<tbody>
                        <?php foreach ($courses as $course) : ?>
							<tr>
								<td class = "text-center py-2 px-1"><?= $course->course_code ?></td>
								<td class = "text-center py-2 px-1"><?= $course->course_name ?></td>
								<td class = "text-center py-2 px-1"><?= $course->credit_hours ?></td>
							</tr>
                        <?php endforeach; ?>
						</tbody>
					</table>
				</div>
				<div class = "col-md-6">
					<h4 class = "font-monospace text-center mb-4">IIUM Courses</h4>
					<table class = "table table-hover table-light">
						<!-- Table headers -->
						<thead>
						<tr>
							<th style = "width: 30%" class = "text-center font-monospace">Course Code</th>
							<th style = "width: 40%" class = "text-center font-monospace">Course Name</th>
							<th style = "width: 30%" class = "text-center font-monospace">Credit Hours</th>
						</tr>
						</thead>
						<tbody>
                        <?php foreach ($iiumcourses as $iiumcourse) : ?>
							<tr>
								<td class = "text-center py-2 px-1"><?= $iiumcourse->course_code ?></td>
								<td class = "text-center py-2 px-1"><?= $iiumcourse->course_name ?></td>
								<td class = "text-center py-2 px-1"><?= $iiumcourse->credit_hours ?></td>
							</tr>
                        <?php endforeach; ?>
						</tbody>
					</table>
				</div>
			</div>
			<div>
			</div>
        <?php else: ?>
			<div>
				<p class = "mb-2 fw-light mb-1 text-dark"><strong>Academic Research:</strong> <?= $model->Research ?></p>
			</div>
        <?php endif; ?>
	</div>
</div>
<div class = "d-flex flex-row justify-content-center mt-5 gap-2 ">
    <?= Html::
    a('<button type="button" class="btn btn-outline-dark">
                                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
                                      <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
                                  </svg>back</button>', Yii::$app->request->referrer) ?>
    <?= Html::a('Action', ['action', 'ID' => $model->ID], ['class' => 'btn btn-secondary']) ?>
    <?php if (Yii::$app->user->can('superAdmin')): ?>
        <?= Html::a('Delete', ['delete', 'ID' => $model->ID], [
            'class' => 'btn btn-danger', 'data' => [
                'confirm' => 'Are you sure you want to delete this item?', 'method' => 'post',
            ],
        ]) ?>
        <?= Html::button('Update', [
            'class' => 'btn btn-primary',
            'onclick' => 'location.href='.Json::encode(Url::to(['update', 'ID' => $model->ID])),
        ]) ?>
    <?php endif; ?>
</div>
