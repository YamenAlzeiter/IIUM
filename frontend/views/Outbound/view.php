<?php

use common\models\Ststus;
use yii\helpers\Html;
use yii\widgets\DetailView;

/** @var yii\web\View $this */
/** @var common\models\Ob010 $model */

\yii\web\YiiAsset::register($this);

require Yii::getAlias('@common').'/Helpers/helper.php';
?>
<div class = "alert alert-warning my-4 py-2">
	<strong><h4 class = "alert text-capitalize m-0 p-0 font-monospace">Personal Info</h4></strong>
</div>
<div class = "row">
	<div class = "col-md-6">
		<p class = "mb-2 fw-light mb-1"><strong>Name: </strong> <?= $model->Name ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Matric Number: </strong> <?= $model->Matric_Number ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Citizenship: </strong> <?= $model->Citizenship ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Gender: </strong> <?= getGenderMeaning($model->Gender) ?></p>
	</div>
	<div class = "col-md-6">
		<p class = "mb-2 fw-light mb-1"><strong>Date of Birth: </strong> <?= $model->Date_of_Birth ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Passport Number: </strong> <?= $model->Passport_Number ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Passport Expiration: </strong> <?= $model->Passport_Expiration ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Mobile Number:</strong> <?= $model->Mobile_Number ?></p>
	</div>
</div>

<div class = "row">
	<div class = "col-md-6">
		<p class = "mb-2 fw-light mb-1"><strong>Email Address: </strong> <a
					href = "mailto:<?= $model->Email ?>"><?= $model->Email ?></a></p>

		<p class = "mb-2 fw-light mb-1"><strong>Permanent Address: </strong> <?= $model->Permanent_Address ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Postcode: </strong> <?= $model->Postcode ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>State: </strong> <?= $model->State ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Country: </strong> <?= $model->Country ?></p>
	</div>
	<div class = "col-md-6">
		<p class = "mb-2 fw-light mb-1"><strong>Mailing Address: </strong> <?= $model->Mailing_Address ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Mailing state: </strong> <?= $model->Mailing_State ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Mailing Country: </strong> <?= $model->Mailing_Country ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Relationship: </strong> <?= $model->Relationship ?></p>
		<p class = "mb-2 fw-light mb-1">
			<strong>Status: </strong>
            <?= Html::tag('span',
                ($statusModel = Ststus::findOne(['ID' => $model->Status])) ? $statusModel->Description : '', [
                    'class' => 'badge '.getStatusBadgeClass($model->Status).' px-3 py-2 rounded-3 fw-semibold',
                    'id' => 'status-badge',
                ]) ?>


	</div>
</div>


<div class = "alert alert-warning my-4 py-2">
	<strong><h4 class = "alert text-capitalize m-0 p-0 font-monospace">Emergency Info</h4></strong>
</div>

<div class = "row">
	<div class = "col-md-6">
		<p class = "mb-2 fw-light mb-1"><strong>Name: </strong> <?= $model->em_name ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>RelationShip: </strong> <?= $model->em_relationship ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Phone Number: </strong> <?= $model->em_phoneNumber ?></p>
	</div>
	<div class = "col-md-6">
		<p class = "mb-2 fw-light mb-1"><strong>Home Address: </strong> <?= $model->em_homeAddress ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Post Code: </strong> <?= $model->em_postCode ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>State: </strong> <?= $model->em_state ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Country:</strong> <?= $model->em_country ?></p>
	</div>
</div>

<div class = "alert alert-warning my-4 py-2">
	<strong><h4 class = "alert text-capitalize m-0 p-0 font-monospace">Academic Background</h4></strong>
</div>

<div class = "row">
	<div class = "col-md-6">
		<p class = "mb-2 fw-light mb-1"><strong>Level Of Education: </strong> <?= $model->lvl_edu ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Kulliyyah: </strong> <?= $model->kulliyyah ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Other Kulliyyah: </strong> <?= $model->others ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Current Semester: </strong> <?= $model->sem ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Programme: </strong> <?= $model->program ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>CGPA: </strong> <?= $model->cgpa ?></p>
	</div>
	<div class = "col-md-6">
		<p class = "mb-2 fw-light mb-1"><strong>English Proficiency: </strong> <?= $model->e_lang_pro ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Result: </strong> <?= $model->result ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Third Language: </strong> <?= $model->third_lang ?></p>
		<hr>
		<p class = "mb-2 fw-light mb-1"><strong>Funded:</strong> <?= getAnswer($model->academic_accept) ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Name of Sponsoring Body:</strong> <?= $model->sponsoring_name ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Other (sponser):</strong> <?= $model->sponsoring_name_other ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Funding:</strong> <?= $model->funding ?></p>

	</div>
</div>

<div class = "alert alert-warning my-4 py-2">
	<strong><h4 class = "alert text-capitalize m-0 p-0 font-monospace">Mobility Program Info</h4></strong>
</div>

