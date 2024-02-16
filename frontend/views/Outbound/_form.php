<?php

use common\widgets\inputCustomWidget;
use common\widgets\tableMakerWidget;
use yii\bootstrap5\ActiveForm;


/** @var yii\web\View $this */
/** @var common\models\Outbound $model */

function isFileRequired($file)
{
    return $file === null;
}

$kcdio = \yii\helpers\ArrayHelper::map(\common\models\Kcdio::find()->all(), 'kcdio', 'kcdio');
$kcdio['OTHERS'] = 'OTHERS';

require Yii::getAlias('@common').'/Helpers/helper.php';
//require_once(Yii::$app->basePath . '/common/Helpers/helper.php');
?>


<!-- Step 1 Content -->
<?php $form = ActiveForm::begin(['id' => 'myForm']); ?>

<input type = "hidden" name = "<?= Yii::$app->request->csrfParam ?>"
       value = "<?= Yii::$app->request->csrfToken ?>">

<section id = "step-1" class = "form-step">
    <div class = "card w-100">
        <div class = "card-body">
            <div class = "container pt-2" style = "height: 80vh; overflow-y: auto;">
                <div class = "row mb-2">
                    <div class = "col-md-6">
                        <div class = "form__div">
                            <?= inputCustomWidget::widget([
                                'value' => $model->Matric_Number, 'name' => 'Outbound[Matric_Number]', 'label' => 'Matric Number', 'inputType' => 'text',
                                'length' => '255', 'required' => 'required', 'disabled' => 'disabled'
                            ]) ?>
                            <input type = "hidden" name = "Outbound[Matric_Number]"
                                   value = "<?= Yii::$app->user->identity->matric_number ?>">
                        </div>
                    </div>
                    <div class = "col-md-6">
                        <?= inputCustomWidget::widget([
                            'id' => 'validationCustomCitizenship', 'value' => $model->Citizenship,
                            'name' => 'Outbound[Citizenship]', 'required' => 'required', 'label' => 'Citizenship',
                            'inputType' => 'dropdown', 'selectOption' => 'Select your Nationality',
                        ]) ?>
                    </div>
                </div>
                <div class = "form__div">
                    <?= inputCustomWidget::widget([
                        'value' => $model->Name, 'name' => 'Outbound[Name]', 'label' => 'Name', 'inputType' => 'text',
                        'length' => '255', 'required' => 'required',
                    ]) ?>
                </div>
                <div class = "row align-items-center">
                    <?= inputCustomWidget::widget([
                        'value' => $model->Gender, 'name' => 'Outbound[Gender]', 'inputType' => 'radio',
                        'required' => 'required', 'legend' => 'Gender:', 'options' => [
                            'M' => 'Male', 'F' => 'Female',
                        ],]) ?>
                    <div class = "col">
                        <?= inputCustomWidget::widget([
                            'value' => $model->Date_of_Birth, 'name' => 'Outbound[Date_of_Birth]', 'label' => 'Date of Birth', 'inputType' => 'date',
                            'required' => 'required',
                        ]) ?>
                    </div>
                </div>
                <div class = "row">
                    <div class = "col">
                        <?= inputCustomWidget::widget([
                            'value' => $model->Passport_Number, 'name' => 'Outbound[Passport_Number]', 'label' => 'Passport Number', 'inputType' => 'text',
                            'length' => '15', 'required' => 'required',
                        ]) ?>
                    </div>
                    <div class = "col">
                        <?= inputCustomWidget::widget([
                            'value' => $model->Passport_Expiration, 'name' => 'Outbound[Passport_Expiration]', 'label' => 'Expiration Date', 'inputType' => 'date',
                            'required' => 'required',
                        ]) ?>
                    </div>
                </div>
                <div class = "row mt-2">
                    <div class = "col-md-6">
                        <?= inputCustomWidget::widget([
                            'value' => $model->Mobile_Number, 'name' => 'Outbound[Mobile_Number]', 'label' => 'Mobile Number', 'inputType' => 'text',
                            'length' => '15', 'required' => 'required',
                        ]) ?>
                    </div>
                    <div class = "col-md-6">
                        <?= inputCustomWidget::widget([
                            'value' => $model->Email, 'name' => 'Outbound[Email]', 'label' => 'Email', 'inputType' => 'email',
                            'length' => '512', 'required' => 'required',
                        ]) ?>
                    </div>
                </div>
                <div class = "form__div">
                    <textarea class = "form__input form-control" id = "validationCustomAddress" name = "Outbound[Permanent_Address]" maxlength = "255" placeholder = " " required><?= $model->Permanent_Address ?></textarea>
                    <label for = "validationCustomAddress" class = "form__label">Permanent Address</label>
                </div>
                <div class = "row mt-2">
                    <div class = "col-md-4">
                        <?= inputCustomWidget::widget([
                            'value' => $model->Postcode, 'name' => 'Outbound[Postcode]', 'label' => 'Post Code', 'inputType' => 'text',
                            'length' => '10', 'required' => 'required',
                        ]) ?>
                    </div>
                    <div class = "col-md-4">
                        <?= inputCustomWidget::widget([
                            'id' => 'countryId5', 'value' => $model->Country,
                            'name' => 'Outbound[Country]', 'required' => 'required', 'label' => 'Country',
                            'inputType' => 'dropdown', 'selectOption' => 'Select Country',
                        ]) ?>
                    </div>
                    <div class = "col-md-4">
                        <?= inputCustomWidget::widget([
                            'id' => 'stateId1', 'value' => $model->State,
                            'name' => 'Outbound[State]', 'required' => 'required', 'label' => 'State',
                            'inputType' => 'dropdown', 'selectOption' => 'Select State',
                        ]) ?>
                    </div>
                </div>
                <div class = "form__div">
                    <textarea class = "form__input form-control" id = "validationCustomMailingAddress" name = "Outbound[Mailing_Address]" maxlength = "255" placeholder = " " required><?= $model->Mailing_Address ?></textarea>
                    <label for = "validationCustomMailingAddress" class = "form__label">Mailing Address</label>
                </div>

                <div class = "row mt-2">
                    <div class = "col-md-4">
                        <?= inputCustomWidget::widget([
                            'value' => $model->Mailing_Postcode, 'name' => 'Outbound[Mailing_Postcode]', 'label' => 'Mailing Post Code', 'inputType' => 'text',
                            'length' => '10', 'required' => 'required',
                        ]) ?>
                    </div>
                    <div class = "col-md-4">
                        <?= inputCustomWidget::widget([
                            'id' => 'countryId4', 'value' => $model->Mailing_Country,
                            'name' => 'Outbound[Mailing_Country]', 'required' => 'required', 'label' => 'Mailing Country',
                            'inputType' => 'dropdown', 'selectOption' => 'Select Country',
                        ]) ?>
                    </div>
                    <div class = "col-md-4">
                        <?= inputCustomWidget::widget([
                            'id' => 'stateId2', 'value' => $model->Mailing_State,
                            'name' => 'Outbound[Mailing_State]', 'required' => 'required', 'label' => 'Mailing State',
                            'inputType' => 'dropdown', 'selectOption' => 'Select State',
                        ]) ?>
                    </div>
                </div>
            </div>
            <div class = "d-flex justify-content-between">
                <button class = "btn btn-primary btn-navigate-form-step btn-next fs-5" type = "button"
                        step_number = "2">Next Step
                </button>
                <button class = "btn btn-outline-dark fs-5" type = "button" name = "saveWithoutValidation"
                        onclick = "submitForm('noValidate')"><i class = "ti ti-device-floppy"></i> Save
                </button>
            </div>
        </div>
    </div>
