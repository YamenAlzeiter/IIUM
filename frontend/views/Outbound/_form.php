<?php

use common\models\Countries;
use common\models\Courses;
use common\models\Iiumcourse;
use common\models\States;
use yii\bootstrap5\ActiveForm;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;


/** @var yii\web\View $this */
/** @var common\models\Outbound $model */
    /** @var Courses $coursesData */
    /** @var Iiumcourse $iiumCoursesData */

$citizenship = Countries::find()->all();
$templateFileInput = '<div class="row align-items-center"><div class="col-md-2">{label}</div><div class="col-md">{input}</div>{error}</div>';
$templateRadio = '{label}{input}{error}';
require Yii::getAlias('@common').'/Helpers/helper.php';

?>


<?php $form = ActiveForm::begin([
    'enableClientValidation' => false,
    'fieldConfig' => [
        'template' => "<div class='form-floating mb-3'>{input}{label}{error}</div>",
        'labelOptions' => ['class' => null],  // Remove label class

    ],
]); ?>
<section id = "step-1" class = "form-step">
    <div class = "card w-100">
        <div class = "card-body">
            <div class = "container pt-2" style = "height: 80vh; overflow-y: auto;">
                <div class = "mb-3 form-group">
                    <?= $form->field($model, 'Name')->textInput(['maxlength' => true, 'placeholder' => '']) ?>
                </div>
                <div class = "row">
                    <div class = "col-md-6">
                        <?= $form->field($model, 'Matric_Number')->textInput(['value' => Yii::$app->user->identity->matric_number ,'maxlength' => true, 'placeholder' => '', 'disabled' => true]) ?>
                    </div>
                    <div class = "col-md-6">
                        <?= $form->field($model, 'Citizenship')->dropDownList(
                            ArrayHelper::map(Countries::find()->all(), 'nationality', 'nationality'),
                            ['prompt' => 'Select Nationality', 'unselect' => null]
                        ) ?>


                    </div>
                </div>
                <div class = "row align-items-center">
                    <div class = "col-md-6">
                        <?= $form->field($model, 'Gender', ['template' => $templateRadio,   'labelOptions' => ['class' => 'form-label'], ])->inline(true)->radioList(['M' => 'Male', 'F' => 'Female']) ?>
                    </div>
                    <div class = "col-md-6">
                        <?= $form->field($model, 'Date_of_Birth')->Input('date') ?>
                    </div>
                </div>
                <div class = "row">
                    <div class = "col-md-6">
                        <?= $form->field($model, 'Passport_Number')->textInput(['maxlength' => true, 'placeholder' => '']) ?>
                    </div>
                    <div class = "col-md-6">
                        <?= $form->field($model, 'Passport_Expiration')->input('date', ['min' => date('Y-m-d')]) ?>
                    </div>
                </div>
                <div class = "row">
                    <div class = "col-md-6"><?= $form->field($model, 'Mobile_Number')->textInput(['maxlength' => true, 'placeholder' => '']) ?></div>
                    <div class = "col-md-6"><?= $form->field($model, 'Email')->textInput(['maxlength' => true, 'placeholder' => '']) ?></div>
                </div>
                <div class = "row">
                    <div class = "col"><?= $form->field($model, 'Permanent_Address')->textarea(['maxlength' => true, 'placeholder' => '']) ?></div>
                </div>
                <div class = "row">
                    <div class = "col-md-4">
                        <?= $form->field($model, 'Country')->dropDownList(ArrayHelper::map(Countries::find()->all(), 'id', 'name'), ['prompt' => 'Select Country', 'id' => 'country-dropdown']) ?>
                    </div>
                    <div class = "col-md-4">
                        <?= $form->field($model, 'State')->dropDownList($model->Country != '' ? ArrayHelper::map(States::find()->where(['country_id' => $model->Country])->all(), 'id', 'name') : [] , ['prompt' => 'Select State', 'id' => 'state-dropdown']) ?>
                    </div>
                    <div class = "col-md-4">
                        <?= $form->field($model, 'Postcode')->textInput(['maxlength' => true, 'placeholder' => '']) ?>
                    </div>
                </div>

            </div>
            <div class = "d-flex justify-content-between">
                <button class = "btn btn-primary btn-navigate-form-step btn-next fs-5" type = "button" step_number = "2">Next Step</button>
                <?= Html::submitButton('Save',
                    ['class' => 'btn btn-outline-dark btn-navigate-form-step btn-next fs-5']) ?>
<!--                , 'name' => 'saveWithoutValidation', 'value' => 'validate'?-->
            </div>
        </div>
    </div>
