<?php

use common\widgets\DownloadLinkWidget;
use yii\helpers\Html;
use yii\helpers\Url;

/** @var yii\web\View $this */
/** @var common\models\Outbound $model */
/** @var common\models\Poc $modelPoc1 */

$creationYearLastTwoDigits = date('y', strtotime($model->created_at));

$fileName = $creationYearLastTwoDigits.'_'.$model->ID;
require Yii::getAlias('@common').'/Helpers/helper.php';
?>

<div class = "d-flex float-row justify-content-between align-items-center">
    <?= $this->render('/reusable/viewHeader', ['model' => $model]) ?>
    <div class = "d-flex flex-row justify-content-center">
        <?= Html::a('<i class="ti ti-circle-check fs-7" data-toggle="tooltip" title="Action"></i>',
            ['action', 'ID' => $model->ID], [
                'class' => 'btn btn-lg btn-light-primary text-primary edit mx-1', 'data-toggle' => 'tooltip',
                'data-placement' => "top", 'title' => 'Action', // Tooltip for the 'Action' action
            ]) ?>

        <?php if (Yii::$app->user->can('superAdmin')): ?>
            <?= Html::a('<i class="ti ti-trash fs-7" data-toggle="tooltip" title="delete"></i>',
                ['delete', 'ID' => $model->ID], [
                    'class' => 'btn btn-lg btn-light-danger text-danger edit mx-1 delete-record',
                    // Add a class to identify the delete action
                    'data' => [
                        'action' => Url::to(['delete', 'ID' => $model->ID]), // Add the action URL to data attributes
                    ],
                ]) ?>
            <?= Html::a('<i class="ti ti-edit fs-7" data-toggle="tooltip" title="update"></i>',
                ['update', 'ID' => $model->ID], [
                    'class' => 'text-secondary btn btn-lg btn-light-secondary edit mx-1',
                    // Add a class to identify the delete action
                    'data' => [
                        'action' => Url::to(['delete', 'ID' => $model->ID]), // Add the action URL to data attributes
                    ],
                ]) ?>
            <!--            --><?php //= Html::button('Update', [