</section>

<section id = "step-2" class = "form-step d-none">
    <div class = "card w-100">
        <div class = "card-body">
            <div class = "container pt-2" style = "height: 80vh; overflow-y: auto;">
                <div class = "form__div">
                    <?= inputCustomWidget::widget([
                        'value' => $model->Emergency_name, 'name' => 'Outbound[Emergency_name]', 'label' => 'Name', 'inputType' => 'text',
                        'length' => '512', 'required' => 'required',
                    ]) ?>
                </div>
                <div class = "row mb-2">
                    <div class = "col-md-6">
                        <?= inputCustomWidget::widget([
                            'value' => $model->Emergency_relationship, 'name' => 'Outbound[Emergency_relationship]', 'label' => 'Relationship', 'inputType' => 'text',
                            'length' => '512', 'required' => 'required',
                        ]) ?>
                    </div>
                    <div class = "col-md-6">
                        <?= inputCustomWidget::widget([
                            'value' => $model->Emergency_phoneNumber, 'name' => 'Outbound[Emergency_phoneNumber]', 'label' => 'Phone Number', 'inputType' => 'text',
                            'length' => '15', 'required' => 'required',
                        ]) ?>
                    </div>
                    <div class = "col-md-6">
                        <div class = "form__div">
                        <?= inputCustomWidget::widget([
                            'value' => $model->Emergency_email, 'name' => 'Outbound[Emergency_email]', 'label' => 'Email', 'inputType' => 'email',
                            'length' => '512', 'required' => 'required',
                        ]) ?>
                    </div>
                </div

                    <div class="col">
                        <div class = "form__div">
                            <textarea class = "form__input form-control" id = "validationCustomEmHomeAddress"
                                      name = "Outbound[Emergency_homeAddress]" maxlength = "255" placeholder = " "
                                      required><?= $model->Emergency_homeAddress ?></textarea>
                            <label for = "validationCustomEmHomeAddress" class = "form__label">Home Address</label>
                        </div>
                    </div>
                    
                <div class = "row mt-2">
                    <div class = "col-md-3">
                        <?= inputCustomWidget::widget([
                            'value' => $model->Emergency_postCode, 'name' => 'Outbound[Emergency_postCode]', 'label' => 'Post Code', 'inputType' => 'text',
                            'length' => '10', 'required' => 'required',
                        ]) ?>
                    </div>
                    <div class = "col-md-3">
                        <?= inputCustomWidget::widget([
                            'id' => 'countryId3', 'value' => $model->Emergency_country,
                            'name' => 'Outbound[Emergency_country]', 'required' => 'required', 'label' => 'Country',
                            'inputType' => 'dropdown', 'selectOption' => 'Select Country',
                        ]) ?>
                    </div>
                    <div class = "col-md-3">
                        <?= inputCustomWidget::widget([
                            'id' => 'stateId3', 'value' => $model->Emergency_tate,
                            'name' => 'Outbound[Emergency_tate]', 'required' => 'required', 'label' => 'State',
                            'inputType' => 'dropdown', 'selectOption' => 'Select State',
                        ]) ?>
                    </div>
                </div>
            </div>

            <div class = "d-flex justify-content-between">
                <div>
                    <button class = "btn btn-navigate-form-step btn-next fs-5" type = "button" step_number = "1">Back
                    </button>
                    <button class = "btn btn-primary btn-navigate-form-step btn-next fs-5" type = "button"
                            step_number = "3">Next Step
                    </button>
                </div>
                <button class = "btn btn-outline-dark fs-5" type = "button" name = "saveWithoutValidation"
                        onclick = "submitForm('noValidate')"><i class = "ti ti-device-floppy"></i> Save
                </button>
            </div>
        </div>
    </div>