</section>
<section id = "step-2" class = "form-step d-none">
    <div class = "card w-100">
        <div class = "card-body">
            <div class = "container pt-2" style = "height: 80vh; overflow-y: auto;">

                    <?= $form->field($model, 'Emergency_name')->textInput(['maxlength' => true, 'placeholder' => ''])?>

                <div class = "row">
                    <div class = "col-md-4">
                        <?= $form->field($model, 'Emergency_relationship')->textInput(['maxlength' => true, 'placeholder' => ''])?>
                    </div>
                    <div class = "col-md-4">
                        <?= $form->field($model, 'Emergency_phoneNumber')->textInput(['maxlength' => true, 'placeholder' => ''])?>
                    </div>
                    <div class = "col-md-4">
                        <?= $form->field($model, 'Emergency_email')->textInput(['maxlength' => true, 'placeholder' => ''])?>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <?= $form->field($model, 'Emergency_homeAddress')->textarea(['maxlength' => true, 'placeholder' => ''])?>
                    </div>
                </div>
                <div class = "row">
                    <div class = "col-md-4">
                        <?= $form->field($model, 'Emergency_country')->dropDownList(ArrayHelper::map(Countries::find()->all(), 'id', 'name'), ['prompt' => 'Select Country', 'id' => 'emergency-country-dropdown']) ?>
                    </div>
                    <div class = "col-md-4">
                        <?= $form->field($model, 'Emergency_tate')->dropDownList($model->Emergency_country != '' ? ArrayHelper::map(States::find()->where(['country_id' => $model->Emergency_country])->all(), 'id', 'name') : [] , ['prompt' => 'Select State', 'id' => 'state-dropdown']) ?>
                    </div>
                    <div class = "col-md-4">
                        <?= $form->field($model, 'Emergency_postCode')->textInput(['maxlength' => true, 'placeholder' => '']) ?>
                    </div>
                </div>
            </div>
            <div class = "d-flex justify-content-between">
                <button class = "btn btn-primary btn-navigate-form-step btn-next fs-5" type = "button" step_number = "3">Next Step</button>
                <?= Html::submitButton('Save',
                    ['class' => 'btn btn-outline-dark btn-navigate-form-step btn-next fs-5']) ?>
                <!--                'name' => 'saveWithoutValidation', 'value' => 'validate'-->
            </div>
        </div>
    </div>
</section>
<section id = "step-3" class = "form-step d-none">
    <div class = "card w-100">
        <div class = "card-body">
            <div class = "container pt-2" style = "height: 80vh; overflow-y: auto;">
                <div class = "row">
                    <div class = "col-md-4"><?= $form->field($model, 'Academic_lvl_edu')->dropDownList(['UG' => 'Undergraduate', 'PG' => 'Postgraduate'],['prompt' => 'Select Level of Education']) ?></div>
                    <div class = "col-md-4"><?= $form->field($model, 'Academic_kulliyyah')->dropDownList(ArrayHelper::map(\common\models\Kcdio::find()->all(), 'kcdio', 'kcdio') + ['Other' => 'Other'], ['prompt' => 'Select Kulliyyah','id' => 'kulliyyah']) ?></div>
                    <div class="col-md-4"><?= $form->field($model, 'Academic_kulliyyah_others')->textInput(['maxlength' => true, 'placeholder' => '', 'disabled' => $model->Academic_kulliyyah !== 'Other', 'id' => 'kulliyyah_other',])?></div>
                </div>
                <div class = "row">
                    <div class = "col-md"><?= $form->field($model, 'Academic_current_semester')->dropDownList(array_combine(range(1, 10), array_map(function ($i) {return "Semester  $i";}, range(1, 10))), ['prompt' => 'Select Semester']) ?></div>
                    <div class = "col-md"><?= $form->field($model, 'Academic_current_year')->dropDownList(array_combine(range(1,6), array_map(function ($i){return "Year $i";}, range(1, 6))), ['prompt' => 'Select Year'],)?></div>
                </div>
                <div class = "row">
                    <div class = "col-md"><?= $form->field($model, 'Academic_name_of_programme')->textInput(['maxlength' => true, 'placeholder' => ''])?></div>
                    <div class = "col-md-3"><?= $form->field($model, 'Academic_cgpa')->textInput(['maxlength' => true, 'placeholder' => ''])?></div>
                </div>
                <hr>
                <h4>LANGUAGE PROFICIENCY</h4>
                <div class = "row">
                    <div class = "col-md"><?= $form->field($model, 'English_language_proficiency')->dropDownList(['Malaysia University English Test' => 'Malaysia University English Test', 'TOFEL'=> 'TOFEL', 'IELTS' => 'IELTS', 'Other' => 'Third Language'],['prompt' => 'Select Test', 'id' => 'english'])?></div>
                    <div class = "col-md"><?= $form->field($model, 'Third_language')->textInput(['maxlength' => true, 'placeholder' => '', 'id' => 'english_other', 'disabled' => $model->English_language_proficiency !== 'Other'])?></div>
                    <div class = "col-md"><?= $form->field($model, 'English_result')->textInput(['maxlength' => true, 'placeholder' => ''])?></div>
                </div>
                <h4>FINANCIAL INFORMATION</h4>
                <div class = "row">
                    <div class = "col-md"><?= $form->field($model, 'Financial_funded_accept', ['template' => $templateRadio,   'labelOptions' => ['class' => 'form-label']])->inline('true')->radioList(['1' => 'Yes', '0' => 'No'], ['unselect' => null])?></div>
                    <div class = "col-md">    <?= $form->field($model, 'Sponsoring_name')->dropDownList(['JPA' => 'JPA', 'MARA' => 'MARA', 'PTPTN' => 'PTPTN', 'Other' => 'Other'], ['prompt' => 'Select Sponsor', 'id' => 'sponsor_name']) ?></div>
                    <div class = "col-md"><?= $form->field($model, 'Sponsoring_name_other')->textInput(['maxlength' => true, 'placeholder' => '', 'id' => 'sponsor_other', 'disabled' => $model->Sponsoring_name !== 'Other'],  )?></div>
                    <div class="col-md"><?= $form->field($model, 'Sponsoring_funding')->textInput(['maxlength' => true, 'placeholder' => ''])?></div>
                </div>
            </div>
            <div class = "d-flex justify-content-between">
                <button class = "btn btn-primary btn-navigate-form-step btn-next fs-5" type = "button" step_number = "4">Next Step</button>
                <?= Html::submitButton('Save',
                    ['class' => 'btn btn-outline-dark btn-navigate-form-step btn-next fs-5']) ?>
                <!--                'name' => 'saveWithoutValidation', 'value' => 'validate'-->
            </div>
        </div>
    </div>
