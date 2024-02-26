<?php


/** @var yii\web\View $this */

/** @var common\models\Inbound $model */


use common\models\Countries;
use yii\bootstrap5\ActiveForm;
use yii\bootstrap5\Html;
use yii\helpers\ArrayHelper;

$citizenship = Countries::find()->all();
$templateFileInput = '<div class="col align-items-center"><div class="col-md-2 col-form-label">{label}</div><div class="col-md">{input}</div>{error}</div>';
$templateRadio = '<legend class="col-form-label col-sm-6 pt-0">{label}</legend>{input}{error}';

require Yii::getAlias('@common').'/Helpers/helper.php';
?>
<?php $form = ActiveForm::begin([
    'enableClientValidation' => false, 'fieldConfig' => [
        'template' => "<div class='form-floating mb-3'>{input}{label}{error}</div>", 'labelOptions' => ['class' => ''],
    ],
]); ?>
<section id = "step-1" class = "form-step">
    <div class = "card w-100">
        <div class = "card-body">
            <div class = "container pt-2" style = "height: 80vh; overflow-y: auto;">
                <?= $form->field($model, 'Name')->textInput(['maxlength' => true, 'placeholder' => '']) ?>
                <div class = "row align-items-center">
                    <div class = "col-md">
                        <?= $form->field($model, 'Gender', ['template' => $templateRadio, 'labelOptions' => ['class' => 'form-label'],])->inline(true)->radioList(['M' => 'Male', 'F' => 'Female']) ?>
                        <?= $form->field($model, 'Relation_ship', ['template' => $templateRadio, 'labelOptions' => ['class' => 'form-label'],])->inline(true)->radioList(['Single' => 'Single', 'Married' => 'Married']) ?>
                    </div>
                    <div class = "col-md"><?= $form->field($model, 'Date_of_Birth')->textInput(['type' => 'date']) ?></div>
                </div>
                <div class = "row">
                    <div class = "col-md"><?= $form->field($model, 'Passport_Number')->textInput(['maxlength' => true, 'placeholder' => '']) ?></div>
                    <div class = "col-md"><?= $form->field($model, 'Passport_Expiration')->input('date') ?></div>
                </div>
                <div class = "row">
                    <div class = "col-md"><?= $form->field($model, 'Religion')->textInput(['maxlength' => true, 'placeholder' => '']) ?></div>
                    <div class = "col-md"><?= $form->field($model, 'Mazhab')->textInput(['maxlength' => true, 'placeholder' => '']) ?></div>
                </div>
                <div class = "row">
                    <div class = "col-md"><?= $form->field($model, 'Citizenship')->dropDownList(ArrayHelper::map(Countries::find()->all(), 'nationality', 'nationality'), ['prompt' => 'Select Nationality']) ?></div>
                    <div class = "col-md"><?= $form->field($model, 'Country_of_origin')->dropDownList(ArrayHelper::map(Countries::find()->all(), 'id', 'name'), ['prompt' => 'Select Country']) ?></div>
                    <div class = "col-md"><?= $form->field($model, 'Country_of_residence')->dropDownList(ArrayHelper::map(Countries::find()->all(), 'id', 'name'), ['prompt' => 'Select Country']) ?></div>
                </div>
                <div class = "row">
                    <div class = "col-md"><?= $form->field($model, 'Mobile_Number')->textInput(['maxlength' => true, 'placeholder' => '']) ?></div>
                    <div class = "col-md"><?= $form->field($model, 'Email_address')->textInput(['maxlength' => true, 'placeholder' => '']) ?></div>
                </div>
                <?= $form->field($model, 'Permanent_Address')->textarea(['maxlength' => true, 'placeholder' => '']) ?>
                <div class = "row">
                    <div class = "col-md"><?= $form->field($model, 'Country')->dropDownList(ArrayHelper::map(Countries::find()->all(), 'id', 'name'), ['prompt' => 'Select Country']) ?></div>
                    <div class = "col-md"><?= $form->field($model, 'Postcode')->textInput(['maxlength' => true, 'placeholder' => '']) ?></div>
                </div>
            </div>
            <div class = "d-flex justify-content-between">
                <?= Html::submitButton('Save', ['class' => 'btn btn-outline-dark btn-navigate-form-step btn-next fs-5']) ?>
                <div>
                    <button class = "btn btn-primary btn-navigate-form-step btn-next fs-5" type = "button" step_number = "2">Next Step</button>
                </div>
            </div>
        </div>
    </div>