</section>
<section id = "step-3" class = "form-step d-none">
    <div class = "card w-100">
        <div class = "card-body">
            <div class = "container pt-2" style = "height: 80vh; overflow-y: auto;">
                <div class = "row d-flex flex-row align-items-center">
                    <div class = "col-md-4">
                        <?= inputCustomWidget::widget([
                            'value' => $model->Academic_lvl_edu,
                            'name' => 'Outbound[Academic_lvl_edu]', 'required' => 'required', 'label' => 'Level of Education',
                            'inputType' => 'dropdown', 'selectOption' => 'Select Level of Education', 'options' =>[
                                'UG' => 'Under Graduate', 'PG' => 'Post Graduate'
                            ]
                        ]) ?>
                    </div>
                    <div class = "col-md-4">
                        <?= inputCustomWidget::widget([
                            'id' => 'kulliyyah', 'value' => $model->Academic_kulliyyah,
                            'name' => 'Outbound[Academic_kulliyyah]', 'required' => 'required', 'label' => 'Kulliyyah',
                            'inputType' => 'dropdown', 'selectOption' => 'Select Kulliyyah', 'options' => $kcdio
                        ]) ?>
                    </div>
                    <div class = "col-md-4">

                        <?= inputCustomWidget::widget([
                            'id' => 'validationCustomOthers','value' => $model->Academic_kulliyyah_others, 'name' => 'Outbound[Academic_kulliyyah_others]', 'label' => 'Others (Please specify)', 'inputType' => 'text',
                            'length' => '512', 'required' => 'required',
                        ]) ?>
                    </div>
                    <div class = "row d-flex flex-row align-items-center">
                        <div class = "col-md-6">
                            <?= inputCustomWidget::widget([
                                'value' => $model->Academic_name_of_programme, 'name' => 'Outbound[Academic_name_of_programme]', 'label' => 'Programme', 'inputType' => 'text',
                                'length' => '512', 'required' => 'required',
                            ]) ?>
                        </div>
                        <div class = "col-md-2">
                            <?= inputCustomWidget::widget([
                                'value' => $model->Academic_cgpa, 'name' => 'Outbound[Academic_cgpa]', 'label' => 'Current CGPA', 'inputType' => 'text',
                                'required' => 'required',
                            ]) ?>
                        </div>
                        <div class = "col-md-2">
                            <div class = "form__div">
                                <select class = "form__input form-control" id = "sem"
                                        name = "Outbound[Academic_current_semester]" required>
                                    <option value = "">Select Semester</option>
                                    <?php
                                    for ($i = 1; $i <= 12; $i++) {
                                        echo "<option value=\"$i\" ".(($model->Academic_current_semester == $i) ? 'selected' : '').">Semester $i</option>";
                                    }
                                    ?>
                                </select>
                            </div>
                        </div>

                        <div class = "col-md-2">
                            <div class = "form__div">
                                <select class = "form__input form-control" id = "validationCustomYear"
                                        name = "Outbound[Academic_current_year]" required>
                                    <option value = "">Select Year</option>
                                    <?php
                                    for ($i = 1; $i <= 6; $i++) {
                                        echo "<option value=\"$i\" ".(($model->Academic_current_year == $i) ? 'selected' : '').">year $i</option>";
                                    }
                                    ?>
                                </select>
                            </div>
                        </div>

                    </div>

                    <div class = "alert alert-light p-2 my-3">
                        <h1 class = "fs-6 mt-0 mb-0 p-0 font-monospace text-capitalize alert">Language proficiency</h1>
                    </div>

                    <div class = "col-md-4">
                        <div class = "form__div">
                            <select class = "form__input form-control" id = "e_lang_pro"
                                    name = "Outbound[English_language_proficiency]" required>
                                <option value = "">Select Language Proficiency</option>
                                <?php foreach ([
                                                   "Malaysia University English Test (MUET)", "TOFEL", "IELTS"
                                               ] as $option): ?>
                                    <option
                                        value = "<?= $option ?>" <?= ($model->English_language_proficiency === $option) ? 'selected' : '' ?>>
                                        <?= $option ?>
                                    </option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                    </div>

                    <div class = "col-md-4">
                        <div class = "form__div">
                            <input type = "text" class = "form__input form-control" id = "validationCustomResult"
                                   name = "Outbound[English_result]" value = "<?= $model->English_result ?>"
                                   maxlength = "255" placeholder = " " required>
                            <label for = "validationCustomResult" class = "form__label">Result</label>
                        </div>
                    </div>
                    <div class = "col-md-4">
                        <div class = "form__div">
                            <input type = "text" class = "form__input form-control" id = "validationCustomThirdLang"
                                   name = "Outbound[Third_language]" value = "<?= $model->Third_language ?>"
                                   maxlength = "255" placeholder = " ">
                            <label for = "validationCustomThirdLang" class = "form__label">Third Language
                                                                                           (optional)</label>
                        </div>
                    </div>
                </div>

                <div class = "alert alert-light p-2 my-3">
                    <h1 class = "alert fs-6 m-0 p-0 font-monospace text-capitalize">Financial information</h1>
                </div>
                <div class = "row-md-6 mb-2">
                    <legend class = "col-form-label col-sm-3 pt-0">I'm Fully Funded for the Programme</legend>
                    <div class = "form-check form-check-inline">
                        <input type = "radio" class = "form-check-input" id = "academic_accept"
                               name = "Outbound[Financial_funded_accept]"
                               value = "1" <?= $model->Financial_funded_accept === 1 ? 'checked' : '' ?> required>
                        <label class = "form-check-label" for = "academic_accept">Yes</label>
                    </div>
                    <div class = "form-check form-check-inline pl-3">
                        <input type = "radio" class = "form-check-input" id = "academic_accept"
                               name = "Outbound[Financial_funded_accept]"
                               value = "0" <?= $model->Financial_funded_accept === 0 ? 'checked' : '' ?>>
                        <label class = "form-check-label" for = "academic_accept">No</label>
                    </div>
                </div>
                <div class = "row">
                    <div class = "col-md-4 mt-2" id = "sponsoringNameColumn">
                        <div class = "form__div">
                            <select class = "form__input form-control" id = "sponsoring_name"
                                    name = "Outbound[Sponsoring_name]" required>
                                <option value = "">Select Name of Sponsoring Body</option>
                                <?php
                                $sponsoringBodyOptions = ["JPA", "MAEA", "PTPTN", "OTHERS"];

                                foreach ($sponsoringBodyOptions as $option) {
                                    $selected = ($model->Sponsoring_name === $option) ? 'selected' : '';
                                    echo "<option value=\"$option\" $selected>$option</option>";
                                }
                                ?>
                            </select>
                        </div>
                    </div>
                    <div class = "col-md-4 mt-2" id = "sponsoringNameOtherColumn">
                        <div class = "form__div">
                            <input type = "text" class = "form__input form-control"
                                   id = "validationCustomSponsoringNameOther"
                                   name = "Outbound[Sponsoring_name_other]"
                                   value = "<?= $model->Sponsoring_name_other ?>" maxlength = "255"
                                   placeholder = " ">
                            <label for = "validationCustomSponsoringNameOther" class = "form__label">Others (Please
                                                                                                     Specify)</label>
                        </div>
                    </div>

                    <div class = "col-md-4 mt-2">
                        <div class = "form__div">
                            <input type = "number" class = "form__input form-control" id = "validationCustomFunding"
                                   name = "Outbound[Sponsoring_funding]" value = "<?= $model->Sponsoring_funding ?>"
                                   maxlength = "255"
                                   placeholder = " " required>
                            <label for = "validationCustomFunding" class = "form__label">Funding/ Sponsoring Amount
                                                                                         (RM)</label>
                        </div>
                    </div>


                </div>

            </div>

            <div class = "d-flex justify-content-between">
                <div>
                    <button class = "btn btn-navigate-form-step btn-next fs-5" type = "button" step_number = "2">Back
                    </button>
                    <button class = "btn btn-primary btn-navigate-form-step btn-next fs-5" type = "button"
                            step_number = "4">Next Step
                    </button>
                </div>
                <button class = "btn btn-outline-dark fs-5" type = "button" name = "saveWithoutValidation"
                        onclick = "submitForm('noValidate')"><i class = "ti ti-device-floppy"></i> Save
                </button>
            </div>
        </div>
    </div>
