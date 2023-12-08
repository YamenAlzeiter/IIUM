	<?php
use common\models\Poc;
use common\models\Status;
use Psy\Util\Json;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\web\YiiAsset;

/** @var yii\web\View $this */
/** @var common\models\Inbound $model */
/** @var common\models\Poc $modelPoc1 */

require Yii::getAlias('@common').'/Helpers/helper.php';


?>
<div class = "mb-3">
	<h1 class = "text-capitalize text-start m-0"><?= $model->Name ?></h1>
	<div class = "d-flex gap-1 align-items-center">
        <?php
        $statusModel = Status::findOne(['ID' => $model->Status]);
        $iconClass = getStatusIconClass($model->Status); // Implement your own logic to get the icon class based on status

        echo Html::tag('i', '', [
            'class' => 'ti ti-circle '.$iconClass,
        ]);
        ?>
		<p class = "fw-light mb-0 align-items-end">
            <?= Html::tag('span',
                ($statusModel = Status::findOne(['ID' => $model->Status])) ? $statusModel->description : '', [
                    'class' => 'rounded-3 fw-semibold m-0', 'id' => 'status-badge',
                ]) ?>
		</p>
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
						<p class = "mb-2 fw-light mb-1"><strong>Citizenship: </strong> <?= $model->Citizenship ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Gender: </strong> <?= getGenderMeaning($model->Gender) ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Status: </strong> <?= $model->Relation_ship ?></p>
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
						<p class = "mb-2 fw-light mb-1"><strong>Level Of Education: </strong> <?= $model->Academic_lvl_edu ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Home University: </strong> <?= $model->Academic_home_university ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Name of Faculty: </strong> <?= $model->Academic_name_of_faculty ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Current Semester: </strong> <?= $model->Academic_current_semester ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Programme: </strong> <?= $model->Academic_name_of_programme ?></p>
						<p class = "mb-2 fw-light mb-1"><strong>Result: </strong> <?= $model->Academic_current_result ?></p>
					</div>
				</div>
			</div>