</section>
<section id = "step-2" class = "form-step d-none">
    <div class = "card w-100">
        <div class = "card-body">
            <div class = "container pt-2" style = "height: 80vh; overflow-y: auto;">
                <div class = "col-md"><?= $form->field($model, 'Emergency_name')->textInput(['maxlength' => true, 'placeholder' => '']) ?></div>
                <div class = "row">
                    <div class = "col-md"><?= $form->field($model, 'Emergency_relationship')->textInput(['maxlength' => true, 'placeholder' => '']) ?></div>
                    <div class = "col-md"><?= $form->field($model, 'Emergency_phoneNumber')->textInput(['maxlength' => true, 'placeholder' => '']) ?></div>
                    <div class = "col-md"><?= $form->field($model, 'Emergency_email')->textInput(['maxlength' => true, 'placeholder' => '']) ?></div>
                </div>
                <div class = "row">
                    <div class = "col-md"><?= $form->field($model, 'Emergency_homeAddress')->textarea(['maxlength' => true, 'placeholder' => '']) ?></div>
                </div>
                <div class = "row">
                    <div class = "col-md"><?= $form->field($model, 'Emergency_postCode')->textInput(['maxlength' => true, 'placeholder' => '']) ?></div>
                    <div class = "col-md"><?= $form->field($model, 'Emergency_country')->dropDownList(ArrayHelper::map(Countries::find()->all(), 'id', 'name'), ['prompt' => 'Select Country']) ?></div>
                </div>
            </div>
            <div class = "d-flex justify-content-between">
                <?= Html::submitButton('Save', ['class' => 'btn btn-outline-dark btn-navigate-form-step btn-next fs-5']) ?>
                <!--                'name' => 'saveWithoutValidation', 'value' => 'validate'-->
                <div>
                    <button class = "btn btn-navigate-form-step btn-next fs-5" type = "button" step_number = "1">Back</button>
                    <button class = "btn btn-primary btn-navigate-form-step btn-next fs-5" type = "button" step_number = "3">Next Step</button>
                </div>
            </div>
        </div>
</section>
<section id = "step-3" class = "form-step d-none">
    <div class = "card w-100">
        <div class = "card-body">
            <div class = "container pt-2" style = "height: 80vh; overflow-y: auto;">
                <div class = "row">
                    <div class = "col-md"><?= $form->field($model, 'Academic_home_university')->textInput(['maxlength' => true, 'placeholder' => '']) ?></div>
                    <div class = "col-md"><?= $form->field($model, 'Academic_lvl_edu')->dropDownList(['Diploma' => 'Diploma', 'Degree' => 'Degree', 'Master' => 'Master', 'PhD' => 'PhD'], ['prompt' => 'Select Level of Education']) ?></div>
                </div>
                <div class = "row">
                    <div class = "col-md"><?= $form->field($model, 'Academic_name_of_programme')->textInput(['maxlength' => true, 'placeholder' => '']) ?></div>
                    <div class = "col-md"><?= $form->field($model, 'Academic_current_semester')->dropDownList(array_combine(range(1, 10), array_map(function ($i) {return "Semester  $i";}, range(1, 10))), ['prompt' => 'Select Semester']) ?></div>
                    <div class = "col-md"><?= $form->field($model, 'Academic_current_year')->dropDownList(array_combine(range(1, 6), array_map(function ($i) {return "Year  $i";}, range(1, 6))), ['prompt' => 'Select Semester']) ?></div>
                </div>
                <div class = "row">
                    <div class = "col-md"><?= $form->field($model, 'Academic_name_of_faculty')->textInput(['maxlength' => true, 'placeholder' => '']) ?></div>
                    <div class = "col-md"><?= $form->field($model, 'Academic_current_result')->textInput(['maxlength' => true, 'placeholder' => '']) ?></div>
                </div>
                <?= $form->field($model, 'Research_title')->textarea(['maxlength' => true, 'placeholder' => '']) ?>
                <?= $form->field($model, 'Mou_or_Moa', ['template' => $templateRadio, 'labelOptions' => ['class' => 'form-label'],])->inline()->radioList(['1' => 'Yes', '0' => 'No',]) ?>
                <h4>LANGUAGE PROFICIENCY</h4>
                <?= $form->field($model, 'English_native', ['template' => $templateRadio, 'labelOptions' => ['class' => 'form-label'],])->inline()->radioList(['1' => 'Yes', '0' => 'No',]) ?>
                <p>If the answer is no, please indicate any English Language Proficiency Test you have taken and upload the result</p>
                <div class = "col-md"><?= $form->field($model, 'English_test_name')->dropDownList(['TOFEL' => 'TOFEL', 'IELTS' => 'IELTS', 'Other' => 'Other'], ['prompt' => 'Select Test', 'id' => 'english']) ?></div>
                <div class = "col-md"><?= $form->field($model, 'English_other_test_name')->textInput(['maxlength' => true, 'placeholder' => '', 'id' => 'english_other', 'disabled' => $model->English_test_name !== 'Other']) ?></div>
                <?= $form->field($model, 'English_certificate', ['template' => $templateFileInput])->fileInput() ?>
            </div>
            <div class = "d-flex justify-content-between">
                <?= Html::submitButton('Save', ['class' => 'btn btn-outline-dark btn-navigate-form-step btn-next fs-5']) ?>
                <!--                'name' => 'saveWithoutValidation', 'value' => 'validate'-->
                <div>
                    <button class = "btn btn-navigate-form-step btn-next fs-5" type = "button" step_number = "2">Back</button>
                    <button class = "btn btn-primary btn-navigate-form-step btn-next fs-5" type = "button" step_number = "4">Next Step</button>
                </div>
            </div>
        </div>
    </div>