</section>

<section id = "step-4" class = "form-step d-none">
    <div class = "card w-100">
        <div class = "card-body">
            <div class = "container pt-2" style = "height: 80vh; overflow-y: auto;">
                <div class = "row-md-6 mb-2">
                    <legend class = "col-form-label col-sm-2 pt-0">Type of Mobility</legend>
                    <div class = "form-check form-check-inline">
                        <?php
                        $mobilityOptions = [
                            "1" => "Physical", "2" => "Virtual"
                        ];
                        foreach ($mobilityOptions as $value => $label) {
                            $checked = ($model->Type_mobility === $value) ? 'checked' : ''; ?>
                            <div class = "form-check form-check-inline">
                                <input type = "radio" class = "form-check-input" id = "type_mobility_<?= $value ?>"
                                       name = "Outbound[Type_mobility]" value = "<?= $value ?>" <?= $checked ?>required>
                                <label class = "form-check-label"
                                       for = "type_mobility_<?= $value ?>"><?= $label ?></label>
                            </div>
                        <?php } ?>
                    </div>
                </div>
                <div class = "row d-flex flex-row align-items-center">

                    <div class = "col-md-6">
                        <div class = "form__div">
                            <select class = "form__input form-control" id = "type_program"
                                    name = "Outbound[Type_mobility_program]" required>
                                <option value = "">Select Type of Programme</option>
                                <?php
                                $programOptions = [
                                    "Exchange Program (1 or 2 semesters)", "Erasmus+ Exchange Program",
                                    "Mevlana Exchange Program", "Global UGRAD Program", "Research Program",
                                    "Summer Program", "Industrial Training/Internship", "Educational Visit", "Other"
                                ];

                                foreach ($programOptions as $option) {
                                    $selected = ($model->Type_mobility_program === $option) ? 'selected' : '';
                                    echo "<option value=\"".htmlspecialchars($option)."\" $selected>$option</option>";
                                }
                                ?>
                            </select>
                        </div>
                    </div>

                    <div class = "col-md-6">
                        <div class = "form__div">
                            <input type = "text" class = "form__input form-control"
                                   id = "validationCustomTypeProgramOther"
                                   name = "Outbound[Type_mobility_program_other]"
                                   value = "<?= $model->Type_mobility_program_other ?>"
                                   maxlength = "255" placeholder = " ">
                            <label for = "validationCustomTypeProgramOther" class = "form__label">Others (Please
                                                                                                  specify)</label>
                        </div>
                    </div>
                </div>

                <div class = "row mt-2 d-flex flex-row align-items-center">
                    <div class = "col-md-6">
                        <div class = "form__div">
                            <input type = "text" class = "form__input form-control" id = "validationCustomHostUniName"
                                   name = "Outbound[Host_university_name]" maxlength = "255" placeholder = " "
                                   value = "<?= htmlspecialchars($model->Host_university_name ?? '') ?>" required>
                            <label for = "validationCustomHostUniName" class = "form__label">Name of Host
                                                                                             University</label>
                        </div>
                    </div>
                    <div class = "col-md-3">
                        <div class = "form__div">
                            <input type = "date" class = "form__input form-control" id = "validationCustomMobilityFrom"
                                   name = "Outbound[Mobility_from]"
                                   value = "<?= htmlspecialchars($model->Mobility_from ?? '') ?>"
                                   min = "<?= date('Y-m-d') ?>"
                                   required>
                            <label for = "validationCustomMobilityFrom" class = "form__label">Mobility From</label>
                        </div>
                    </div>
                    <div class = "col-md-3">
                        <div class = "form__div">
                            <input type = "date" class = "form__input form-control" id = "validationCustomMobilityUntil"
                                   name = "Outbound[Mobility_until]"
                                   value = "<?= htmlspecialchars($model->Mobility_until ?? '') ?>"
                                   min = "<?= date('Y-m-d') ?>"
                                   required>
                            <label for = "validationCustomMobilityUntil" class = "form__label">Mobility Until</label>
                        </div>
                    </div>
                </div>

                <script>
                    // Get the start date input element
                    const startDateInput = document.getElementById('validationCustomMobilityFrom');
                    // Get the end date input element
                    const endDateInput = document.getElementById('validationCustomMobilityUntil');

                    // Function to set minimum value for end date based on start date
                    function setEndDateMinValue() {
                        endDateInput.min = startDateInput.value;

                        // If the current value of end date is less than start date, reset it
                        if (endDateInput.value < startDateInput.value) {
                            endDateInput.value = startDateInput.value;
                        }
                    }

                    // Add event listener to the start date input
                    startDateInput.addEventListener('change', setEndDateMinValue);

                    // Check if start date has a value on page load
                    window.addEventListener('load', function() {
                        if (startDateInput.value) {
                            setEndDateMinValue();
                        }
                    });
                </script>


                <div class = "row mt-2">
                    <div class = "col-md-6">
                        <div class = "form__div">
                            <select class = "form__input form-control countries" id = "countryId2"
                                    name = "Outbound[Country_host_university]" required>
                                <option value = "">Select Country</option>
                            </select>
                        </div>
                    </div>
                    <div class = "col-md-6">
                        <div class = "row-md-6 mb-6">
                            <legend class = "col-form-label col-sm-5 pt-0">Credit Transfer Availability</legend>
                            <div class = "form-check form-check-inline">
                                <input type = "radio" class = "form-check-input" id = "credit_transfer_availability_1"
                                       name = "Outbound[credit_transfer_availability]" value = "1"
                                    <?= ($model->credit_transfer_availability == 1) ? 'checked' : '' ?> required>
                                <label class = "form-check-label" for = "credit_transfer_availability_1">Yes</label>
                            </div>
                            <div class = "form-check form-check-inline pl-3">
                                <input type = "radio" class = "form-check-input" id = "credit_transfer_availability_0"
                                       name = "Outbound[credit_transfer_availability]" value = "0"
                                    <?= ($model->credit_transfer_availability == 0) ? 'checked' : '' ?>>
                                <label class = "form-check-label" for = "credit_transfer_availability_0">No</label>
                            </div>
                        </div>
                    </div>
                </div>


                <div class = "alert alert-light p-2 my-3">
                    <h1 class = "fs-6 mt-0 mb-0 p-0 font-monospace text-capitalize alert">Contact person at host
                                                                                          university</h1>
                </div>

                <div class = "row mt-2 d-flex flex-row align-items-center">
                    <div class = "col-md-6">
                        <div class = "form__div">
                            <input type = "text" class = "form__input form-control"
                                   id = "validationCustomConnectHostName"
                                   name = "Outbound[Connect_host_name]" maxlength = "255" placeholder = " "
                                   value = "<?= htmlspecialchars($model->Connect_host_name ?? '') ?>" required>
                            <label for = "validationCustomConnectHostName" class = "form__label">Name</label>
                        </div>
                    </div>
                    <div class = "col-md-6">
                        <div class = "form__div">
                            <input type = "text" class = "form__input form-control"
                                   id = "validationCustomConnectHostPosition"
                                   name = "Outbound[Connect_host_position]" maxlength = "255" placeholder = " "
                                   value = "<?= htmlspecialchars($model->Connect_host_position ?? '') ?>" required>
                            <label for = "validationCustomConnectHostPosition" class = "form__label">Position</label>
                        </div>
                    </div>
                </div>
                <div class = "row mt-2 d-flex flex-row align-items-center">
                    <div class = "col-md-6">
                        <div class = "form__div">
                            <input type = "text" class = "form__input form-control"
                                   id = "validationCustomConnectHostMobileNo"
                                   name = "Outbound[Connect_host_mobile_number]" maxlength = "255" placeholder = " "
                                   value = "<?= htmlspecialchars($model->Connect_host_mobile_number ?? '') ?>" required>
                            <label for = "validationCustomConnectHostMobileNo" class = "form__label">Mobile
                                                                                                     Number</label>
                        </div>
                    </div>
                    <div class = "col-md-6">
                        <div class = "form__div">
                            <input type = "text" class = "form__input form-control"
                                   id = "validationCustomConnectHostMobileNo"
                                   name = "Outbound[Connect_host_email]" maxlength = "255" placeholder = " "
                                   value = "<?= htmlspecialchars($model->Connect_host_email ?? '') ?>" required>
                            <label for = "validationCustomConnectHostMobileNo" class = "form__label">Email
                                                                                                     Address</label>
                        </div>
                    </div>
                </div>
                <div class = "form__div mt-2">
                    <textarea class = "form__input form-control" id = "validationCustomConnectHostAddress"
                              name = "Outbound[Connect_host_address]" maxlength = "255" placeholder = " "
                              required><?= htmlspecialchars($model->Connect_host_address ?? '') ?></textarea>
                    <label for = "validationCustomConnectHostAddress" class = "form__label">Address</label>
                </div>
                <div class = "row mt-2">
                    <div class = "col-md-6">
                        <div class = "form__div">
                            <input class = "form__input form-control"
                                   id = "validationCustomConnectHostPostcode"
                                   name = "Outbound[Connect_host_postcode]" placeholder = " "
                                   value = "<?= htmlspecialchars($model->Connect_host_postcode ?? '') ?>" required>
                            <label for = "validationCustomConnectHostPostcode" class = "form__label">Post Code</label>
                        </div>
                    </div>
                    <div class = "col-md-6">
                        <div class = "form__div">
                            <select class = "form__input form-control countries" id = "countryId1"
                                    name = "Outbound[Connect_host_country]" required>
                                <option value = "">Select Country</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class = "row mt-2">
                    <div class = "col-md-6">
                    <div class = "row-md-6 mb-6">
                        <legend class = "col-form-label col-sm-7 pt-0">Scholarship/ grant from host university</legend>
                        <div class = "form-check form-check-inline">
                            <input type = "radio" class = "form-check-input" id = "host_scholarship_1"
                                   name = "Outbound[host_scholarship]" value = "1"
                                <?= ($model->host_scholarship == 1) ? 'checked' : '' ?> required>
                            <label class = "form-check-label" for = "host_scholarship_1">Yes</label>
                        </div>
                        <div class = "form-check form-check-inline pl-3">
                            <input type = "radio" class = "form-check-input" id = "host_scholarship_0"
                                   name = "Outbound[host_scholarship]" value = "0"
                                <?= ($model->host_scholarship == 0) ? 'checked' : '' ?>>
                            <label class = "form-check-label" for = "host_scholarship_0">No</label>
                        </div>
                    </div>
                    </div>
                    <div class = "col-md-6">
                        <div class = "form__div">
                            <input type = "number" class = "form__input form-control"
                                   id = "validationCustomHostScholarshipAmount"
                                   name = "Outbound[host_scholarship_amount]" maxlength = "255" placeholder = " "
                                   value = "<?= htmlspecialchars($model->host_scholarship_amount ?? '') ?>" required>
                            <label for = "validationCustomHostScholarshipAmount" class = "form__label">Amount of
                                                                                                       Scholarship/grant
                                                                                                       (RM)</label>
                        </div>
                    </div>
                </div>
            </div>


            <div class = "d-flex justify-content-between">

                <div>
                    <button class = "btn btn-navigate-form-step btn-next fs-5" type = "button" step_number = "3">Back
                    </button>
                    <button class = "btn btn-primary btn-navigate-form-step btn-next fs-5" type = "button"
                            step_number = "5">Next Step
                    </button>
                </div>
                <button class = "btn btn-outline-dark fs-5" type = "button" name = "saveWithoutValidation"
                        onclick = "submitForm('noValidate')"><i class = "ti ti-device-floppy"></i> Save
                </button>
            </div>
        </div>
    </div>
