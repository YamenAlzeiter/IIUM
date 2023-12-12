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
		<p class = "mb-2 fw-light mb-1"><strong>Gender: </strong> <?= getGenderMeaning($model->Gender) ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Date of Birth: </strong> <?= $model->Date_of_Birth ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Marital Status: </strong> <?= $model->Relation_ship ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Citizenship: </strong> <?= $model->Citizenship ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Religion: </strong> <?= $model->Religion ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Country of origin: </strong> <?= $model->Country_of_origin ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Permanent Address: </strong> <?= $model->Permanent_Address ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Country: </strong> <?= $model->Country ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Postcode: </strong> <?= $model->Postcode ?></p>
	</div>
	<div class = "col-md-6">
		<p class = "mb-2 fw-light mb-1"><strong>Passport Number: </strong> <?= $model->Passport_Number ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Passport Expiration: </strong> <?= $model->Passport_Expiration ?>
		</p>
		<p class = "mb-2 fw-light mb-1"><strong>Mobile Number:</strong> <?= $model->Mobile_Number ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Email Address: </strong> <a
					href = "mailto:<?= $model->Email_address ?>"><?= $model->Email_address ?></a></p>

		<p class = "mb-2 fw-light mb-1"><strong>Country of residence: </strong> <?= $model->Country_of_residence ?>
		</p>
		<p class = "mb-2 fw-light mb-1"><strong>Mazhab: </strong> <?= $model->Mazhab ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Postcode: </strong> <?= $model->Postcode ?></p>
	</div>
</div>


<div class = "alert alert-warning my-4 py-2">
	<strong><h4 class = "alert text-capitalize m-0 p-0 font-monospace">Emergency Info</h4></strong>
</div>

<div class = "row">
	<div class = "col-md-6">
		<p class = "mb-2 fw-light mb-1"><strong>Name: </strong> <?= $model->Emergency_name ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>RelationShip: </strong> <?= $model->Emergency_relationship ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Phone Number: </strong> <?= $model->Emergency_phoneNumber ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Phone Number: </strong> <?= $model->Emergency_email ?></p>
	</div>
	<div class = "col-md-6">
		<p class = "mb-2 fw-light mb-1"><strong>Home Address: </strong> <?= $model->Emergency_homeAddress ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Post Code: </strong> <?= $model->Emergency_postCode ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Country:</strong> <?= $model->Emergency_country ?></p>
	</div>
</div>

<div class = "alert alert-warning my-4 py-2">
	<strong><h4 class = "alert text-capitalize m-0 p-0 font-monospace">Academic Background</h4></strong>
</div>

<div class = "row">
	<div class = "col-md-6">
		<p class = "mb-2 fw-light mb-1"><strong>Home University: </strong> <?= $model->Academic_home_university ?>
		</p>
		<p class = "mb-2 fw-light mb-1"><strong>Level Of Education: </strong> <?= $model->Academic_lvl_edu ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Programme: </strong> <?= $model->Academic_name_of_programme ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Current Semester: </strong> <?= $model->Academic_current_semester ?>
		</p>
		<p class = "mb-2 fw-light mb-1"><strong>Current Year: </strong> <?= $model->Academic_current_year ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Name of Faculty: </strong> <?= $model->Academic_name_of_faculty ?>
		</p>
		<p class = "mb-2 fw-light mb-1"><strong>Current Result: </strong> <?= $model->Academic_current_result ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Research Title: </strong> <?= $model->Research_title ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>University have MOU/MOA with
		                                        IIUM: </strong> <?= $model->Mou_or_Moa ?></p>
	</div>
	<div class = "col-md-6">
		<p class = "mb-2 fw-light mb-1"><strong>English
		                                        Proficiency: </strong> <?= getAnswer($model->English_native) ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Result: </strong> <?= $model->English_test_name ?></p>
		<P><strong>English Certificate: </strong>
            <?= ($model->English_certificate) ? Html::a('English_certificate'.'_'.$model->Name.'_'.$model->ID.'.'.pathinfo($model->English_certificate,
                    PATHINFO_EXTENSION), [
                'download', 'id' => $model->ID,
                'file' => 'English_certificate'.'_'.$model->Name.'_'.$model->ID.'.'.pathinfo($model->English_certificate,
                        PATHINFO_EXTENSION)
            ]) : ''; ?>
		</P>
	</div>