</section>
<section id = "step-4" class = "form-step d-none">
    <div class = "card w-100">
        <div class = "card-body">
            <div class = "container pt-2" style = "height: 80vh; overflow-y: auto;">
                <div class = "row">
                    <div class = "col-md"><?= $form->field($model, 'Propose_type_of_programme')->dropDownList([
                            'Exchange Program (1 or 2 semesters)' => 'Exchange Program (1 or 2 semesters)',
                            'Erasmus Exchange Program' => 'Erasmus Exchange Program',
                            'Mevlana Exchange Program' => 'Research Program',
                            'Internship Programme' => 'Internship Programme', 'Summer Program' => 'Summer Program',
                            'Short Visiting Programme' => 'Short Visiting Programme',
                            'University Mobility in Asia and the Pacific (UMAP) Programme' => 'University Mobility in Asia and the Pacific (UMAP) Programme',
                            'Other' => 'Other',
                            ], ['prompt' => 'Select Programme', 'id' => 'programme']) ?></div>
                    <div class = "col-md"><?= $form->field($model, 'Propose_type_of_programme_other')->textInput(['maxlength' => true, 'placeholder' => '', 'id' => 'programme_other', 'disabled' => $model->Propose_type_of_programme !== 'Other']) ?></div>
                </div>
                <div class = "row align-items-center">
                    <div class = "col-md">
                        <?= $form->field($model, 'Propose_type_of_mobility', ['template' => $templateRadio, 'labelOptions' => ['class' => 'form-label']])->inline()->radioList(['1' => 'Physical', '2' => 'Virtual',]) ?>
                        <?= $form->field($model, 'Propose_transfer_credit_hours', ['template' => $templateRadio, 'labelOptions' => ['class' => 'form-label']])->inline()->radioList(['1' => 'Yes', '0' => 'No',]) ?>
                    </div>
                    <div class = "col-md">
                        <?= $form->field($model, 'Propose_kulliyyah_applied')->textInput(['maxlength' => true, 'placeholder' => '']) ?>
                    </div>
                </div>
                <div class = "row">
                    <div class = "col-md"><?= $form->field($model, 'Propose_duration_start')->input('date', [  'onkeydown' => 'return false']) ?></div>
                    <div class = "col-md"><?= $form->field($model, 'Propose_duration_end')->input('date', [ 'onkeydown' => 'return false']) ?></div>
                </div>
                <div class = "row">
                    <h4 class = " text-decoration-underline">Course Offered by Host University</h4>
                    <table class = "table table-borderless">
                        <thead>
                        <tr>
                            <th scope = "col" class = "col-2 text-center">Course Code</th>
                            <th scope = "col" class = "col-6 text-center">Course Name</th>
                            <th scope = "col" class = "col-2 text-center">Credit Hours</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php for ($i = 0; $i < 7; $i++) : ?>
                            <tr>
                                                                <td class = "py-0 px-2">
                                <?= $form->field($coursesData[$i], "[$i]course_code")->textInput(['name' => "CoursesModel[$i][course_code]", 'placeholder' => 'sub', 'class' => 'form-control']) ?></td>
                                                                <td class = "py-0 px-2">
                                <?= $form->field($coursesData[$i], "[$i]course_name")->textInput(['name' => "CoursesModel[$i][course_name]", 'class' => 'form-control']) ?></td>
                                                                <td class = "py-0 px-2">
                                <?= $form->field($coursesData[$i], "[$i]credit_hours")->textInput(['name' => "CoursesModel[$i][credit_hours]", 'class' => 'form-control']) ?></td>
                            </tr>
                        <?php endfor; ?>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class = "d-flex justify-content-between">
                <?= Html::submitButton('Save', ['class' => 'btn btn-outline-dark btn-navigate-form-step btn-next fs-5']) ?>
                <!--                'name' => 'saveWithoutValidation', 'value' => 'validate'-->
                <div>
                    <button class = "btn btn-navigate-form-step btn-next fs-5" type = "button" step_number = "3">Back</button>
                    <button class = "btn btn-primary btn-navigate-form-step btn-next fs-5" type = "button" step_number = "5">Next Step</button>
                </div>
            </div>
        </div>
    </div>