<div class = "row">
	<div class = "col-md-6">
		<p class = "mb-2 fw-light mb-1"><strong>Mobility Type: </strong> <?= $model->type_mobility ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Programme Type: </strong> <?= $model->type_program ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Programme Type (Other): </strong> <?= $model->type_program_other ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Host University Name: </strong> <?= $model->host_uni_name ?></p>
		<div class = "d-flex gap-3 ">
			<p class = "mb-2 fw-light mb-1"><strong>Duration:</strong></p>
			<p class = "mb-2 fw-light mb-1"><strong>From: </strong> <?= $model->mobility_from ?></p>
			<p class = "mb-2 fw-light mb-1"><strong>Until: </strong> <?= $model->mobility_until ?></p>
		</div>

		<p class = "mb-2 fw-light mb-1"><strong>Host University Country: </strong> <?= $model->country_host_uni ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Avability for Credit
		                                        Transfer: </strong> <?= getAnswer($model->credit_transfer_avability) ?></p>
	</div>
	<div class = "col-md-6">
		<h5>Host Person Info</h5>
		<p class = "mb-2 fw-light mb-1"><strong>Name: </strong> <?= $model->connect_host_name ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Position: </strong> <?= $model->connect_host_position ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Mobile Number: </strong> <?= $model->connect_host_mobile_no ?></p>
		<!--		email address-->
		<p class = "mb-2 fw-light mb-1"><strong>Address:</strong> <?= $model->connect_host_address ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Post Code:</strong> <?= $model->connect_host_postcode ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Country:</strong> <?= $model->connect_host_country ?></p>

	</div>
</div>

<div class = "alert alert-warning my-4 py-2">
	<strong><h4 class = "alert text-capitalize m-0 p-0 font-monospace">Mobility Program Info</h4></strong>
</div>
<?php if (empty($model->Research)) : ?>
	<div class = "row">
		<div class = "col-md-6 border-end">
			<h4 class = "font-monospace text-center mb-4">Courses offered by the Host University</h4>
			<table class = "table  table-hover">
				<!-- Table headers -->
				<thead>
				<tr>
					<th style = "width: 30%" class = "text-center font-monospace">Course Code</th>
					<th style = "width: 50%" class = "text-center font-monospace">Course Name</th>
					<th style = "width: 20%" class = "text-center font-monospace">Credit Hours</th>
				</tr>
				</thead>
				<tbody>
                <?php foreach ($courses as $course) : ?>
					<tr>
						<td class = "text-center py-2 px-1"><?= $course->course_code ?></td>
						<td class = "py-2 px-1"><?= $course->course_name ?></td>
						<td class = "text-center py-2 px-1"><?= $course->credit_hours ?></td>
					</tr>
                <?php endforeach; ?>
				</tbody>
			</table>
		</div>

		<div class = "col-md-6">
			<h4 class = "font-monospace text-center mb-4">IIUM Courses</h4>
			<table class = "table table-hover">
				<!-- Table headers -->
				<thead>
				<tr>
					<th style = "width: 30%" class = "text-center font-monospace">Course Code</th>
					<th style = "width: 50%" class = "text-center font-monospace">Course Name</th>
					<th style = "width: 20%" class = "text-center font-monospace">Credit Hours</th>
				</tr>
				</thead>
				<tbody>
                <?php foreach ($iiumcourses as $iiumcourse) : ?>
					<tr>
						<td class = "text-center py-2 px-1"><?= $iiumcourse->course_code ?></td>
						<td class = "py-2 px-1"><?= $iiumcourse->course_name ?></td>
						<td class = "text-center py-2 px-1"><?= $iiumcourse->credit_hours ?></td>
					</tr>
                <?php endforeach; ?>
				</tbody>
			</table>
		</div>
	</div>
	<div>

	</div>
<?php endif; ?>
<?php if (!empty($model->Research)) : ?>
	<div>
		<p class="mb-2 fw-light mb-1"><strong>Academic Research:</strong> <?= $model->Research ?></p>
	</div>
<?php endif; ?>


<div class = "alert alert-warning my-4 py-2">
	<strong><h4 class = "alert text-capitalize m-0 p-0 font-monospace">Files</h4></strong>
