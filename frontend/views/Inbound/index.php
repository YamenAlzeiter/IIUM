<?php


use common\models\Status;
use common\widgets\DownloadLinkWidget;
use yii\bootstrap5\ActiveForm;
use yii\helpers\Html;

/** @var common\models\Inbound $model */
/** @var common\models\Courses $courses */
/** @var yii\web\View $this */
/** @var backend\views\Inbound\inboundSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

require Yii::getAlias('@common').'/Helpers/helper.php';
$this->title = 'Inbound';
?>

<?php if (isset($noRecord) && $noRecord === true) : ?>


        <h4 class = "fw-semibold">Hello <?= Yii::$app->user->identity->username ?></h4>
		<p class="text-capitalize alert m-0 p-0">No records found yet</p>
		<p class="text-capitalize alert m-0 p-0">
			<strong><?php echo Html::a('Create One', ['create'], ['class' => ' m-0 p-0 alert']); ?></strong>
		</p>

<?php else : ?>


<div class="mb-3 d-flex flex-row justify-content-between align-items-center">
    <div class = "d-flex gap-1 align-items-center">
        <div class = "d-flex flex-column">
            <h1 class = "text-capitalize text-start m-0"><?= $model->Name ?></h1>
            <?php
            $statusModel = Status::findOne(['ID' => statusFiliter($model->Status)]);

            $class = statusHelper(statusFiliter($model->Status));

            // Creating the <p> element
            $p = Html::tag('p', // Nesting the <span> inside the <p> element
                Html::tag('span', '', [
                    'class' => ''.$class[1],
                ]).($statusModel ? $statusModel->status : ''), // Text content
                [
                    'class' => 'fw-semibold m-0 text-capitalize status-badge d-flex align-items-center gap-1 '.$class[0],
                ]);
            echo $p; ?>
        </div>
    </div>

	<div>
        <?php if ($model->Status === null || $model->Status === 7) : ?>
            <?= Html::a(
                '<i class="ti ti-refresh"></i> Update your Info',
                ['update', 'ID' => $model->ID],
                [
                    'class' => 'btn btn-danger mb-0',
                    'title' => 'Update your Info', // Tooltip for the link
                ]
            ); ?>

        <?php endif; ?>
        <?php if ($model->Status === 45) : ?>
			<div class="mt-3 px-4 d-flex flex-row gap-2">
				<a class="update-button btn btn-outline-dark d-flex align-items-center px-3" id="upload" data-toggle="modal" title="View" data-target="#form-upload">
					<i class="ti ti-upload me-0 me-md-1 fs-4"></i>
					<span class="d-none d-md-block font-weight-medium fs-3">Upload Required Files</span>
				</a>

			</div>
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
						<h4 class = "fw-semibold m-0 ">Personal Info</h4>
					</strong>
				</div>
				<div class = "row">
					<div class = "col-md-6">
						<p class = "mb-2 fw-light mb-1"><strong>Name: </strong> <?= $model->Name ?></p>
						<p class = "mb-2 fw-light mb-1">
							<strong>Gender: </strong> <?= getGenderMeaning($model->Gender) ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Citizenship: </strong> <?= $model->Citizenship ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Marital Status: </strong> <?= $model->Relation_ship ?>
						</p>
						<p class = "mb-2 fw-light mb-1"><strong>Religion: </strong> <?= $model->Religion ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Mazhab: </strong> <?= $model->Mazhab ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Postcode: </strong> <?= $model->Postcode ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Country: </strong> <?= getCountry($model->Country); ?>
						</p>
					</div>
					<div class = "col-md-6">
						<p class = "mb-2 fw-light mb-1"><strong>Country of
						                                        Origin: </strong> <?= getCountry($model->Country_of_origin) ?>
						</p>
						<p class = "mb-2 fw-light mb-1"><strong>Country of
						                                        Residence: </strong> <?= getCountry($model->Country_of_residence) ?>
						</p>
						<p class = "mb-2 fw-light mb-1"><strong>Date of Birth: </strong> <?= $model->Date_of_Birth ?>
						</p>
						<p class = "mb-2 fw-light mb-1"><strong>Passport
						                                        Number: </strong> <?= $model->Passport_Number ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Passport
						                                        Expiration: </strong> <?= $model->Passport_Expiration ?>
						</p>
						<p class = "mb-2 fw-light mb-1"><strong>Mobile Number:</strong> <?= $model->Mobile_Number ?></p>


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
						                                        Education: </strong> <?= $model->Academic_lvl_edu ?></p>
                        <?php if($model->Academic_lvl_edu === "Diploma" || $model->Academic_lvl_edu === "Degree"):?>
						<p class = "mb-2 fw-light mb-1">
							<strong>Programme: </strong> <?= $model->Academic_name_of_programme ?></p>
                        <?php endif;?>
						<p class = "mb-2 fw-light mb-1"><strong>Current
						                                        Semester: </strong> <?= $model->Academic_current_semester ?>
						</p>
						<p class = "mb-2 fw-light mb-1"><strong>Current
						                                        Year: </strong> <?= $model->Academic_current_year ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Name of
						                                        Faculty: </strong> <?= $model->Academic_name_of_faculty ?>
						</p>
						<p class = "mb-2 fw-light mb-1"><strong>Current
						                                        Result: </strong> <?= $model->Academic_current_result ?>
						</p>
                        <?php if($model->Academic_lvl_edu === "Master" || $model->Academic_lvl_edu === "PhD"):?>
							<p class = "mb-2 fw-light mb-1"><strong>Research Title: </strong> <?= $model->Research_title ?></p>
                        <?php endif;?>
						<p class = "mb-2 fw-light mb-1"><strong>University have MOU/MOA with
						                                        IIUM: </strong> <?= getAnswer($model->Mou_or_Moa) ?></p>
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
                        <?php if($model->Propose_type_of_programme === "Other"):?>
							<p class = "mb-2 fw-light mb-1"><strong>Type of Programme
							                                        (Other): </strong> <?= $model->Propose_type_of_programme_other ?>
							</p>
                        <?php endif;?>
						<p class = "mb-2 fw-light mb-1"><strong>Type of
						                                        Mobility: </strong> <?= getMobilityType($model->Propose_type_of_mobility) ?>
						</p>
						<p class = "mb-2 fw-light mb-1"><strong>Kulliyyah
						                                        Applied: </strong> <?= $model->Propose_kulliyyah_applied ?>
						</p>
						<p class = "mb-2 fw-light mb-1">
							<strong>Duration of Study:</strong></p>
						<div class = "d-flex gap-3 ">
							<p class = "mb-2 fw-light mb-1">
								<strong>From: </strong> <?= $model->Propose_duration_start ?></p>
							<p class = "mb-2 fw-light mb-1"><strong>Until: </strong> <?= $model->Propose_duration_end ?>
							</p>
						</div>
						<p class = "mb-2 fw-light mb-1"><strong>Avability for Credit
						                                        Transfer: </strong> <?= getAnswer($model->Propose_transfer_credit_hours) ?>
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class = "row">
			<div class = "col  d-flex flex-column">
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
                            <?= DownloadLinkWidget::widget([
                                'model' => $model, 'attribute' => 'Recommendation_letter', 'fileName' => 'RecommendationLetter',
                                'text' => 'Recommendation Letter'
                            ]) ?>
						</div>
					</div>
				</div>
			</div>
			<div class = "col">
				<div class = "card shadow-none border bg-light-gray">
					<div class = "card-body">
						<div class = "row">
							<div class = "d-flex align-items-center header-info gap-1 mb-3">
								<i class = "ti ti-file text-dark"></i>
								<strong>
									<h4 class = "fw-semibold m-0">Files</h4>
								</strong>
							</div>
                            <?= DownloadLinkWidget::widget([
                                'model' => $model, 'attribute' => 'Passport', 'fileName' => 'Passport',
                                'text' => 'Passport'
                            ]) ?>
                            <?= DownloadLinkWidget::widget([
                                'model' => $model, 'attribute' => 'Latest_passport_photo',
                                'fileName' => 'LatestPassportPhoto', 'text' => 'Latest Passport Photo'
                            ]) ?>
                            <?= DownloadLinkWidget::widget([
                                'model' => $model, 'attribute' => 'Latest_certified_academic_transcript',
                                'fileName' => 'LatestCertifiedAcademicTranscript',
                                'text' => 'Latest Certified Academic Transcript'
                            ]) ?>
                            <?= DownloadLinkWidget::widget([
                                'model' => $model, 'attribute' => 'Confirmation_letter',
                                'fileName' => 'ConfirmationLetter', 'text' => 'Confirmation Letter'
                            ]) ?>
                            <?= DownloadLinkWidget::widget([
                                'model' => $model, 'attribute' => 'Sponsorship_letter',
                                'fileName' => 'SponsorshipLetter', 'text' => 'Sponsorship Letter'
                            ]) ?>
                            <?= DownloadLinkWidget::widget([
                                'model' => $model, 'attribute' => 'offer_letter', 'fileName' => 'offerLetter',
                                'text' => 'Offer Letter'
                            ]) ?>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class = "row">

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
				<p class = "mb-2 fw-light mb-1"><strong>Phone Number: </strong> <?= $model->Emergency_email ?></p>
				<p class = "mb-2 fw-light mb-1"><strong>Home Address: </strong> <?= $model->Emergency_homeAddress ?></p>
				<p class = "mb-2 fw-light mb-1"><strong>Post Code: </strong> <?= $model->Emergency_postCode ?></p>
				<p class = "mb-2 fw-light mb-1"><strong>Country:</strong> <?= getCountry($model->Emergency_country) ?>
				</p>
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
				<p class = "mb-2 fw-light mb-1"><strong>Campus Location: </strong> <?= $model->campus_location ?></p>
                <?php if($model->campus_location !== "Off Campus"):?>

					<p class="mb-2 fw-light mb-1"><strong>Room Type: </strong> <?= $model->Room_type?></p>
                <?php endif;?>
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
				<p class = "mb-2 fw-light mb-1"><strong>Result: </strong> <?= $model->English_test_name ?></p>
                <?= DownloadLinkWidget::widget([
                    'model' => $model, 'attribute' => 'English_certificate', 'fileName' => 'EnglishCertificate',
                    'text' => 'English Certificate'
                ]) ?>
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
				<div class = "col border-end">
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


<div class = "modal fade" id = "form-upload" tabindex = "-1" role = "dialog">
	<div class = "modal-dialog modal-dialog-centered" role = "document">
		<div class = "modal-content border-0">
			<div class = "modal-header bg-dark">
				<h6 id = "form-upload-header" class = "text-white mb-0"></h6>

				<button type = "button" class = "btn-close btn-close-white" data-bs-dismiss = "modal"
				        aria-label = "Close"></button>
			</div>
			<div class = "modal-body">
				<div class = "form-box">
					<div class = "form-content">
                        <?php $form = ActiveForm::begin([
                            'options' => ['enctype' => 'multipart/form-data'],
                            'action' => ['inbound/upload', 'ID' => $model->ID], // Pass the ID to the action
                        ]); ?>
                        <?= Html::hiddenInput('ID', $model->ID) ?>
						<div class = "row d-flex align-items-center justify-content-center">
							<div class = "col-md-6">
								<div class = "mb-3">
							
								</div>
							</div>
							<div class = "col-md-6">
								<div class = "mb-3">

                                        <?= $form->field($model, 'proof_of_payment', [
                                            'template' => "{input}\n{label}\n{error}",
                                        ])->fileInput([
                                            'class' => 'form-control',
                                            'id' => 'proof_of_payment',
                                        ]) ?>

								</div>
							</div>
						</div>
						<div class = "form-group mt-2">
							<div class = "form-group">
                                <?= Html::submitButton('', [
                                    'class' => 'btn btn-outline-dark px-4 py-2', 'name' => 'save-button',
                                    'id' => 'form-upload-button'
                                ]) ?>
							</div>
						</div>

                        <?php ActiveForm::end(); ?>
					</div>
				</div>
			</div>
            <?php endif; ?>
		</div>
	</div>
</div>