</section>
<section id = "step-5" class = "form-step d-none">
    <div class = "card w-100">
        <div class = "card-body">
            <div class = "container pt-2" style = "height: 80vh; overflow-y: auto;">
                <div class = "row align-items-center">
                    <div class = "col-md"><?= $form->field($model, 'Financial_accommodation_on_campus', ['template' => $templateRadio, 'labelOptions' => ['class' => 'form-label']])->inline()->radioList(['1' => 'Yes', '0' => 'No'], ['id' => 'accommodation']) ?></div>
                    <div class = "col-md"><?= $form->field($model, 'campus_location')->dropDownList([
                            "Main Campus, IIUM Gombak" => "Main Campus, IIUM Gombak",
                            "Kuantan Campus, IIUM Kuantan" => "Kuantan Campus, IIUM Kuantan",
                            "Pagoh Campus, IIUM Pagoh" => "Pagoh Campus, IIUM Pagoh",
                        ], [
                            'prompt' => 'Select', 'id' => 'campus',
                            'disabled' => $model->Financial_accommodation_on_campus !== 1]) ?></div>
                </div>
                <?= $form->field($model, 'Room_type')->dropDownList([
                    "Single Room(for PG Students) RM360/Month" => "Single Room(for PG Students) RM360/Month",
                    "Quad Room(for UG Students) RM360/Month" => "Quad Room(for UG Students) RM360/Month",
                ], ['prompt' => 'Select Room Type', 'id' => 'room', 'disabled' => $model->Financial_accommodation_on_campus !== 1]) ?>
                <?= $form->field($model, 'Financial_funding', ['template' => $templateRadio, 'labelOptions' => ['class' => 'form-label']])->inline()->radioList(['Self-sponsor' => 'Self-sponsor', 'Scholarship' => 'Scholarship', 'Other' => 'Other',], ['id' => 'funding']) ?>


                <div id = "funding_scholarship" class = "row d-none">
                    <div class = "col-md"><?= $form->field($model, 'Sponsor_name')->textInput(['maxlength' => true, 'placeholder' => '', 'disabled' => $model->Financial_funding !== 'Scholarship']) ?></div>
                    <div class = "col-md"><?= $form->field($model, 'Financial_funding_sponsor_amount')->textInput(['maxlength' => true, 'placeholder' => '', 'disabled' => $model->Financial_funding !== 'Scholarship']) ?></div>
                </div>
                <div id = "funding_other" class = "row d-none">
                    <div class = "col-md"><?= $form->field($model, 'Financial_funding_other')->textInput(['maxlength' => true, 'placeholder' => '', 'disabled' => $model->Financial_funding !== 'Other']) ?></div>
                </div>
            </div>
            <div class = "d-flex justify-content-between">
                <?= Html::submitButton('Save', ['class' => 'btn btn-outline-dark btn-navigate-form-step btn-next fs-5']) ?>
                <div>
                    <button class = "btn btn-navigate-form-step btn-next fs-5" type = "button" step_number = "4">Back</button>
                    <button class = "btn btn-primary btn-navigate-form-step btn-next fs-5" type = "button" step_number = "6">Next Step</button>
                </div>
            </div>
        </div>
    </div>