</section>

<section id = "step-5" class = "form-step d-none">
    <div class = "card w-100">
        <div class = "card-body">
            <div class = "container pt-2" style = "height: 80vh; overflow-y: auto;">

                <div class = "container">
                    <div class = "row" id = "tableContainer">
                        <div class = "col">
                            <h4 class = "text-center mb-4">Courses offered by host University</h4>
                            <?= tableMakerWidget::widget([
                                'tableId' => 'your_table_id',
                                'tableData' => $coursesData, // Pass your data array here
                                'modelName' => 'CoursesModel', // Pass your model name here
                            ]) ?>
                        </div>

                        <div class = "col">
                            <h4 class = "text-center mb-4">IIUM Courses</h4>
                            <?= tableMakerWidget::widget([
                                'tableId' => 'your_table_id',
                                'tableData' => $iiumcourseData, // Pass your data array here
                                'modelName' => 'IiumcoursesModel', // Pass your model name here
                            ]) ?>
                        </div>

                    </div>
                    <div class = "col" id = "textareaContainer">
                        <div class = "form__div">

                            <textarea class="form__input form-control" id="model-Research" name="Outbound[Research]" maxlength="255" placeholder="" required><?= htmlspecialchars($model->Research ?? '') ?></textarea>
                            <label for="model-Research" class="form__label">Write your research</label>

                        </div>
                    </div>
                    <div class = "col" id = "noneContainer">
                        <div id = "approval-message-hod" class = "alert alert-danger">
                            <h5 class = "p-0 m-0 text-capitalize alert fw-semibold">Please pick Level of Education in order to view in step</h5>
                        </div>
                    </div>

                </div>
            </div>
            <div class = "d-flex justify-content-between">

                <div>
                    <button class = "btn btn-navigate-form-step btn-next fs-5" type = "button" step_number = "4">Back
                    </button>
                    <button class = "btn btn-primary btn-navigate-form-step btn-next fs-5" type = "button"
                            step_number = "6">Next Step
                    </button>
                </div>
                <button class = "btn btn-outline-dark fs-5" type = "button" name = "saveWithoutValidation"
                        onclick = "submitForm('noValidate')"><i class = "ti ti-device-floppy"></i> Save
                </button>

            </div>
        </div>
    </div>