</section>
<section id = "step-4" class = "form-step d-none">
    <div class = "card w-100">
        <div class = "card-body">
            <div class = "container pt-2" style = "height: 80vh; overflow-y: auto;">
                <h4>MOBILITY PROGRAM INFORMATION</h4>
                <hr>
                <div class="row">
                    <div class = "col-md"><?= $form->field($model, 'Type_mobility', ['template' =>$templateRadio,   'labelOptions' => ['class' => 'form-label']])->inline(true)->radioList(['1' => 'Physical', '2' => 'Virtual'],['unselect' => null])?></div>
                    <div class = "col-md"><?= $form->field($model, 'Type_mobility_program')->dropDownList(["Exchange Program (1 or 2 semesters)" => "Exchange Program (1 or 2 semesters)", "Erasmus+ Exchange Program" => "Erasmus+ Exchange Program", "Mevlana Exchange Program" => "Mevlana Exchange Program", "Global UGRAD Program" => "Global UGRAD Program", "Research Program" => "Research Program", "Summer Program" => "Summer Program", "Industrial Training/Internship" => "Industrial Training/Internship", "Educational Visit" => "Educational Visit", "Other" => "Other"], ['prompt' => 'Select Program', 'id' => 'mobility_programme']) ?></div>
                    <div class = "col-md-3"><?= $form->field($model, 'Type_mobility_program_other')->textInput(['maxlength' => true, 'placeholder' => '', 'id' => 'mobility_other', 'disabled' => $model->Type_mobility_program !== 'Other'])?></div>
                    <div class = "col-md"><?= $form->field($model, 'Country_host_university')->dropDownList(ArrayHelper::map(Countries::find()->all(), 'id', 'name'), ['prompt' => 'Select Country', 'id' => 'host-country-dropdown'])?></div>
                </div>
                <div class = "row">
                    <div class = "col-md"><?= $form->field($model, 'Host_university_name')->textInput(['maxlength' => true, 'placeholder' => ''])?></div>
                    <div class = "col-md"><?= $form->field($model, 'Mobility_from')->input('date', ['min' => date('Y-m-d'), 'id' => 'Propose_duration_start', 'onkeydown' => 'return false'])?></div>
                    <div class = "col-md"><?= $form->field($model, 'Mobility_until')->input('date', ['min' => date('Y-m-d'), 'id' =>'Propose_duration_end', 'onkeydown' => 'return false'])?></div>
                    <div class = "col-md"><?= $form->field($model, 'credit_transfer_availability', ['template' =>$templateRadio,   'labelOptions' => ['class' => 'form-label']])->inline(true)->radioList(['1' => 'Yes', '2' => 'No'],['unselect' => null])?></div>
                </div>

                <h4>CONTACT PERSON AT HOST UNIVERSITY</h4>
                <hr>
                <div class = "row">
                    <div class = "col-md"><?= $form->field($model, 'Connect_host_name')->textInput(['maxlength' => true, 'placeholder' => ''])?></div>
                </div>
                <div class = "row">
                    <div class = "col-md"><?= $form->field($model, 'Connect_host_position')->textInput(['maxlength' => true, 'placeholder' => ''])?></div>
                    <div class = "col-md"><?= $form->field($model, 'Connect_host_mobile_number')->textInput(['maxlength' => true, 'placeholder' => ''])?></div>
                    <div class = "col-md"><?= $form->field($model, 'Connect_host_email')->textInput(['maxlength' => true, 'placeholder' => ''])?></div>
                </div>
                <?= $form->field($model, 'Connect_host_address')->textarea(['maxlength' => true, 'placeholder' => ''])?>
                <div class = "row">
                    <div class = "col-md"><?= $form->field($model, 'Connect_host_country')->dropDownList(ArrayHelper::map(Countries::find()->all(), 'id', 'name'), ['prompt' => 'Select Country', 'id' => 'host-country-dropdown'])?></div>
                    <div class = "col-md"><?= $form->field($model, 'Connect_host_postcode')->textInput(['maxlength'])?></div>
                </div>
            </div>
            <div class = "d-flex justify-content-between">
                <button class = "btn btn-primary btn-navigate-form-step btn-next fs-5" type = "button" step_number = "5">Next Step</button>
                <?= Html::submitButton('Save',
                    ['class' => 'btn btn-outline-dark btn-navigate-form-step btn-next fs-5']) ?>
                <!--                'name' => 'saveWithoutValidation', 'value' => 'validate'-->
            </div>
        </div>
    </div>
