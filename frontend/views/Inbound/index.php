<?php

use common\models\Inbound;
use common\models\Status;
use Psy\Util\Json;
use yii\bootstrap5\LinkPager;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;
/** @var common\models\Inbound $model */
/** @var common\models\Courses $courses */
/** @var yii\web\View $this */
/** @var backend\views\Inbound\inboundSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

require Yii::getAlias('@common').'/Helpers/helper.php';

if (!isset($noRecord)) {
    $creationYearLastTwoDigits = date('y', strtotime($model->created_at));

    $fileName = $creationYearLastTwoDigits . '_' . $model->ID;
}

?>

<?php if (isset($noRecord) && $noRecord === true) : ?>
	<div class="alert alert-warning d-flex justify-content-center align-items-center gap-1">
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
                        ($statusModel = Status::findOne(['ID' => $model->Status])) ? $statusModel->description : '',
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
            <?php if ($model->Status === 41) : ?>
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
						<h4 class = "fw-semibold m-0">Personal Info</h4>
					</strong>
				</div>
				<div class = "row">
					<div class = "col-md-6">
						<p class = "mb-2 fw-light mb-1"><strong>Name: </strong> <?= $model->Name ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Gender: </strong> <?= getGenderMeaning($model->Gender) ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Citizenship: </strong> <?= $model->Citizenship ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Marital Status: </strong> <?= $model->Relation_ship ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Religion: </strong> <?= $model->Religion ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Mazhab: </strong> <?= $model->Mazhab ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Postcode: </strong> <?= $model->Postcode ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Country: </strong> <?= $model->Country ?></p>
					</div>
					<div class = "col-md-6">
						<p class = "mb-2 fw-light mb-1"><strong>Country of Origin: </strong> <?= $model->Country_of_origin ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Country of Residence: </strong> <?= $model->Country_of_residence ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Date of Birth: </strong> <?= $model->Date_of_Birth ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Passport Number: </strong> <?= $model->Passport_Number ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Passport Expiration: </strong> <?= $model->Passport_Expiration ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Mobile Number:</strong> <?= $model->Mobile_Number ?></p>



					</div>
				</div>
				<ul class = "list-unstyled mt-2">
					<li class = "d-flex align-items-center gap-3 mb-2">
						<i class = "ti ti-mail text-dark fs-6"></i>
						<h6 class = "fs-4 fw-semibold mb-0">Email Address: <a href = "mailto:<?= $model->Email_address?>"><?= $model->Email_address ?></a></h6>
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
						<p class = "mb-2 fw-light mb-1"><strong>Home University: </strong> <?= $model->Academic_home_university ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Level Of Education: </strong> <?= $model->Academic_lvl_edu ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Programme: </strong> <?= $model->Academic_name_of_programme ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Current Semester: </strong> <?= $model->Academic_current_semester ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Current Year: </strong> <?= $model->Academic_current_year ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Name of Faculty: </strong> <?= $model->Academic_name_of_faculty ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Current Result: </strong> <?= $model->Academic_current_result ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Research Title: </strong> <?= $model->Research_title ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>University have MOU/MOA with IIUM: </strong> <?= $model->Mou_or_Moa ?></p>
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
						<p class = "mb-2 fw-light mb-1"><strong>Type of Programme: </strong> <?= $model->Propose_type_of_programme ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Type of Programme (Other): </strong> <?= $model->Propose_type_of_programme_other ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Type of Mobility: </strong> <?= $model->Propose_type_of_mobility ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Kulliyyah Applied: </strong> <?= $model->Propose_kulliyyah_applied ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Duration:</strong><?= $model->Propose_duration_of_study ?></p>
						<div class = "d-flex gap-3 ">
							<p class = "mb-2 fw-light mb-1"><strong>From: </strong> <?= $model->Propose_duration_start ?></p>
							<p class = "mb-2 fw-light mb-1"><strong>Until: </strong> <?= $model->Propose_duration_end ?></p>
						</div>
						<p class = "mb-2 fw-light mb-1"><strong>Avability for Credit Transfer: </strong> <?= getAnswer($model->Propose_transfer_credit_hours) ?></p>
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

							<p class="fw-semibold"><?= ($model->Passport) ? Html::a('Offer Letter', [
                                    'download', 'id' => $model->ID, 'file' => $fileName . '_offerLetter' . '.pdf'
                                ]) : ''; ?></p>
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
				<p class = "mb-2 fw-light mb-1"><strong>Phone Number: </strong> <?= $model->Emergency_email ?></p>
				<p class = "mb-2 fw-light mb-1"><strong>Home Address: </strong> <?= $model->Emergency_homeAddress ?></p>
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
				<p class = "mb-2 fw-light mb-1"><strong>Accommodation on Campus: </strong> <?= $model->Financial_accommodation_on_campus ?></p>
				<p class = "mb-2 fw-light mb-1"><strong>Campus Location: </strong> <?= $model->campus_location ?></p>
				<p class = "mb-2 fw-light mb-1"><strong>Financial Funding for Fees and Living Expenses: </strong> <?= $model->Financial_funding ?></p>
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
				<p class = "mb-2 fw-light mb-1"><strong>English Proficiency: </strong> <?= getAnswer($model->English_native) ?></p>
				<p class = "mb-2 fw-light mb-1"><strong>Result: </strong> <?= $model->English_test_name ?></p><P><strong>English Certificate: </strong>
                    <?= ($model->English_certificate) ? Html::a('English_certificate'.'_'.$model->Name.'_'.$model->ID.'.'.pathinfo($model->English_certificate,
                            PATHINFO_EXTENSION), [
                        'download', 'id' => $model->ID,
                        'file' => 'English_certificate'.'_'.$model->Name.'_'.$model->ID.'.'.pathinfo($model->English_certificate,
                                PATHINFO_EXTENSION)
                    ]) : ''; ?>
				</P>
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
<?php endif; ?>