</section>

<section id = "step-6" class = "form-step d-none">
    <div class = "card w-100">
        <div class = "card-body">
            <div class = "form-height">


                <p class = "font-monospace"><strong>I hereby submit this application for the IIUM Student Program
                                                    (outbound) and attached all the following compulsory documents in
                                                    support of the information provided</strong></p>

                <?php renderFileField($form, $model, 'Offer_letter', "offerLetter"); ?>
                <?php renderFileField($form, $model, 'Academic_transcript', "AcademicTranscript"); ?>
                <?php renderFileField($form, $model, 'Program_brochure', "ProgramBrochure"); ?>
                <?php renderFileField($form, $model, 'Latest_pay_slip', "LatestPaySlip"); ?>
                <?php renderFileField($form, $model, 'Other_latest_pay_slip', "OtherLatestPaySlip"); ?>

                <div>
                    <p class = "font-monospace">I declare that all the information provided in this application form is
                                                true and complete in every detail. I acknowledge that International
                                                Islamic University Malaysia (IIUM) reserves the right to approve or
                                                reject applications made on the basis of incorrect or incomplete
                                                information. I am aware of the conditions relating to my application and
                                                agree to pay IIUM fees for which I am liable while joining the above
                                                programme.</p>
                </div>

                <div class = "form-check">
                    <input type = "checkbox" class = "form-check-input" id = "declaration-checkbox" required>
                    <label class = "form-check-label fw-bolder" for = "declaration-checkbox">I agree to the terms stated
                                                                                             above.</label>
                </div>
            </div>

            <input type = "hidden" name = "Outbound[Status]" id = "statusInput" value = "<?= $model->Status ?>">
            <div class = "d-flex justify-content-between">
                <button class = "btn btn-navigate-form-step btn-next fs-5" type = "button" step_number = "5">Back
                </button>
                <div>
                    <button class = "btn btn-outline-dark fs-5" type = "button" name = "saveWithoutValidation"
                            onclick = "submitForm('noValidate')"><i class = "ti ti-device-floppy"></i> Save
                    </button>

                    <button class = "btn btn-dark submit-btn px-3 fs-5" type = "button" name = "saveWithoutValidation"
                            value = "validate" onclick = "submitForm('validate')" id = "submitButton" disabled><i
                            class = "ti ti-send"></i> Submit
                    </button>

                </div>
            </div>
        </div>
    </div>