</section>
<section id = "step-5" class = "form-step d-none">
    <div class = "card w-100">
        <div class = "card-body">
            <div class = "container pt-2" style = "height: 80vh; overflow-y: auto;">
                <h4 class=" text-decoration-underline">Course Offered by Host University</h4>
                <table class="table table-borderless">
                    <thead>
                    <tr>
                        <th scope="col" class="col-2 text-center">Course Code</th>
                        <th scope="col" class="col-6 text-center">Course Name</th>
                        <th scope="col" class="col-2 text-center">Credit Hours</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php for ($i = 0; $i < 7; $i++) : ?>
                        <tr>
                            <td class="py-0 px-2">
                                <?= $form->field($coursesData[$i], "[$i]course_code")->textInput(['name' => "CoursesModel[$i][course_code]", 'placeholder' => 'sub', 'class' => 'form-control']) ?>
                            </td>
                            <td class="py-0 px-2">
                                <?= $form->field($coursesData[$i], "[$i]course_name")->textInput(['name' => "CoursesModel[$i][course_name]", 'class' => 'form-control']) ?>
                            </td>
                            <td class="py-0 px-2">
                                <?= $form->field($coursesData[$i], "[$i]credit_hours")->textInput(['name' => "CoursesModel[$i][credit_hours]", 'class' => 'form-control']) ?>
                            </td>
                        </tr>
                    <?php endfor; ?>
                    </tbody>
                </table>

                <h4 class=" text-decoration-underline">Course Offered by IIUM</h4>
                <table class="table table-borderless">
                    <thead>
                    <tr>
                        <th scope="col" class="col-2 text-center">Course Code</th>
                        <th scope="col" class="col-6 text-center">Course Name</th>
                        <th scope="col" class="col-2 text-center">Credit Hours</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php for ($i = 0; $i < 7; $i++) : ?>
                        <tr>
                            <td class="py-0 px-2">
                                <?= $form->field($iiumCoursesData[$i], "[$i]course_code")->textInput(['name' => "IiumCoursesModel[$i][course_code]", 'placeholder' => 'sub', 'class' => 'form-control']) ?>
                            </td>
                            <td class="py-0 px-2">
                                <?= $form->field($iiumCoursesData[$i], "[$i]course_name")->textInput(['name' => "IiumCoursesModel[$i][course_name]", 'class' => 'form-control']) ?>
                            </td>
                            <td class="py-0 px-2">
                                <?= $form->field($iiumCoursesData[$i], "[$i]credit_hours")->textInput(['name' => "IiumCoursesModel[$i][credit_hours]", 'class' => 'form-control']) ?>
                            </td>
                        </tr>
                    <?php endfor; ?>
                    </tbody>
                </table>
            </div>
            <div class = "d-flex justify-content-between mt-4">
                <button class = "btn btn-primary btn-navigate-form-step btn-next fs-5" type = "button" step_number = "6">Next Step</button>
                <?= Html::submitButton('Save',
                    ['class' => 'btn btn-outline-dark btn-navigate-form-step btn-next fs-5']) ?>
            </div>
        </div>
    </div>
