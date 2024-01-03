<?php
use common\models\Poc;
use common\models\Status;
use Psy\Util\Json;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\web\YiiAsset;

/** @var yii\web\View $this */
/** @var common\models\Outbound $model */


require Yii::getAlias('@common').'/Helpers/helper.php';
$creationYearLastTwoDigits = date('y', strtotime($model->created_at));

$fileName = $creationYearLastTwoDigits . '_' . $model->ID;

?>
<div class = "mb-3">

	<div class = "d-flex gap-1 align-items-center">
        <?= Html::a('<i class="ti ti-arrow-left fs-8"></i>', Yii::$app->request->referrer) ?>
		<h1 class = "text-capitalize text-start m-0"><?= $model->Name ?></h1>
	</div>
	<div class = "d-flex gap-1 align-items-center">
        <?php
        $statusModel = Status::findOne(['ID' => $model->Status]);
        $iconClass = getStatusIconClass($model->Status); // Implement your own logic to get the icon class based on status
        $statusClass = getStatusClass($model->Status);
        echo Html::tag('span', '', [
            'class' => ''.$iconClass,
        ]);
        echo Html::tag('p',($statusModel = Status::findOne(['ID' => $model->Status])) ? $statusModel->status : '', [
            'class' => ' fw-semibold m-0  '.$statusClass, 'id' => 'status-badge text-capitalize',
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
						<p class = "mb-2 fw-light mb-1"><strong>State: </strong> <?= $model->State ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Country: </strong> <?= $model->Country ?></p>
					</div>
					<div class = "col-md-6">
						<p class = "mb-2 fw-light mb-1"><strong>Date of Birth: </strong> <?= $model->Date_of_Birth ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Passport Number: </strong> <?= $model->Passport_Number ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Passport Expiration: </strong> <?= $model->Passport_Expiration ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Mobile Number:</strong> <?= $model->Mobile_Number ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Mailing Address: </strong> <?= $model->Mailing_Address ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Mailing state: </strong> <?= $model->Mailing_State ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Mailing Country: </strong> <?= $model->Mailing_Country ?></p>
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
						<p class = "mb-2 fw-light mb-1"><strong>Other Kulliyyah: </strong> <?= $model->Academic_kulliyyah_others ?></p>
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
						<p class = "mb-2 fw-light mb-1"><strong>Mobility Type: </strong> <?= $model->Type_mobility ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Programme Type: </strong> <?= $model->Type_mobility_program ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Programme Type
						                                        (Other): </strong> <?= $model->Type_mobility_program_other ?>
						</p>
						<p class = "mb-2 fw-light mb-1"><strong>Host University Name: </strong> <?= $model->Host_university_name ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Duration:</strong></p>
						<div class = "d-flex gap-3 ">
							<p class = "mb-2 fw-light mb-1"><strong>From: </strong> <?= $model->Mobility_from ?></p>
							<p class = "mb-2 fw-light mb-1"><strong>Until: </strong> <?= $model->Mobility_until ?></p>
						</div>
						<p class = "mb-2 fw-light mb-1"><strong>Host University
						                                        Country: </strong> <?= $model->Country_host_university ?>
						</p>
						<p class = "mb-2 fw-light mb-1"><strong>Avability for Credit
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
								<p class = "mb-2 fw-light mb-1"><strong>Country:</strong> <?= $model->Connect_host_country ?></p>
								<p class = "mb-2 fw-light mb-1"><strong>Address:</strong> <?= $model->Connect_host_address ?></p>
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
                                        'download', 'ID' => $model->ID, 'token'=> $model->token, 'file' => $fileName.'_OfferLetter'.'.pdf']) : ''; ?></p>
								<p class="fw-semibold"><?= ($model->Academic_transcript) ? Html::a('Academic Transcript', [
                                        'download', 'ID' => $model->ID, 'token'=> $model->token,
                                        'file' => $fileName.'_AcademicTranscript'.'.pdf']) : ''; ?></p>
								<p class="fw-semibold"><?= ($model->Program_brochure) ? Html::a('Program Brochure', [
                                        'download', 'ID' => $model->ID, 'token'=> $model->token,
                                        'file' => $fileName.'_ProgramBrochure'.'.pdf']) : ''; ?></p>
								<p class="fw-semibold"><?= ($model->Latest_pay_slip) ? Html::a('Latest Pay Slip', [
                                        'download', 'ID' => $model->ID, 'token'=> $model->token,
                                        'file' => $fileName.'_LatestPaySlip'.'.pdf']) : ''; ?></p>
								<p class="fw-semibold"><?= ($model->Other_latest_pay_slip) ? Html::a('Other Latest Pay Slip', [
                                        'download', 'ID' => $model->ID, 'token'=> $model->token,
                                        'file' => $fileName.'_OtherLatestPaySlip'.'.pdf']) : ''; ?></p>
							</div>
                            <?php if ($model->Status >= 41): ?>
							<div class = "col-md-6">
								<P><strong>Proof of sponsorship/ funding/ grant (Official Letter)</strong>
                                    <?= ($model->Proof_of_sponsorship) ? Html::a('ProofOfSponsorship'.'_'.$model->ID.'.'.pathinfo($model->Proof_of_sponsorship,
                                            PATHINFO_EXTENSION), [
                                        'download', 'ID' => $model->ID, 'token'=> $model->token,
                                        'file' => 'ProofOfSponsorship'.'_'.$model->ID.'.'.pathinfo($model->Proof_of_sponsorship,
                                                PATHINFO_EXTENSION)
                                    ]) : ''; ?>
								</P>
								<P><strong>Other Latest Pay Slip: </strong>
                                    <?= ($model->Other_latest_pay_slip) ? Html::a('ProofInsuranceCover'.'_'.$model->ID.'.'.pathinfo($model->Other_latest_pay_slip,
                                            PATHINFO_EXTENSION), [
                                        'download', 'ID' => $model->ID, 'token'=> $model->token,
                                        'file' => 'ProofInsuranceCover'.'_'.$model->ID.'.'.pathinfo($model->Other_latest_pay_slip,
                                                PATHINFO_EXTENSION)
                                    ]) : ''; ?>
								</P>
								<P><strong>Other Latest Pay Slip: </strong>
                                    <?= ($model->Letter_of_indemnity) ? Html::a('LetterOfIndemnity'.'_'.$model->ID.'.'.pathinfo($model->Letter_of_indemnity,
                                            PATHINFO_EXTENSION), [
                                        'download', 'ID' => $model->ID, 'token'=> $model->token,
                                        'file' => 'LetterOfIndemnity'.'_'.$model->ID.'.'.pathinfo($model->Letter_of_indemnity,
                                                PATHINFO_EXTENSION)
                                    ]) : ''; ?>
								</P>
								<P><strong>Other Latest Pay Slip: </strong>
                                    <?= ($model->Flight_ticket) ? Html::a('FlightTicket'.'_'.$model->ID.'.'.pathinfo($model->Flight_ticket,
                                            PATHINFO_EXTENSION), [
                                        'download', 'id' => $model->ID, 'token'=> $model->token,
                                        'file' => 'FlightTicket'.'_'.$model->ID.'.'.pathinfo($model->Flight_ticket, PATHINFO_EXTENSION)
                                    ]) : ''; ?>
								</P>
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
				<p class = "mb-2 fw-light mb-1"><strong>State: </strong> <?= $model->Emergency_tate ?></p>
				<p class = "mb-2 fw-light mb-1"><strong>Country:</strong> <?= $model->Emergency_country ?></p>
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
				<p class = "mb-2 fw-light mb-1"><strong>Other (sponser):</strong> <?= $model->Sponsoring_name_other ?>
				</p>
				<p class = "mb-2 fw-light mb-1"><strong>Funding:</strong> <?= $model->Sponsoring_funding ?></p>
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
				<p class = "mb-2 fw-light mb-1"><strong>Third Language: </strong> <?= $model->Third_language ?></p>
			</div>
		</div>
	</div>
</div>
<div class = "d-flex flex-row justify-content-center mt-5 gap-2 ">



</div>