</section>
<section id = "step-6" class = "form-step d-none">
    <div class = "card w-100">
        <div class = "card-body">
            <div class = "container pt-2" style = "height: 80vh; overflow-y: auto;">
                <div class = "row">
                    <div class = "col-md"><?= $form->field($model, 'Approval_university_person_name')->textInput(['maxlength' => true, 'placeholder' => '']) ?></div>
                    <div class = "col-md"><?= $form->field($model, 'Approval_person_position')->textInput(['maxlength' => true, 'placeholder' => '']) ?></div></div>
                <div class = "row">
                    <div class = "col-md"><?= $form->field($model, 'Approval_person_email')->textInput(['maxlength' => true, 'placeholder' => '']) ?></div>
                    <div class = "col-md"><?= $form->field($model, 'Approval_person_mobile_number')->textInput(['maxlength' => true, 'placeholder' => '']) ?></div>
                    <div class = "col-md"><?= $form->field($model, 'Approval_date')->input('date', ['maxlength' => true, 'placeholder' => '']) ?></div>
                </div>
                <?= $form->field($model, 'Recommendation_letter', ['template' => $templateFileInput])->fileInput() ?>
            </div>
            <div class = "d-flex justify-content-between">
                <?= Html::submitButton('Save', ['class' => 'btn btn-outline-dark btn-navigate-form-step btn-next fs-5']) ?>
                <div>
                    <button class = "btn btn-navigate-form-step btn-next fs-5" type = "button" step_number = "5">Back</button>
                    <button class = "btn btn-primary btn-navigate-form-step btn-next fs-5" type = "button" step_number = "7">Next Step</button>
                </div>
            </div>
        </div>
    </div>
</section>
<section id = "step-7" class = "form-step d-none">
    <div class = "card w-100">
        <div class = "card-body">
            <div class = "container pt-2" style = "height: 80vh; overflow-y: auto;">
                <?php renderFileField($form, $model, 'Passport', "Passport"); ?>
                <?php renderFileField($form, $model, 'Latest_passport_photo', "LatestPassportPhoto"); ?>
                <?php renderFileField($form, $model, 'Latest_certified_academic_transcript', "LatestCertifiedAcademicTranscript"); ?>
                <?php renderFileField($form, $model, 'Confirmation_letter', "ConfirmationLetter"); ?>
                <?php renderFileField($form, $model, 'Sponsorship_letter', "SponsorshipLetter"); ?>
                <?= $form->field($model, 'Student_declaration_agreement')->checkbox()->label("<p class='text-dark  d-inline'>I agree on the</p>  <a class='link text-decoration-underline' data-bs-toggle='modal' data-bs-target='#exampleModalCenter'>Terms and Conditions</a>") ?></div>
            <div class = "d-flex justify-content-between">
                <?= Html::submitButton('Save', ['class' => 'btn btn-outline-dark btn-navigate-form-step btn-next fs-5', 'name' => 'saveWithoutValidation', 'value' => 'validate', 'onClick' => 'submitForm()']) ?>
                <button class = "btn btn-navigate-form-step btn-next fs-5" type = "button" step_number = "6">Back</button>
            </div>
        </div>
    </div>
</section>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" aria-labelledby="exampleModalCenterTitle">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Student Declaration</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body ps-7">
                <ul>
                    <li>I declare all the information provided in  this application form is true and complete in every detail.</li>
                    <li>I acknowledge that International Islamic University Malaysia (IIUM) reserves the right to approve or reject made on the basis of incorrect or incomplete information.</li>
                    <li>I am aware of the conditions relating to my application and agree to pay IIUM  fees for which I am Liable for while joining the program above </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<?php ActiveForm::end(); ?>