</div>
<div class = "row">
	<div class = "col-md-6">
		<P><strong>Offer Letter: </strong>
            <?= ($model->offer_letter) ? Html::a('OfferLetter'.'_'.$model->Name.'_'.$model->ID.'.'.pathinfo($model->offer_letter,
                    PATHINFO_EXTENSION), [
                'download', 'id' => $model->ID,
                'file' => 'OfferLetter'.'_'.$model->Name.'_'.$model->ID.'.'.pathinfo($model->offer_letter,
                        PATHINFO_EXTENSION)
            ]) : ''; ?>
		</P>
		<P><strong>Academic Transcript: </strong>
            <?= ($model->academic_transcript) ? Html::a('AcademicTranscript'.'_'.$model->Name.'_'.$model->ID.'.'.pathinfo($model->academic_transcript,
                    PATHINFO_EXTENSION), [
                'download', 'id' => $model->ID,
                'file' => 'AcademicTranscript'.'_'.$model->Name.'_'.$model->ID.'.'.pathinfo($model->academic_transcript,
                        PATHINFO_EXTENSION)
            ]) : ''; ?>
		</P>
		<P><strong>Programme Brochure: </strong>
            <?= ($model->program_brochure) ? Html::a('ProgramBrochure'.'_'.$model->Name.'_'.$model->ID.'.'.pathinfo($model->program_brochure,
                    PATHINFO_EXTENSION), [
                'download', 'id' => $model->ID,
                'file' => 'ProgramBrochure'.'_'.$model->Name.'_'.$model->ID.'.'.pathinfo($model->program_brochure,
                        PATHINFO_EXTENSION)
            ]) : ''; ?>
		</P>
		<P><strong>Latest Pay Slip: </strong>
            <?= ($model->latest_pay_slip) ? Html::a('LatestPaySlip'.'_'.$model->Name.'_'.$model->ID.'.'.pathinfo($model->latest_pay_slip,
                    PATHINFO_EXTENSION), [
                'download', 'id' => $model->ID,
                'file' => 'LatestPaySlip'.'_'.$model->Name.'_'.$model->ID.'.'.pathinfo($model->latest_pay_slip,
                        PATHINFO_EXTENSION)
            ]) : ''; ?>
		</P>
		<P><strong>Other Latest Pay Slip: </strong>
            <?= ($model->other_latest_pay_slip) ? Html::a('OtherLatestPaySlip'.'_'.$model->Name.'_'.$model->ID.'.'.pathinfo($model->other_latest_pay_slip,
                    PATHINFO_EXTENSION), [
                'download', 'id' => $model->ID,
                'file' => 'OtherLatestPaySlip'.'_'.$model->Name.'_'.$model->ID.'.'.pathinfo($model->other_latest_pay_slip,
                        PATHINFO_EXTENSION)
            ]) : ''; ?>
		</P>
	</div>
    <?php if ($model->Status >= 41):?>
		<div class = "col-md-6">
			<P><strong>Proof of sponsorship/ funding/ grant (Official Letter)</strong>
                <?= ($model->proof_of_sponsorship) ? Html::a('ProofOfSponsorship'.'_'.$model->ID.'.'.pathinfo($model->other_latest_pay_slip,
                        PATHINFO_EXTENSION), [
                    'download', 'id' => $model->ID,
                    'file' => 'ProofOfSponsorship'.'_'.$model->ID.'.'.pathinfo($model->proof_of_sponsorship,
                            PATHINFO_EXTENSION)
                ]) : ''; ?>
			</P>
			<P><strong>Other Latest Pay Slip: </strong>
                <?= ($model->proof_insurance_cover) ? Html::a('ProofInsuranceCover'.'_'.$model->ID.'.'.pathinfo($model->other_latest_pay_slip,
                        PATHINFO_EXTENSION), [
                    'download', 'id' => $model->ID,
                    'file' => 'ProofInsuranceCover'.'_'.$model->ID.'.'.pathinfo($model->proof_insurance_cover,
                            PATHINFO_EXTENSION)
                ]) : ''; ?>
			</P>
			<P><strong>Other Latest Pay Slip: </strong>
                <?= ($model->letter_of_indemnity) ? Html::a('LetterOfIndemnity'.'_'.$model->ID.'.'.pathinfo($model->other_latest_pay_slip,
                        PATHINFO_EXTENSION), [
                    'download', 'id' => $model->ID,
                    'file' => 'LetterOfIndemnity'.'_'.$model->ID.'.'.pathinfo($model->letter_of_indemnity,
                            PATHINFO_EXTENSION)
                ]) : ''; ?>
			</P>
			<P><strong>Other Latest Pay Slip: </strong>
                <?= ($model->flight_ticket) ? Html::a('FlightTicket'.'_'.$model->ID.'.'.pathinfo($model->other_latest_pay_slip,
                        PATHINFO_EXTENSION), [
                    'download', 'id' => $model->ID,
                    'file' => 'FlightTicket'.'_'.$model->ID.'.'.pathinfo($model->flight_ticket,
                            PATHINFO_EXTENSION)
                ]) : ''; ?>
			</P>
		</div>
    <?php endif;?>
</div>

<div class = "row">
	<div class = "col-md-6">
		<p class = "mb-2 alert alert-secondary"><strong>Rejection Reason from HOD:</strong>
            <?= $model->note_hod ?></p>
	</div>
	<div class = "col-md-6">
		<p class = "mb-2 alert alert-secondary"><strong>Rejection Reason from Dean:</strong> <?= $model->note_dean ?>
		</p>
	</div>
</div>






<div class = "d-flex flex-row justify-content-start mt-5 gap-2 ">
    <?= Html::
    a('<button type="button" class="btn btn-outline-dark">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
                                </svg>back</button>', Yii::$app->request->referrer) ?>


</div>