</div>

<div class = "alert alert-warning my-4 py-2">
	<strong><h4 class = "alert text-capitalize m-0 p-0 font-monospace">Mobility Program Info</h4></strong>
</div>

<div class = "row">
	<div class = "col-md-6">
		<p class = "mb-2 fw-light mb-1"><strong>Type of
		                                        Programme: </strong> <?= $model->Propose_type_of_programme ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Type of Programme
		                                        (Other): </strong> <?= $model->Propose_type_of_programme_other ?>
		</p>
		<p class = "mb-2 fw-light mb-1"><strong>Type of Mobility: </strong> <?= $model->Propose_type_of_mobility ?>
		</p>
		<p class = "mb-2 fw-light mb-1"><strong>Kulliyyah
		                                        Applied: </strong> <?= $model->Propose_kulliyyah_applied ?></p>
		<div class = "d-flex gap-3 ">
			<p class = "mb-2 fw-light mb-1"><strong>Duration:</strong><?= $model->Propose_duration_of_study ?></p>
			<p class = "mb-2 fw-light mb-1"><strong>From: </strong> <?= $model->Propose_duration_start ?></p>
			<p class = "mb-2 fw-light mb-1"><strong>Until: </strong> <?= $model->Propose_duration_end ?></p>
		</div>
		<p class = "mb-2 fw-light mb-1"><strong>Avability for Credit
		                                        Transfer: </strong> <?= getAnswer($model->Propose_transfer_credit_hours) ?>
		</p>
	</div>

</div>

<div class = "alert alert-warning my-4 py-2">
	<strong><h4 class = "alert text-capitalize m-0 p-0 font-monospace">Accommodation & Financial Info</h4></strong>
</div>

<div class = "row">
	<div class = "col-md-6">
		<p class = "mb-2 fw-light mb-1"><strong>Accommodation on
		                                        Campus: </strong> <?= $model->Financial_accommodation_on_campus ?>
		</p>
		<p class = "mb-2 fw-light mb-1"><strong>Campus Location: </strong> <?= $model->campus_location ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Financial Funding for Fees and Living
		                                        Expenses: </strong> <?= $model->Financial_funding ?></p>
        <?php if ($model->Financial_funding === "Scholarship"): ?>
			<p class = "mb-2 fw-light mb-1"><strong>Sponsor Name: </strong> <?= $model->Sponsor_name ?></p>
			<p class = "mb-2 fw-light mb-1">
				<strong>Amount: </strong> <?= $model->Financial_funding_sponsor_amount ?></p>
        <?php elseif ($model->Financial_funding === "Others"): ?>
			<p class = "mb-2 fw-light mb-1"><strong>Others: </strong> <?= $model->Financial_funding_other ?></p>
        <?php endif; ?>
	</div>

</div>

<div class = "alert alert-warning my-4 py-2">
	<strong><h4 class = "alert text-capitalize m-0 p-0 font-monospace">Home University Info</h4></strong>
</div>