<!--			<div class="col-lg-6">-->
<!--				<div class = "card shadow-none border bg-light-pink">-->
<!--					<div class = "card-body">-->
<!--						<div class = "d-flex align-items-center header-info gap-1 mb-3">-->
<!--							<i class = "ti ti-map-pins text-dark"></i>-->
<!--							<strong>-->
<!--								<h4 class = "fw-semibold m-0">Mobility Program Info</h4>-->
<!--							</strong>-->
<!--						</div>-->
<!--						<p class = "mb-2 fw-light mb-1"><strong>Mobility Type: </strong> --><?php //= $model->Type_mobility ?><!--</p>-->
<!--						<p class = "mb-2 fw-light mb-1"><strong>Programme Type: </strong> --><?php //= $model->Type_mobility_program ?><!--</p>-->
<!--						<p class = "mb-2 fw-light mb-1"><strong>Programme Type-->
<!--						                                        (Other): </strong> --><?php //= $model->Type_mobility_program_other ?>
<!--						</p>-->
<!--						<p class = "mb-2 fw-light mb-1"><strong>Host University Name: </strong> --><?php //= $model->Host_university_name ?><!--</p>-->
<!--						<p class = "mb-2 fw-light mb-1"><strong>Duration:</strong></p>-->
<!--						<div class = "d-flex gap-3 ">-->
<!--							<p class = "mb-2 fw-light mb-1"><strong>From: </strong> --><?php //= $model->Mobility_from ?><!--</p>-->
<!--							<p class = "mb-2 fw-light mb-1"><strong>Until: </strong> --><?php //= $model->Mobility_until ?><!--</p>-->
<!--						</div>-->
<!--						<p class = "mb-2 fw-light mb-1"><strong>Host University-->
<!--						                                        Country: </strong> --><?php //= $model->Country_host_university ?>
<!--						</p>-->
<!--						<p class = "mb-2 fw-light mb-1"><strong>Avability for Credit-->
<!--						                                        Transfer: </strong> --><?php //= $model->credit_transfer_availability ?>
<!--						</p>-->
<!--					</div>-->
<!--				</div>-->
<!--			</div>-->
<!--		</div>-->
<!--		<div class="row">-->
<!--			<div class="col">-->
<!--				<div class="card shadow-none border">-->
<!--					<div class="card-body">-->
<!--						<div class="row">-->
<!--							<div class = "d-flex align-items-center header-info gap-1 mb-3">-->
<!--								<i class = "ti ti-user-check text-dark"></i>-->
<!--								<strong>-->
<!--									<h4 class = "fw-semibold m-0">Host Person Info</h4>-->
<!--								</strong>-->
<!--							</div>-->
<!--							<div class="col-lg-6">-->
<!--								<p class = "mb-2 fw-light mb-1"><strong>Name: </strong> --><?php //= $model->Connect_host_name ?><!--</p>-->
<!--								<p class = "mb-2 fw-light mb-1"><strong>Position: </strong> --><?php //= $model->Connect_host_position ?><!--</p>-->
<!--								<p class = "mb-2 fw-light mb-1"><strong>Mobile Number: </strong> --><?php //= $model->Connect_host_mobile_number ?><!--</p>-->
<!--								<p class = "mb-2 fw-light mb-1"><strong>Email Address: </strong> --><?php //= $model->Connect_host_email ?><!--</p>-->
<!--							</div>-->
<!--							<div class="col-lg-6">-->
<!--								<p class = "mb-2 fw-light mb-1"><strong>Post Code:</strong> --><?php //= $model->Connect_host_postcode ?><!--</p>-->
<!--								<p class = "mb-2 fw-light mb-1"><strong>Country:</strong> --><?php //= $model->Connect_host_country ?><!--</p>-->
<!--								<p class = "mb-2 fw-light mb-1"><strong>Address:</strong> --><?php //= $model->Connect_host_address ?><!--</p>-->
<!--							</div>-->
<!--						</div>-->
<!--					</div>-->
<!--				</div>-->
<!--			</div>-->
<!--		</div>-->
<!--		<div class="row">-->
<!--			<div class="col">-->
<!--				<div class="card shadow-none border bg-light-gray">-->
<!--					<div class="card-body">-->
<!--						<div class="row">-->
<!--							<div class = "d-flex align-items-center header-info gap-1 mb-3">-->
<!--								<i class = "ti ti-file text-dark"></i>-->
<!--								<strong>-->
<!--									<h4 class = "fw-semibold m-0">Files</h4>-->
<!--								</strong>-->
<!--							</div>-->
<!--							<div class = "col-md-6">-->
<!--								<P><strong>Offer Letter: </strong>-->
<!--                                    --><?php //= ($model->Offer_letter) ? Html::a('OfferLetter'.'_'.$model->Name.'_'.$model->ID.'.'.pathinfo($model->Offer_letter,
//                                            PATHINFO_EXTENSION), [
//                                        'download', 'id' => $model->ID,
//                                        'file' => 'OfferLetter'.'_'.$model->Name.'_'.$model->ID.'.'.pathinfo($model->Offer_letter,
//                                                PATHINFO_EXTENSION)
//                                    ]) : ''; ?>
<!--								</P>-->
<!--								<P><strong>Academic Transcript: </strong>-->
<!--                                    --><?php //= ($model->Academic_transcript) ? Html::a('AcademicTranscript'.'_'.$model->Name.'_'.$model->ID.'.'.pathinfo($model->Academic_transcript,
//                                            PATHINFO_EXTENSION), [
//                                        'download', 'id' => $model->ID,
//                                        'file' => 'AcademicTranscript'.'_'.$model->Name.'_'.$model->ID.'.'.pathinfo($model->Academic_transcript,
//                                                PATHINFO_EXTENSION)
//                                    ]) : ''; ?>
<!--								</P>-->
<!--								<P><strong>Programme Brochure: </strong>-->
<!--                                    --><?php //= ($model->Program_brochure) ? Html::a('ProgramBrochure'.'_'.$model->Name.'_'.$model->ID.'.'.pathinfo($model->Program_brochure,
//                                            PATHINFO_EXTENSION), [
//                                        'download', 'id' => $model->ID,
//                                        'file' => 'ProgramBrochure'.'_'.$model->Name.'_'.$model->ID.'.'.pathinfo($model->Program_brochure,
//                                                PATHINFO_EXTENSION)
//                                    ]) : ''; ?>
<!--								</P>-->
<!--								<P><strong>Latest Pay Slip: </strong>-->
<!--                                    --><?php //= ($model->Latest_pay_slip) ? Html::a('LatestPaySlip'.'_'.$model->Name.'_'.$model->ID.'.'.pathinfo($model->Latest_pay_slip,
//                                            PATHINFO_EXTENSION), [
//                                        'download', 'id' => $model->ID,
//                                        'file' => 'LatestPaySlip'.'_'.$model->Name.'_'.$model->ID.'.'.pathinfo($model->Latest_pay_slip,
//                                                PATHINFO_EXTENSION)
//                                    ]) : ''; ?>
<!--								</P>-->
<!--								<P><strong>Other Latest Pay Slip: </strong>-->
<!--                                    --><?php //= ($model->Other_latest_pay_slip) ? Html::a('OtherLatestPaySlip'.'_'.$model->Name.'_'.$model->ID.'.'.pathinfo($model->Other_latest_pay_slip,
//                                            PATHINFO_EXTENSION), [
//                                        'download', 'id' => $model->ID,
//                                        'file' => 'OtherLatestPaySlip'.'_'.$model->Name.'_'.$model->ID.'.'.pathinfo($model->Other_latest_pay_slip,
//                                                PATHINFO_EXTENSION)
//                                    ]) : ''; ?>
<!--								</P>-->
<!--							</div>-->
<!--                            --><?php //if ($model->Status >= 41): ?>
<!--								<div class = "col-md-6">-->
<!--									<P><strong>Proof of sponsorship/ funding/ grant (Official Letter)</strong>-->
<!--                                        --><?php //= ($model->Proof_of_sponsorship) ? Html::a('ProofOfSponsorship'.'_'.$model->ID.'.'.pathinfo($model->Proof_of_sponsorship,
//                                                PATHINFO_EXTENSION), [
//                                            'download', 'id' => $model->ID,
//                                            'file' => 'ProofOfSponsorship'.'_'.$model->ID.'.'.pathinfo($model->Proof_of_sponsorship,
//                                                    PATHINFO_EXTENSION)
//                                        ]) : ''; ?>
<!--									</P>-->
<!--									<P><strong>Other Latest Pay Slip: </strong>-->
<!--                                        --><?php //= ($model->Other_latest_pay_slip) ? Html::a('ProofInsuranceCover'.'_'.$model->ID.'.'.pathinfo($model->Other_latest_pay_slip,
//                                                PATHINFO_EXTENSION), [
//                                            'download', 'id' => $model->ID,
//                                            'file' => 'ProofInsuranceCover'.'_'.$model->ID.'.'.pathinfo($model->Other_latest_pay_slip,
//                                                    PATHINFO_EXTENSION)
//                                        ]) : ''; ?>
<!--									</P>-->
<!--									<P><strong>Other Latest Pay Slip: </strong>-->
<!--                                        --><?php //= ($model->Letter_of_indemnity) ? Html::a('LetterOfIndemnity'.'_'.$model->ID.'.'.pathinfo($model->Letter_of_indemnity,
//                                                PATHINFO_EXTENSION), [
//                                            'download', 'id' => $model->ID,
//                                            'file' => 'LetterOfIndemnity'.'_'.$model->ID.'.'.pathinfo($model->Letter_of_indemnity,
//                                                    PATHINFO_EXTENSION)
//                                        ]) : ''; ?>
<!--									</P>-->
<!--									<P><strong>Other Latest Pay Slip: </strong>-->
<!--                                        --><?php //= ($model->Flight_ticket) ? Html::a('FlightTicket'.'_'.$model->ID.'.'.pathinfo($model->Flight_ticket,
//                                                PATHINFO_EXTENSION), [
//                                            'download', 'id' => $model->ID,
//                                            'file' => 'FlightTicket'.'_'.$model->ID.'.'.pathinfo($model->Flight_ticket, PATHINFO_EXTENSION)
//                                        ]) : ''; ?>
<!--									</P>-->
<!--								</div>-->
<!--                            --><?php //endif; ?>
<!--						</div>-->
<!--					</div>-->
<!--				</div>-->
<!--			</div>-->
<!--		</div>-->
<!--	</div>-->
<!--	<div class = "col-lg-4">-->
<!--		<div class = "card shadow-none border bg-light-secondary">-->
<!--			<div class = "card-body">-->
<!--				<div class = "d-flex align-items-center header-info gap-1 mb-3">-->
<!--					<i class = "ti ti-report-medical text-dark"></i>-->
<!--					<strong>-->
<!--						<h4 class = "fw-semibold m-0">Emergency Information</h4>-->
<!--					</strong>-->
<!--				</div>-->
<!--				<p class = "mb-2 fw-light mb-1"><strong>Name: </strong> --><?php //= $model->Emergency_name ?><!--</p>-->
<!--				<p class = "mb-2 fw-light mb-1"><strong>RelationShip: </strong> --><?php //= $model->Emergency_relationship ?><!--</p>-->
<!--				<p class = "mb-2 fw-light mb-1"><strong>Phone Number: </strong> --><?php //= $model->Emergency_phoneNumber ?><!--</p>-->
<!--				<p class = "mb-2 fw-light mb-1"><strong>Post Code: </strong> --><?php //= $model->Emergency_postCode ?><!--</p>-->
<!--				<p class = "mb-2 fw-light mb-1"><strong>State: </strong> --><?php //= $model->Emergency_tate ?><!--</p>-->
<!--				<p class = "mb-2 fw-light mb-1"><strong>Country:</strong> --><?php //= $model->Emergency_country ?><!--</p>-->
<!--				<p class = "mb-2 fw-light mb-1"><strong>Home Address: </strong> --><?php //= $model->Emergency_homeAddress ?><!--</p>-->
<!--			</div>-->
<!--		</div>-->
<!--		<div class = "card shadow-none border bg-light-warning">-->
<!--			<div class = "card-body">-->
<!--				<div class = "d-flex align-items-center header-info gap-1 mb-3">-->
<!--					<i class = "ti ti-report-money text-dark"></i>-->
<!--					<strong>-->
<!--						<h4 class = "fw-semibold m-0">Financial Information</h4>-->
<!--					</strong>-->
<!--				</div>-->
<!--				<!--		<p class = "mb-2 fw-light mb-1"><strong>Funded:</strong> -->-->
<!--                --><?php ////= $model->academic_accept ?><!--<!--</p>-->-->
<!--				<p class = "mb-2 fw-light mb-1"><strong>Name of Sponsoring Body:</strong> --><?php //= $model->Sponsoring_name ?>
<!--				</p>-->
<!--				<p class = "mb-2 fw-light mb-1"><strong>Other (sponser):</strong> --><?php //= $model->Sponsoring_name_other ?>
<!--				</p>-->
<!--				<p class = "mb-2 fw-light mb-1"><strong>Funding:</strong> --><?php //= $model->Sponsoring_funding ?><!--</p>-->
<!--			</div>-->
<!--		</div>-->
<!--		<div class = "card shadow-none border bg-light-danger">-->
<!--			<div class = "card-body">-->
<!--				<div class = "d-flex align-items-center header-info gap-1 mb-3">-->
<!--					<i class = "ti ti-language text-dark"></i>-->
<!--					<strong>-->
<!--						<h4 class = "fw-semibold m-0">English Proficiency</h4>-->
<!--					</strong>-->
<!--				</div>-->
<!--				<p class = "mb-2 fw-light mb-1"><strong>English-->
<!--				                                        Proficiency: </strong> --><?php //= $model->English_language_proficiency ?>
<!--				</p>-->
<!--				<p class = "mb-2 fw-light mb-1"><strong>Result: </strong> --><?php //= $model->English_result ?><!--</p>-->
<!--				<p class = "mb-2 fw-light mb-1"><strong>Third Language: </strong> --><?php //= $model->Third_language ?><!--</p>-->
<!--			</div>-->
<!--		</div>-->
<!--		<div class="card shadow-none border bg-light-primary">-->
<!--			<div class="card-body">-->
<!--				<div class = "mb-3">-->
<!--					<h4 class = "fw-semibold m-0">Person in charge</h4>-->
<!--				</div>-->
<!--                --><?php //if ($modelPoc1): ?>
<!--					<p class="mb-2 fw-light mb-1"><strong>name: </strong> --><?php //= $modelPoc1->name ?><!--</p>-->
<!--					<p class="mb-2 fw-light mb-1"><strong>kulliyyah: </strong> --><?php //= $modelPoc1->kulliah ?><!--</p>-->
<!--					<p class="mb-2 fw-light mb-1"><strong>Email: </strong> <a href="mailto:--><?php //= $modelPoc1->email ?><!--">--><?php //= $modelPoc1->email ?><!--</a></p>-->
<!--                    --><?php //if ($model->Note_hod):?>
<!--						<div class = "mt-3 mb-2">-->
<!--							<h5 class = "fw-semibold m-0">Reason of Rejection</h5>-->
<!--						</div>-->
<!--						<p class = "mb-2 fw-light mb-1"><strong>--><?php //= $model->Note_hod ?><!--</strong></p>-->
<!--                    --><?php //endif;?>
<!--                --><?php //else: ?>
<!--					<p>Person in charge not set yet.</p>-->
<!--                --><?php //endif; ?>
<!--			</div>-->
<!--		</div>-->
<!--		<div class="card shadow-none border bg-light-info">-->
<!--			<div class="card-body">-->
<!--				<div class = "mb-3">-->
<!--					<h4 class = "fw-semibold m-0">Dean</h4>-->
<!--				</div>-->
<!--                --><?php //if ($modelPoc2): ?>
<!--					<p class="mb-2 fw-light mb-1"><strong>name: </strong> --><?php //= $modelPoc2->name ?><!--</p>-->
<!--					<p class="mb-2 fw-light mb-1"><strong>kulliyyah: </strong> --><?php //= $modelPoc2->kulliah ?><!--</p>-->
<!--					<p class="mb-2 fw-light mb-1"><strong>Email: </strong> <a href="mailto:--><?php //= $modelPoc2->email ?><!--">--><?php //= $modelPoc2->email ?><!--</a></p>-->
<!--                    --><?php //if ($model->Note_dean):?>
<!--						<div class = "mt-3 mb-2">-->
<!--							<h5 class = "fw-semibold m-0">Reason of Rejection</h5>-->
<!--						</div>-->
<!--						<p class = "mb-2 fw-light mb-1"><strong>--><?php //= $model->Note_dean ?><!--</strong></p>-->
<!--                    --><?php //endif;?>
<!--                --><?php //else: ?>
<!--					<p>Dean not set yet.</p>-->
<!--                --><?php //endif; ?>
<!--			</div>-->
<!--		</div>-->
<!--	</div>-->
<!--</div>-->
<!--<div class="card shadow-none border ">-->
<!--	<div class="card-body">-->
<!--		<div class = "d-flex align-items-center header-info gap-1 mb-3">-->
<!--			<i class = "ti ti-books text-dark"></i>-->
<!--            --><?php //if ($model->Academic_lvl_edu !== 'PG') : ?>
<!--				<strong>-->
<!--					<h4 class = "fw-semibold m-0">Course Information</h4>-->
<!--				</strong>-->
<!--            --><?php //else: ?>
<!--				<strong>-->
<!--					<h4 class = "fw-semibold m-0">Research Information</h4>-->
<!--				</strong>-->
<!--            --><?php //endif; ?>
<!--		</div>-->
<!--        --><?php //if ($model->Academic_lvl_edu !== 'PG') : ?>
<!--			<div class = "row">-->
<!--				<div class = "col-md-6 border-end">-->
<!--					<h4 class = "font-monospace text-center mb-4">Courses offered by the Host University</h4>-->
<!--					<table class = "table table-hover table-light">-->
<!--						<!-- Table headers -->-->
<!--						<thead>-->
<!--						<tr>-->
<!--							<th style = "width: 30%" class = "text-center font-monospace">Course Code</th>-->
<!--							<th style = "width: 40%" class = "text-center font-monospace">Course Name</th>-->
<!--							<th style = "width: 30%" class = "text-center font-monospace">Credit Hours</th>-->
<!--						</tr>-->
<!--						</thead>-->
<!--						<tbody>-->
<!--                        --><?php //foreach ($courses as $course) : ?>
<!--							<tr>-->
<!--								<td class = "text-center py-2 px-1">--><?php //= $course->course_code ?><!--</td>-->
<!--								<td class = "text-center py-2 px-1">--><?php //= $course->course_name ?><!--</td>-->
<!--								<td class = "text-center py-2 px-1">--><?php //= $course->credit_hours ?><!--</td>-->
<!--							</tr>-->
<!--                        --><?php //endforeach; ?>
<!--						</tbody>-->
<!--					</table>-->
<!--				</div>-->
<!--				<div class = "col-md-6">-->
<!--					<h4 class = "font-monospace text-center mb-4">IIUM Courses</h4>-->
<!--					<table class = "table table-hover table-light">-->
<!--						<!-- Table headers -->-->
<!--						<thead>-->
<!--						<tr>-->
<!--							<th style = "width: 30%" class = "text-center font-monospace">Course Code</th>-->
<!--							<th style = "width: 40%" class = "text-center font-monospace">Course Name</th>-->
<!--							<th style = "width: 30%" class = "text-center font-monospace">Credit Hours</th>-->
<!--						</tr>-->
<!--						</thead>-->
<!--						<tbody>-->
<!--                        --><?php //foreach ($iiumcourses as $iiumcourse) : ?>
<!--							<tr>-->
<!--								<td class = "text-center py-2 px-1">--><?php //= $iiumcourse->course_code ?><!--</td>-->
<!--								<td class = "text-center py-2 px-1">--><?php //= $iiumcourse->course_name ?><!--</td>-->
<!--								<td class = "text-center py-2 px-1">--><?php //= $iiumcourse->credit_hours ?><!--</td>-->
<!--							</tr>-->
<!--                        --><?php //endforeach; ?>
<!--						</tbody>-->
<!--					</table>-->
<!--				</div>-->
<!--			</div>-->
<!--			<div>-->
<!--			</div>-->
<!--        --><?php //else: ?>
<!--			<div>-->
<!--				<p class = "mb-2 fw-light mb-1 text-dark"><strong>Academic Research:</strong> --><?php //= $model->Research ?><!--</p>-->
<!--			</div>-->
<!--        --><?php //endif; ?>
<!--	</div>-->
<!--</div>-->
<!--<div class = "d-flex flex-row justify-content-center mt-5 gap-2 ">-->
<!--    --><?php //= Html::
//    a('<button type="button" class="btn btn-outline-dark">
//                                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
//                                      <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
//                                  </svg>back</button>', Yii::$app->request->referrer) ?>
<!--    --><?php //= Html::a('Action', ['action', 'ID' => $model->ID], ['class' => 'btn btn-secondary']) ?>
<!--    --><?php //if (Yii::$app->user->can('superAdmin')): ?>
<!--        --><?php //= Html::a('Delete', ['delete', 'ID' => $model->ID], [
//            'class' => 'btn btn-danger', 'data' => [
//                'confirm' => 'Are you sure you want to delete this item?', 'method' => 'post',
//            ],
//        ]) ?>
<!--        --><?php //= Html::button('Update', [
//            'class' => 'btn btn-primary',
//            'onclick' => 'location.href='.Json::encode(Url::to(['update', 'ID' => $model->ID])),
//        ]) ?>
<!--    --><?php //endif; ?>
<!--</div>-->