</section>
<section id = "step-6" class = "form-step d-none">
    <div class = "card w-100">
        <div class = "card-body">
            <div class = "container pt-2" style = "height: 80vh; overflow-y: auto;">
                <?php renderFileField($form, $model, 'Offer_letter', "OfferLetter"); ?>
                <?php renderFileField($form, $model, 'Academic_transcript', "AcademicTranscript"); ?>
                <?php renderFileField($form, $model, 'Program_brochure', "ProgramBrochure"); ?>
                <?php renderFileField($form, $model, 'Latest_pay_slip', "LatestPaySlip"); ?>
                <?php renderFileField($form, $model, 'Other_latest_pay_slip', "OtherLatestPaySlip"); ?>

                    <?= $form->field($model, 'agreement')->checkbox()->label("<p class='text-dark  d-inline'>I agree on the</p>  <a class='link text-decoration-underline' data-bs-toggle='modal' data-bs-target='#exampleModalCenter'>Terms and Conditions</a>") ?>

            </div>
            <div class = "d-flex justify-content-between mt-4">
                <button class = "btn btn-primary btn-navigate-form-step btn-next fs-5" type = "button" step_number = "6">Next Step</button>
                <?= Html::submitButton('Save',
                    ['class' => 'btn btn-outline-dark btn-navigate-form-step btn-next fs-5', 'name' => 'saveWithoutValidation', 'value' => 'validate']) ?>
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

<script>
    // Get the start date input element
    const startDateInput = document.getElementById('Propose_duration_start');
    // Get the end date input element
    const endDateInput = document.getElementById('Propose_duration_end');

    // Function to set minimum value for end date based on start date
    function setEndDateMinValue() {
        endDateInput.min = startDateInput.value;
        console.log(startDateInput.value);
        // If the current value of end date is less than start date, reset it
        if (endDateInput.value < startDateInput.value) {
            endDateInput.value = startDateInput.value;
        }
    }
    // Add event listener to the start date input
    startDateInput.addEventListener('change', setEndDateMinValue);
    // Check if start date has a value on page load
    window.addEventListener('load', function () {
        if (startDateInput.value) {
            setEndDateMinValue();
        }
    });
</script>

<script>
    $(document).ready(function() {
        // Function to toggle the disabled property of the "other" dropdowns
        function toggleOtherDropdown(value, otherdropdown) {
            if (value === 'Other') {
                otherdropdown.prop('disabled', false);
            } else {
                otherdropdown.prop('disabled', true);
            }
        }

        // Event handlers for each dropdown
        $('#kulliyyah').change(function () {
            var value = $(this).val();
            var otherdropdown = $('#kulliyyah_other');
            toggleOtherDropdown(value, otherdropdown);
        });

        $('#english').change(function () {
            var value = $(this).val();
            var otherdropdown = $('#english_other');
            toggleOtherDropdown(value, otherdropdown);
        });

        $('#sponsor_name').change(function () {
            var value = $(this).val();
            var otherdropdown = $('#sponsor_other');
            toggleOtherDropdown(value, otherdropdown);
        });

        $('#mobility_programme').change(function () {
            var value = $(this).val();
            var otherdropdown = $('#mobility_other');
            toggleOtherDropdown(value, otherdropdown);
        });
    });
</script>

<script>
    $(document).ready(function () {
        function updateState(countryDropdown) {
            var countryId = countryDropdown.val();
            console.log(countryId)
            var stateDropdown = countryDropdown.closest('.row').find('#state-dropdown');
            if (countryId) {
                $.ajax({
                    url: '/inbound/get-states',
                    type: 'post',
                    data: {countryId: countryId},
                    success: function (response) {
                        stateDropdown.html(response);
                    }
                });
            } else {
                $('#state-dropdown').html('<option value="0">Select State</option>');
            }
        }

        $('#country-dropdown').change(function () {
            updateState($(this))
        })
        $('#emergency-country-dropdown').change(function () {
            updateState($(this))
        })
        $('#host-country-dropdown').change(function () {
            updateState($(this))
        })
        $('#host-country-dropdown').change(function () {
            updateState($(this))
        })
    });
</script>