<div class = "row">
	<div class = "col-md-6">
		<p class = "mb-2 fw-light mb-1"><strong>Name: </strong> <?= $model->Approval_university_person_name ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Position: </strong> <?= $model->Approval_person_position ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Email Address: </strong><a
					href = "mailto:<?= $model->Approval_person_email ?>"><?= $model->Approval_person_email ?></a>
		</p>
		<p class = "mb-2 fw-light mb-1"><strong>Mobile
		                                        Number: </strong> <?= $model->Approval_person_mobile_number ?></p>
		<p class = "mb-2 fw-light mb-1"><strong>Date: </strong> <?= $model->Approval_date ?></p>
		<P><strong>Recommendation Letter: </strong>
            <?= ($model->Recommendation_letter) ? Html::a('Recommendation_letter'.'_'.$model->Name.'_'.$model->ID.'.'.pathinfo($model->Recommendation_letter,
                    PATHINFO_EXTENSION), [
                'download', 'id' => $model->ID,
                'file' => 'Recommendation_letter'.'_'.$model->Name.'_'.$model->ID.'.'.pathinfo($model->Recommendation_letter,
                        PATHINFO_EXTENSION)
            ]) : ''; ?>
		</P>

	</div>

</div>

<div class = "alert alert-warning my-4 py-2">
	<strong><h4 class = "alert text-capitalize m-0 p-0 font-monospace">Files</h4></strong>
</div>
<div class = "row">
	<div class = "col-md-6">



		<P><strong>Passport: </strong>
            <?= ($model->Passport) ? Html::a('Passport'.'_'.$model->Name.'_'.$model->ID.'.'.pathinfo($model->Passport,
                    PATHINFO_EXTENSION), [
                'download', 'id' => $model->ID,
                'file' => 'Passport'.'_'.$model->Name.'_'.$model->ID.'.'.pathinfo($model->Passport,
                        PATHINFO_EXTENSION)
            ]) : ''; ?>
		</P>
		<P><strong>Latest passport photo: </strong>
            <?= ($model->Latest_passport_photo) ? Html::a('Latest_passport_photo'.'_'.$model->Name.'_'.$model->ID.'.'.pathinfo($model->Latest_passport_photo,
                    PATHINFO_EXTENSION), [
                'download', 'id' => $model->ID,
                'file' => 'Latest_passport_photo'.'_'.$model->Name.'_'.$model->ID.'.'.pathinfo($model->Latest_passport_photo,
                        PATHINFO_EXTENSION)
            ]) : ''; ?>
		</P>
		<P><strong>Latest certified academic transcript: </strong>
            <?= ($model->Latest_certified_academic_transcript) ? Html::a('Latest_certified_academic_transcript'.'_'.$model->Name.'_'.$model->ID.'.'.pathinfo($model->Latest_certified_academic_transcript,
                    PATHINFO_EXTENSION), [
                'download', 'id' => $model->ID,
                'file' => 'Latest_certified_academic_transcript'.'_'.$model->Name.'_'.$model->ID.'.'.pathinfo($model->Latest_certified_academic_transcript,
                        PATHINFO_EXTENSION)
            ]) : ''; ?>
		</P>
		<P><strong>Confirmation letter: </strong>
            <?= ($model->Confirmation_letter) ? Html::a('Confirmation_letter'.'_'.$model->Name.'_'.$model->ID.'.'.pathinfo($model->Confirmation_letter,
                    PATHINFO_EXTENSION), [
                'download', 'id' => $model->ID,
                'file' => 'Confirmation_letter'.'_'.$model->Name.'_'.$model->ID.'.'.pathinfo($model->Confirmation_letter,
                        PATHINFO_EXTENSION)
            ]) : ''; ?>
		</P>
		<P><strong>Sponsorship letter: </strong>
            <?= ($model->Sponsorship_letter) ? Html::a('Sponsorship_letter'.'_'.$model->Name.'_'.$model->ID.'.'.pathinfo($model->Sponsorship_letter,
                    PATHINFO_EXTENSION), [
                'download', 'id' => $model->ID,
                'file' => 'Sponsorship_letter'.'_'.$model->Name.'_'.$model->ID.'.'.pathinfo($model->Sponsorship_letter,
                        PATHINFO_EXTENSION)
            ]) : ''; ?>
		</P>
	</div>
</div>







<div class = "d-flex flex-row justify-content-start mt-5 gap-2 ">
    <?= Html::
    a('<button type="button" class="btn btn-outline-dark">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
                                </svg>back</button>', Yii::$app->request->referrer) ?>


</div>