//                'class' => 'btn btn-primary',
//                'onclick' => 'location.href='.Json::encode(Url::to(['update', 'ID' => $model->ID])),
//            ]) ?>
        <?php endif; ?>
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
                        <p class = "mb-2 fw-light mb-1"><strong>Matric Number: </strong> <?= $model->Matric_Number ?>
                        </p>
                        <p class = "mb-2 fw-light mb-1"><strong>Citizenship: </strong> <?= $model->Citizenship ?></p>
                        <p class = "mb-2 fw-light mb-1">
                            <strong>Gender: </strong> <?= getGenderMeaning($model->Gender) ?></p>
                        <p class = "mb-2 fw-light mb-1"><strong>Postcode: </strong> <?= $model->Postcode ?></p>
                        <p class = "mb-2 fw-light mb-1"><strong>State: </strong> <?= getState($model->State); ?></p>
                        <p class = "mb-2 fw-light mb-1"><strong>Country: </strong> <?= getCountry($model->Country); ?>
                        </p>
                    </div>
                    <div class = "col-md-6">
                        <p class = "mb-2 fw-light mb-1"><strong>Date of Birth: </strong> <?= $model->Date_of_Birth ?>
                        </p>
                        <p class = "mb-2 fw-light mb-1"><strong>Passport
                                                                Number: </strong> <?= $model->Passport_Number ?></p>
                        <p class = "mb-2 fw-light mb-1"><strong>Passport
                                                                Expiration: </strong> <?= $model->Passport_Expiration ?>
                        </p>
                        <p class = "mb-2 fw-light mb-1"><strong>Mobile Number:</strong> <?= $model->Mobile_Number ?></p>
                        <p class = "mb-2 fw-light mb-1"><strong>Mailing
                                                                Address: </strong> <?= $model->Mailing_Address ?></p>
                        <p class = "mb-2 fw-light mb-1"><strong>Mailing
                                                                state: </strong> <?= getState($model->Mailing_State); ?>
                        </p>
                        <p class = "mb-2 fw-light mb-1"><strong>Mailing
                                                                Country: </strong> <?= getCountry($model->Mailing_Country); ?>
                        </p>
                    </div>
                </div>
                <ul class = "list-unstyled mt-2">
                    <li class = "d-flex align-items-center gap-3 mb-2">
                        <i class = "ti ti-mail text-dark fs-6"></i>
                        <h6 class = "fs-4 fw-semibold mb-0">Email Address: <a
                                href = "mailto:<?= $model->Email ?>"><?= $model->Email ?></a></h6>
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
                        <p class = "mb-2 fw-light mb-1"><strong>Level Of
                                                                Education: </strong> <?= $model->Academic_lvl_edu ?></p>
                        <p class = "mb-2 fw-light mb-1"><strong>Kulliyyah: </strong> <?= $model->Academic_kulliyyah ?>
                        </p>
                        <?php if ($model->Academic_kulliyyah === 'OTHERS'): ?>
                            <p class = "mb-2 fw-light mb-1">
                                <strong>Other Kulliyyah:</strong> <?= $model->Academic_kulliyyah_others ?>
                            </p>
                        <?php endif; ?>


                        <p class = "mb-2 fw-light mb-1"><strong>Current
                                                                Semester: </strong> <?= $model->Academic_current_semester ?>
                        </p>
                        <p class = "mb-2 fw-light mb-1">
                            <strong>Programme: </strong> <?= $model->Academic_name_of_programme ?></p>
                        <p class = "mb-2 fw-light mb-1"><strong>CGPA: </strong> <?= $model->Academic_cgpa ?></p>
                    </div>
                </div>
            </div>
            <div class = "col-lg-6">
                <div class = "card shadow-none border bg-light-pink">
                    <div class = "card-body">
                        <div class = "d-flex align-items-center header-info gap-1 mb-3">
                            <i class = "ti ti-map-pins text-dark"></i>
                            <strong>
                                <h4 class = "fw-semibold m-0">Mobility Program Info</h4>
                            </strong>
                        </div>
                        <p class = "mb-2 fw-light mb-1"><strong>Mobility
                                                                Type: </strong> <?= getMobilityType($model->Type_mobility) ?>
                        </p>

                        <p class = "mb-2 fw-light mb-1"><strong>Host University
                                                                Name: </strong> <?= $model->Host_university_name ?></p>
                        <p class = "mb-2 fw-light mb-1"><strong>Host University
                                                                Country: </strong><?= getCountry($model->Connect_host_country); ?>
                        </p>
                        <p class = "mb-2 fw-light mb-1"><strong>Avability for Credit
                                                                Transfer: </strong> <?= getCredit($model->credit_transfer_availability) ?>
                        </p>
                        <p class = "mb-2 fw-light mb-1"><strong>Programme
                                                                Type: </strong> <?= $model->Type_mobility_program ?></p>
                        <?php if ($model->Type_mobility_program === "Other"): ?>
                            <p class = "mb-2 fw-light mb-1"><strong>Programme Type
                                                                    (Other): </strong> <?= $model->Type_mobility_program_other ?>
                            </p>
                        <?php endif; ?>
                        <p class = "mb-2  fw-semibold mb-1 text-decoration-underline">Duration</p>
                        <div class = "d-flex justify-content-evenly ">
                            <p class = "mb-2 fw-light mb-1"><strong>From: </strong> <?= $model->Mobility_from ?></p>
                            <p class = "mb-2 fw-light mb-1"><strong>Until: </strong> <?= $model->Mobility_until ?></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class = "row">
            <div class = "col">
                <div class = "card shadow-none border">
                    <div class = "card-body">
                        <div class = "row">
                            <div class = "d-flex align-items-center header-info gap-1 mb-3">
                                <i class = "ti ti-user-check text-dark"></i>
                                <strong>
                                    <h4 class = "fw-semibold m-0">Host Person Info</h4>
                                </strong>
                            </div>
                            <div class = "col-lg-6">
                                <p class = "mb-2 fw-light mb-1"><strong>Name: </strong> <?= $model->Connect_host_name ?>
                                </p>
                                <p class = "mb-2 fw-light mb-1">
                                    <strong>Position: </strong> <?= $model->Connect_host_position ?></p>
                                <p class = "mb-2 fw-light mb-1"><strong>Mobile
                                                                        Number: </strong> <?= $model->Connect_host_mobile_number ?>
                                </p>
                                <p class = "mb-2 fw-light mb-1"><strong>Email
                                                                        Address: </strong> <?= $model->Connect_host_email ?>
                                </p>
                            </div>
                            <div class = "col-lg-6">
                                <p class = "mb-2 fw-light mb-1"><strong>Post
                                                                        Code:</strong> <?= $model->Connect_host_postcode ?>
                                </p>
                                <p class = "mb-2 fw-light mb-1">
                                    <strong>Country:</strong> <?= getCountry($model->Connect_host_country); ?></p>
                                <p class = "mb-2 fw-light mb-1">
                                    <strong>Address:</strong> <?= $model->Connect_host_address ?></p>
                                <p class = "mb-2 fw-light mb-1"><strong>Host
                                                                        Scholarship:</strong> <?= getAnswer($model->host_scholarship); ?>
                                </p>
                                <?php if ($model->host_scholarship === 1): ?>
                                    <p class = "mb-2 fw-light mb-1">
                                        <strong>Amount:</strong> <?= $model->host_scholarship_amount ?></p>
                                <?php endif; ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class = "row">
            <div class = "col">
                <div class = "card shadow-none border bg-light-gray">
                    <div class = "card-body">
                        <div class = "row">
                            <div class = "d-flex justify-content-between align-items-center mb-3">
                                <div class = "d-flex align-items-center  header-info gap-2">
                                    <i class = "ti ti-file text-dark"></i>
                                    <strong>
                                        <h4 class = "fw-semibold m-0">Files</h4>
                                    </strong>
                                </div>
                                <div>
                                    <?= Html::a('<i class="ti ti-download fs-7"></i>',
                                        ['download-all', 'id' => $model->ID],
                                        ['class' => 'download']) ?>
                                </div>
                            </div>
                            <div class = "col-md-6">
                                <?= DownloadLinkWidget::widget([
                                    'model' => $model, 'attribute' => 'Offer_letter', 'fileName' => 'offerLetter',
                                    'text' => 'Offer Letter'
                                ]) ?>
                                <?= DownloadLinkWidget::widget([
                                    'model' => $model, 'attribute' => 'Academic_transcript',
                                    'fileName' => 'AcademicTranscript', 'text' => 'Academic Transcript'
                                ]) ?>
                                <?= DownloadLinkWidget::widget([
                                    'model' => $model, 'attribute' => 'Program_brochure',
                                    'fileName' => 'ProgramBrochure', 'text' => 'Program Brochure'
                                ]) ?>
                                <?= DownloadLinkWidget::widget([
                                    'model' => $model, 'attribute' => 'Latest_pay_slip', 'fileName' => 'LatestPaySlip',
                                    'text' => 'Latest Pay Slip'
                                ]) ?>
                                <?= DownloadLinkWidget::widget([
                                    'model' => $model, 'attribute' => 'Other_latest_pay_slip',
                                    'fileName' => 'OtherLatestPaySlip', 'text' => 'Other Latest Pay Slip'
                                ]) ?>
                            </div>
                            <div class = "col-md-6">
                                <?php if ($model->Status >= 41): ?>
                                    <?= DownloadLinkWidget::widget([
                                        'model' => $model, 'attribute' => 'Proof_of_sponsorship',
                                        'fileName' => 'ProofOfSponsorship', 'text' => 'Proof of sponsorship'
                                    ]) ?>
                                    <?= DownloadLinkWidget::widget([
                                        'model' => $model, 'attribute' => 'Proof_insurance_cover',
                                        'fileName' => 'ProofInsuranceCover', 'text' => 'Other Latest Pay Slip'
                                    ]) ?>
                                    <?= DownloadLinkWidget::widget([
                                        'model' => $model, 'attribute' => 'Letter_of_indemnity',
                                        'fileName' => 'LetterOfIndemnity', 'text' => 'Letter of Indemnity'
                                    ]) ?>
                                    <?= DownloadLinkWidget::widget([
                                        'model' => $model, 'attribute' => 'Flight_ticket', 'fileName' => 'FlightTicket',
                                        'text' => 'Flight Ticket'
                                    ]) ?>
                                    <?php if ($model->Status >= 71): ?><p class = "fw-semibold text-decoration-underline"><?= Html::a('Download Imgs and videos only', ['download-after', 'id' => $model->ID], ['class' => 'download']) ?></p><?php endif; ?>
                                <?php endif; ?>
                            </div>
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
                <p class = "mb-2 fw-light mb-1"><strong>RelationShip: </strong> <?= $model->Emergency_relationship ?>
                </p>
                <p class = "mb-2 fw-light mb-1"><strong>Phone Number: </strong> <?= $model->Emergency_phoneNumber ?></p>
                <p class = "mb-2 fw-light mb-1"><strong>Post Code: </strong> <?= $model->Emergency_postCode ?></p>
                <p class = "mb-2 fw-light mb-1"><strong>State: </strong> <?= getState($model->Emergency_tate); ?></p>
                <p class = "mb-2 fw-light mb-1"><strong>Country:</strong> <?= getCountry($model->Emergency_country); ?>
                </p>
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
                <?php if ($model->Sponsoring_name === "OTHERS"): ?>
                    <p class = "mb-2 fw-light mb-1"><strong>Other
                                                            (sponser):</strong> <?= $model->Sponsoring_name_other ?></p>
                <?php endif; ?>
                <p class = "mb-2 fw-light mb-1"><strong>Funding:</strong> <?= $model->Sponsoring_funding ?></p>
                </p>

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
                <?php endif; ?>
            </div>
        </div>
        <div class = "card shadow-none border bg-light-primary">
            <div class = "card-body">
                <div class = "mb-3">
                    <h4 class = "fw-semibold m-0">Person in charge</h4>
                </div>
                <?php if ($modelPoc1): ?>
                    <p class = "mb-2 fw-light mb-1"><strong>name: </strong> <?= $modelPoc1->name ?></p>
                    <p class = "mb-2 fw-light mb-1"><strong>Email: </strong> <a
                            href = "mailto:<?= $modelPoc1->email ?>"><?= $modelPoc1->email ?></a></p>
                <?php else: ?>
                    <p>Person in charge not set yet.</p>
                <?php endif; ?>
            </div>
        </div>
        <div class = "card shadow-none border bg-light-info">
            <div class = "card-body">
                <div class = "mb-3">
                    <h4 class = "fw-semibold m-0">Dean</h4>
                </div>
                <?php if ($modelPoc2): ?>
                    <p class = "mb-2 fw-light mb-1"><strong>name: </strong> <?= $modelPoc2->name ?></p>
                    <p class = "mb-2 fw-light mb-1"><strong>Email: </strong> <a
                            href = "mailto:<?= $modelPoc2->email ?>"><?= $modelPoc2->email ?></a></p>
                <?php else: ?>
                    <p>Dean not set yet.</p>
                <?php endif; ?>
            </div>
        </div>
    </div>
</div>
<div class = "card shadow-none border ">
    <div class = "card-body">
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
                <p class = "mb-2 fw-light mb-1 text-dark"><strong>Academic Research:</strong> <?= $model->Research ?>
                </p>
            </div>
        <?php endif; ?>
    </div>
</div>