</section>


<?php ActiveForm::end(); ?>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById('declaration-checkbox').addEventListener('change', function () {
            document.getElementById('submitButton').disabled = !this.checked;
        });
    });
</script>


<script>

    var nationalityModelValue = "<?= htmlspecialchars($model->Citizenship) ?>";

    var dropdownData = [
        {
            countryId: '#countryId5',
            stateId: '#stateId1',
            countryModel: "<?= htmlspecialchars($model->Country)?>",
            stateModel: "<?= htmlspecialchars($model->State)?>"
        },
        {
            countryId: '#countryId4',
            stateId: '#stateId2',
            countryModel: "<?= htmlspecialchars($model->Mailing_Country)?>",
            stateModel: "<?= htmlspecialchars($model->Mailing_State)?>"
        },
        {
            countryId: jQuery("#countryId3"),
            stateId: jQuery("#stateId3"),
            countryModel: "<?= htmlspecialchars($model->Emergency_country) ?>",
            stateModel: "<?= htmlspecialchars($model->Emergency_tate) ?>"
        },
        {
            countryId: jQuery("#countryId2"),
            stateId: null, // Replace with the actual state ID
            countryModel: "<?= htmlspecialchars($model->Country_host_university) ?>",
            stateModel: null // Set to null or adjust based on your data
        },
        {
            countryId: jQuery("#countryId1"),
            stateId: null,
            countryModel: "<?= htmlspecialchars($model->Connect_host_country) ?>",
            stateModel: null
        }
    ];
