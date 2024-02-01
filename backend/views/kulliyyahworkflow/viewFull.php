<?php

use common\models\Status;
use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var common\models\Inbound $model */
/** @var common\models\Poc $modelPoc1 */

require Yii::getAlias('@common').'/Helpers/helper.php';

$creationYearLastTwoDigits = date('y', strtotime($model->created_at));

$fileName = $creationYearLastTwoDigits.'_'.$model->ID;
?>
<div class = "container">
    <?= $this->render('/reusable/viewHeader', ['model' => $model]) ?>
    <div class = "row">
        <div class = "col-lg-8">
            <div class = "card shadow-none border bg-light-subtle">
                <div class = "card-body">
                    <div class = "d-flex align-items-center header-info gap-1 mb-3">
                        <i class = "ti ti-user-circle text-dark"></i>
                        <strong>
                            <h4 class = "fw-semibold m-0 ">Personal Info</h4>
                        </strong>
                    </div>
                    <div class = "row">
                        <div class = "col-md-6">
                            <p class = "mb-2 fw-light mb-1"><strong>Name: </strong> <?= $model->Name ?></p>
                            <p class = "mb-2 fw-light mb-1">
                                <strong>Gender: </strong> <?= getGenderMeaning($model->Gender) ?></p>
                            <p class = "mb-2 fw-light mb-1"><strong>Citizenship: </strong> <?= $model->Citizenship ?>
                            </p>
                            <p class = "mb-2 fw-light mb-1"><strong>Marital
                                                                    Status: </strong> <?= $model->Relation_ship ?></p>
                            <p class = "mb-2 fw-light mb-1"><strong>Religion: </strong> <?= $model->Religion ?></p>
                            <p class = "mb-2 fw-light mb-1"><strong>Mazhab: </strong> <?= $model->Mazhab ?></p>
                            <p class = "mb-2 fw-light mb-1"><strong>Postcode: </strong> <?= $model->Postcode ?></p>
                            <p class = "mb-2 fw-light mb-1">
                                <strong>Country: </strong> <?= getCountry($model->Country); ?></p>
                        </div>
                        <div class = "col-md-6">
                            <p class = "mb-2 fw-light mb-1"><strong>Country of
                                                                    Origin: </strong> <?= getCountry($model->Country_of_origin) ?>
                            </p>
                            <p class = "mb-2 fw-light mb-1"><strong>Country of
                                                                    Residence: </strong> <?= getCountry($model->Country_of_residence) ?>
                            </p>
                            <p class = "mb-2 fw-light mb-1"><strong>Date of
                                                                    Birth: </strong> <?= $model->Date_of_Birth ?></p>
                            <p class = "mb-2 fw-light mb-1"><strong>Passport
                                                                    Number: </strong> <?= $model->Passport_Number ?></p>
                            <p class = "mb-2 fw-light mb-1"><strong>Passport
                                                                    Expiration: </strong> <?= $model->Passport_Expiration ?>
                            </p>
                            <p class = "mb-2 fw-light mb-1"><strong>Mobile Number:</strong> <?= $model->Mobile_Number ?>
                            </p>


                        </div>
                    </div>
                    <ul class = "list-unstyled mt-2">
                        <li class = "d-flex align-items-center gap-3 mb-2">
                            <i class = "ti ti-mail text-dark fs-6"></i>
                            <h6 class = "fs-4 fw-semibold mb-0">Email Address: <a
                                    href = "mailto:<?= $model->Email_address ?>"><?= $model->Email_address ?></a></h6>
                        </li>
                        <li class = "d-flex align-items-center gap-3 mb-2">
                            <i class = "ti ti-map-pin text-dark fs-6"></i>
                            <h6 class = "fs-4 fw-semibold mb-0">Permanent Address:</h6>
                            <p class = "fs-4 mb-0"><?= $model->Permanent_Address ?></p>
                        </li>
                    </ul>
                </div>
            </div>
            <div class = "row">
                <div class = "col-lg-6 d-flex flex-column">
                    <div class = "card shadow-none border flex-fill bg-light-autom">
                        <div class = "card-body">
                            <div class = "d-flex align-items-center header-info gap-1 mb-3">
                                <i class = "ti ti-school text-dark"></i>
                                <strong>
                                    <h4 class = "fw-semibold m-0">Academic Background</h4>
                                </strong>
                            </div>
                            <p class = "mb-2 fw-light mb-1"><strong>Home
                                                                    University: </strong> <?= $model->Academic_home_university ?>
                            </p>
                            <p class = "mb-2 fw-light mb-1"><strong>Level Of
                                                                    Education: </strong> <?= $model->Academic_lvl_edu ?>
                            </p>
                            <p class = "mb-2 fw-light mb-1">
                                <strong>Programme: </strong> <?= $model->Academic_name_of_programme ?></p>
                            <p class = "mb-2 fw-light mb-1"><strong>Current
                                                                    Semester: </strong> <?= $model->Academic_current_semester ?>
                            </p>
                            <p class = "mb-2 fw-light mb-1"><strong>Current
                                                                    Year: </strong> <?= $model->Academic_current_year ?>
                            </p>
                            <p class = "mb-2 fw-light mb-1"><strong>Name of
                                                                    Faculty: </strong> <?= $model->Academic_name_of_faculty ?>
                            </p>
                            <p class = "mb-2 fw-light mb-1"><strong>Current
                                                                    Result: </strong> <?= $model->Academic_current_result ?>
                            </p>
                            <p class = "mb-2 fw-light mb-1"><strong>Research
                                                                    Title: </strong> <?= $model->Research_title ?></p>
                            <p class = "mb-2 fw-light mb-1"><strong>University have MOU/MOA with
                                                                    IIUM: </strong> <?= getAnswer($model->Mou_or_Moa) ?>
                            </p>
                        </div>
                    </div>
                </div>
                <div class = "col-lg-6 d-flex flex-column">
                    <div class = "card shadow-none border flex-fill bg-light-pink">
                        <div class = "card-body">
                            <div class = "d-flex align-items-center header-info gap-1 mb-3">
                                <i class = "ti ti-map-pins text-dark"></i>
                                <strong>
                                    <h4 class = "fw-semibold m-0">Mobility Program Info</h4>
                                </strong>
                            </div>
                            <p class = "mb-2 fw-light mb-1"><strong>Type of
                                                                    Programme: </strong> <?= $model->Propose_type_of_programme ?>
                            </p>
                            <p class = "mb-2 fw-light mb-1"><strong>Type of Programme
                                                                    (Other): </strong> <?= $model->Propose_type_of_programme_other ?>
                            </p>
                            <p class = "mb-2 fw-light mb-1"><strong>Type of
                                                                    Mobility: </strong> <?= getMobilityType($model->Propose_type_of_mobility) ?>
                            </p>
                            <p class = "mb-2 fw-light mb-1"><strong>Kulliyyah
                                                                    Applied: </strong> <?= $model->Propose_kulliyyah_applied ?>
                            </p>
                            <p class = "mb-2 fw-light mb-1">
                                <strong>Duration:</strong><?= $model->Propose_duration_of_study ?></p>
                            <div class = "d-flex gap-3 ">
                                <p class = "mb-2 fw-light mb-1">
                                    <strong>From: </strong> <?= $model->Propose_duration_start ?></p>
                                <p class = "mb-2 fw-light mb-1">
                                    <strong>Until: </strong> <?= $model->Propose_duration_end ?></p>
                            </div>
                            <p class = "mb-2 fw-light mb-1"><strong>Avability for Credit
                                                                    Transfer: </strong> <?= getAnswer($model->Propose_transfer_credit_hours) ?>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class = "row">
                <div class = "col d-flex flex-column">
                    <div class = "card shadow-none flex-fill border">
                        <div class = "card-body">
                            <div class = "row">
                                <div class = "d-flex align-items-center header-info gap-1 mb-3">
                                    <i class = "ti ti-user-check text-dark"></i>
                                    <strong>
                                        <h4 class = "fw-semibold m-0">Host Person Info</h4>
                                    </strong>
                                </div>
                                <p class = "mb-2 fw-light mb-1">
                                    <strong>Name: </strong> <?= $model->Approval_university_person_name ?></p>
                                <p class = "mb-2 fw-light mb-1">
                                    <strong>Position: </strong> <?= $model->Approval_person_position ?></p>
                                <p class = "mb-2 fw-light mb-1"><strong>Email Address: </strong><a
                                        href = "mailto:<?= $model->Approval_person_email ?>"><?= $model->Approval_person_email ?></a>
                                </p>
                                <p class = "mb-2 fw-light mb-1"><strong>Mobile
                                                                        Number: </strong> <?= $model->Approval_person_mobile_number ?>
                                </p>
                                <p class = "mb-2 fw-light mb-1"><strong>Date: </strong> <?= $model->Approval_date ?></p>
                                <p class = "fw-semibold"><?= ($model->Recommendation_letter) ? Html::a('RecommendationLetter',
                                        [
                                            'download', 'id' => $model->ID,
                                            'file' => $fileName.'_RecommendationLetter'.'.pdf'
                                        ]) : ''; ?></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class = "row">
                <div class = "col">

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
                    <p class = "mb-2 fw-light mb-1">
                        <strong>RelationShip: </strong> <?= $model->Emergency_relationship ?></p>
                    <p class = "mb-2 fw-light mb-1"><strong>Phone Number: </strong> <?= $model->Emergency_phoneNumber ?>
                    </p>
                    <p class = "mb-2 fw-light mb-1"><strong>Phone Number: </strong> <?= $model->Emergency_email ?></p>
                    <p class = "mb-2 fw-light mb-1"><strong>Home Address: </strong> <?= $model->Emergency_homeAddress ?>
                    </p>
                    <p class = "mb-2 fw-light mb-1"><strong>Post Code: </strong> <?= $model->Emergency_postCode ?></p>
                    <p class = "mb-2 fw-light mb-1"><strong>Country:</strong> <?= $model->Emergency_country ?></p>
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
                    <p class = "mb-2 fw-light mb-1"><strong>Accommodation on
                                                            Campus: </strong> <?= getAnswer($model->Financial_accommodation_on_campus) ?>
                    </p>
                    <p class = "mb-2 fw-light mb-1"><strong>Campus Location: </strong> <?= $model->campus_location ?>
                    </p>
                    <p class = "mb-2 fw-light mb-1"><strong>Financial Funding for Fees and Living
                                                            Expenses: </strong> <?= $model->Financial_funding ?></p>
                    <?php if ($model->Financial_funding === "Scholarship"): ?>
                        <p class = "mb-2 fw-light mb-1"><strong>Sponsor Name: </strong> <?= $model->Sponsor_name ?></p>
                        <p class = "mb-2 fw-light mb-1">
                            <strong>Amount: </strong> <?= $model->Financial_funding_sponsor_amount ?></p>
                    <?php elseif ($model->Financial_funding === "Others"): ?>
                        <p class = "mb-2 fw-light mb-1"><strong>Others: </strong> <?= $model->Financial_funding_other ?>
                        </p>
                    <?php endif; ?>
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
                                                            Proficiency: </strong> <?= getAnswer($model->English_native) ?>
                    </p>
                    <p class = "fw-semibold"><?= ($model->English_certificate) ? Html::a('English Certificate', [
                            'download', 'ID' => $model->ID, 'token' => $model->Token,
                            'file' => $fileName.'_EnglishCertificate'.'.pdf'
                        ]) : ''; ?></p>
                </div>
            </div>
            <div class = "card shadow-none border bg-light-gray">
                <div class = "card-body">
                    <div class = "row">
                        <div class = "d-flex align-items-center header-info gap-1 mb-3">
                            <i class = "ti ti-file text-dark"></i>
                            <strong>
                                <h4 class = "fw-semibold m-0">Files</h4>
                            </strong>
                        </div>

                        <p class = "fw-semibold"><?= ($model->Passport) ? Html::a('Passport', [
                                'download', 'ID' => $model->ID, 'token' => $model->Token,
                                'file' => $fileName.'_Passport'.'.pdf'
                            ]) : ''; ?></p>

                        <p class = "fw-semibold"><?= ($model->Latest_passport_photo) ? Html::a('Latest Passport Photo',
                                [
                                    'download', 'ID' => $model->ID, 'token' => $model->Token,
                                    'file' => $fileName.'_LatestPassportPhoto'.'.pdf'
                                ]) : ''; ?></p>

                        <p class = "fw-semibold"><?= ($model->Latest_certified_academic_transcript) ? Html::a('Latest Certified Academic Transcript',
                                [
                                    'download', 'ID' => $model->ID, 'token' => $model->Token,
                                    'file' => $fileName.'_LatestCertifiedAcademicTranscript'.'.pdf'
                                ]) : ''; ?></p>

                        <p class = "fw-semibold"><?= ($model->Confirmation_letter) ? Html::a('Confirmation Letter', [
                                'download', 'ID' => $model->ID, 'token' => $model->Token,
                                'file' => $fileName.'_ConfirmationLetter'.'.pdf'
                            ]) : ''; ?></p>

                        <p class = "fw-semibold"><?= ($model->Sponsorship_letter) ? Html::a('Sponsorship Letter', [
                                'download', 'ID' => $model->ID, 'token' => $model->Token,
                                'file' => $fileName.'_SponsorshipLetter'.'.pdf'
                            ]) : ''; ?></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>