</script>

<script>
    // Function to toggle the visibility and  attribute of the table and text area
    function toggleFields() {
        var selectedOption = document.getElementById('lvl_edu').value;
        var tableContainer = document.getElementById('tableContainer');
        var textareaContainer = document.getElementById('textareaContainer');
        var noneContainer = document.getElementById('noneContainer');
        var tableInputs = tableContainer.querySelectorAll('input');
        var textareaInput = document.getElementById('model-Research');

        if (selectedOption !== 'UG' && selectedOption !== 'PG') {
            tableContainer.style.display = 'none';
            textareaContainer.style.display = 'none';
            noneContainer.style.display = 'block';

            // Remove the  attribute from all input fields
            tableInputs.forEach(function (input) {
                input.removeAttribute('required');
            });

            textareaInput.removeAttribute('required');
        } else if (selectedOption === 'UG') {
            tableContainer.style.display = 'flex';
            textareaContainer.style.display = 'none';
            noneContainer.style.display = 'none';

            // Add the  attribute to input fields in the UG table
            tableInputs.forEach(function (input) {
                input.setAttribute('required', 'required');
            });

            textareaInput.removeAttribute('required');
        } else if (selectedOption === 'PG') {
            tableContainer.style.display = 'none';
            textareaContainer.style.display = 'block';
            noneContainer.style.display = 'none';

            // Remove the  attribute from input fields in the UG table
            tableInputs.forEach(function (input) {
                input.removeAttribute('required');
            });

            // Add the  attribute to the textarea in the PG section
            textareaInput.setAttribute('required', 'required');
        }
    }

    // Attach an event listener to the dropdown to trigger the toggle function
    document.getElementById('lvl_edu').addEventListener('change', toggleFields);

    // Initial state based on the default dropdown value
    toggleFields();
</script>

<?php
$this->registerJs("
        $(document).ready(function() {
        $('#model-agreement-1').on('change', function() {
            if(this.checked){
                $('.submity').show();

            }
        });
        $('#model-agreement-0').on('change', function() {
            if (this.checked) {

                $('.submity').hide();

            }
        });
        });
    ");
?>

<script src = "https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    $(document).ready(function () {
        $('.file-input').on('change', function () {
            var fileName = $(this).val().split('\\').pop();
            $(this).siblings('.file-label').text(fileName);
        });
    });
</script>