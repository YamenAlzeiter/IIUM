<?php


/** @var yii\web\View $this */

/** @var common\models\Inbound $model */


use common\widgets\inputCustomWidget;
use common\widgets\tableMakerWidget;
use yii\bootstrap5\ActiveForm;

function isFileRequired($file)
{
    return $file === null;
}

require Yii::getAlias('@common').'/Helpers/helper.php';
?>
<div>
    <!-- Step 1 Content -->
    <?php $form = ActiveForm::begin(['id' => 'myForm', 'class' => 'needs-validation']); ?>
    <input type = "hidden" name = "<?= Yii::$app->request->csrfParam ?>"
           value = "<?= Yii::$app->request->csrfToken ?>"
           required>
    <!-- Step 1 input fields -->

    <section id = "step-1" class = "form-step">
        <div class = "card w-100">
            <div class = "card-body">
                <div class = "container pt-2" style = "height: 80vh; overflow-y: auto;">
                    <?= inputCustomWidget::widget([
                        'value' => $model->Name, 'name' => 'Inbound[Name]', 'label' => 'Name', 'inputType' => 'text',
                        'length' => '255', 'required' => 'required',
                    ]) ?>
                    <div class = "row align-items-center mb-2">
                        <div class = "col-md-6">
                            <?= inputCustomWidget::widget([
                                'value' => $model->Gender, 'name' => 'Inbound[Gender]', 'inputType' => 'radio',
                                'required' => 'required', 'legend' => 'Gender:', 'options' => [
                                    'M' => 'Male', 'F' => 'Female',
                                ],]) ?>
                            <?= inputCustomWidget::widget([
                                'id' => 'relation', 'value' => $model->Relation_ship,
                                'name' => 'Inbound[Relation_ship]', 'inputType' => 'radio', 'required' => 'required',
                                'legend' => 'Marital Status:', 'options' => [
                                    'Single' => 'Single', 'Married' => 'Married',
                                ],
                            ]) ?>
                        </div>
                        <div class = "col-md-6 mt-2">
                            <?= inputCustomWidget::widget([
                                'value' => $model->Date_of_Birth, 'name' => 'Inbound[Date_of_Birth]',
                                'label' => 'Date of Birth', 'inputType' => 'date', 'required' => 'required'
                            ]) ?>
                        </div>
                    </div>
                    <div class = "row">
                        <div class = "col">
                            <?= inputCustomWidget::widget([
                                'value' => $model->Passport_Number, 'name' => 'Inbound[Passport_Number]',
                                'length' => '9', 'required' => 'required', 'label' => 'Passport Number',
                                'inputType' => 'text',
                            ]) ?>
                        </div>
                        <div class = "col">
                            <?= inputCustomWidget::widget([
                                'value' => $model->Passport_Expiration, 'name' => 'Inbound[Passport_Expiration]',
                                'label' => 'Expiration Date', 'inputType' => 'date', 'required' => 'required'
                            ]) ?>
                        </div>
                    </div>
                    <div class = "row mt-2">
                        <div class = "col-md-6">
                            <?= inputCustomWidget::widget([
                                'value' => $model->Religion, 'name' => 'Inbound[Religion]', 'label' => 'Religion',
                                'inputType' => 'text', 'length' => '100', 'required' => 'required'
                            ]) ?>
                        </div>
                        <div class = "col-md-6">
                            <?= inputCustomWidget::widget([
                                'value' => $model->Mazhab, 'name' => 'Inbound[Mazhab]', 'label' => 'Mazhab',
                                'inputType' => 'text', 'length' => '100', 'required' => 'required'
                            ]) ?>
                        </div>
                    </div>
                    <div class = "row mb-2">
                        <div class = "col-md-6">
                            <?= inputCustomWidget::widget([
                                'id' => 'validationCustomCitizenship', 'value' => $model->Citizenship,
                                'name' => 'Inbound[Citizenship]', 'required' => 'required', 'label' => 'Citizenship',
                                'inputType' => 'dropdown', 'selectOption' => 'Select your Nationality',
                            ]) ?>
                        </div>
                        <div class = "col-md-3">
                            <?= inputCustomWidget::widget([
                                'id' => 'countryId5',
                                'name' => 'Inbound[Country_of_origin]', 'required' => 'required',
                                'label' => 'Country of Origin', 'inputType' => 'dropdown',
                                'selectOption' => 'Select Country'
                            ]) ?>
                        </div>
                        <div class = "col-md-3">
                            <?= inputCustomWidget::widget([
                                'id' => 'countryId4',
                                'name' => 'Inbound[Country_of_residence]', 'required' => 'required',
                                'label' => 'Country of Residence', 'inputType' => 'dropdown',
                                'selectOption' => 'Select Country'
                            ]) ?>
                        </div>
                    </div>
                    <div class = "row mt-2">
                        <div class = "col-md-6">
                            <?= inputCustomWidget::widget([
                                'value' => $model->Mobile_Number, 'name' => 'Inbound[Mobile_Number]', 'length' => '15',
                                'required' => 'required', 'label' => 'Mobile Number', 'inputType' => 'text',
                            ]) ?>
                        </div>
                        <div class = "col-md-6">
                            <?= inputCustomWidget::widget([
                                'value' => $model->Email_address, 'name' => 'Inbound[Email_address]', 'length' => '512',
                                'required' => 'required', 'label' => 'Email Address', 'inputType' => 'text',
                            ]) ?>
                        </div>
                    </div>
                    <div class = "form__div">
			        	<textarea class = "form__input form-control" id = "validationCustomAddress" name = "Inbound[Permanent_Address]" maxlength = "255" required placeholder = ""><?= $model->Permanent_Address ?></textarea>
                        <label for = "validationCustomAddress" class = "form__label">Permanent Address</label>
                    </div>
                    <div class = "row mt-2">
                        <div class = "col-md-6">
                            <?= inputCustomWidget::widget([
                                'value' => $model->Postcode, 'name' => 'Inbound[Postcode]', 'length' => '10',
                                'required' => 'required', 'label' => 'Post Code', 'inputType' => 'text',
                            ]) ?>
                        </div>
                        <div class = "col-md-6">
                            <?= inputCustomWidget::widget([
                                'value' => $model->Country, 'id' => 'countryId3', 'name' => 'Inbound[Country]',
                                'required' => 'required', 'label' => 'Country', 'inputType' => 'dropdown',
                                'selectOption' => 'Select Country'
                            ]) ?>
                        </div>
                    </div>
                </div>
                <div class = "d-flex justify-content-between">
                    <button class = "btn btn-primary btn-navigate-form-step btn-next fs-5" type = "button" step_number = "2">Next Step</button>
                    <button class = "btn btn-outline-dark fs-5" type = "button" name = "saveWithoutValidation" onclick = "submitForm('noValidate')"><i class = "ti ti-device-floppy"></i> Save</button>
                </div>
            </div>
        </div>
    </section>
    <!-- Step 2 input fields -->
    <section id = "step-2" class = "form-step d-none">
        <div class = "card w-100">
            <div class = "card-body">
                <div class = "container pt-2" style = "height: 80vh; overflow-y: auto;">
                    <?= inputCustomWidget::widget([
                        'value' => $model->Emergency_name, 'name' => 'Inbound[Emergency_name]', 'length' => '512',
                        'required' => 'required', 'label' => 'Name', 'inputType' => 'text',
                    ]) ?>
                    <div class = "row mb-2">
                        <div class = "col-md-6">
                            <?= inputCustomWidget::widget([
                                'value' => $model->Emergency_relationship, 'name' => 'Inbound[Emergency_relationship]',
                                'length' => '255', 'required' => 'required', 'label' => 'Relationship',
                                'inputType' => 'text',
                            ]) ?>
                        </div>
                        <div class = "col-md-6">
                            <?= inputCustomWidget::widget([
                                'value' => $model->Emergency_phoneNumber, 'name' => 'Inbound[Emergency_phoneNumber]',
                                'length' => '15', 'required' => 'required', 'label' => 'Phone Number',
                                'inputType' => 'text',
                            ]) ?>
                        </div>
                        <div class = "col-md-6">
                            <?= inputCustomWidget::widget([
                                'value' => $model->Emergency_email, 'name' => 'Inbound[Emergency_email]',
                                'length' => '512', 'required' => 'required', 'label' => 'Email Address',
                                'inputType' => 'text',
                            ]) ?>
                        </div>
                    </div>
                    <div class = "row mt-2">
                        <div class = "col-md-6">
                            <div class = "form__div">
                                <textarea class = "form__input form-control" id = "validationCustomEmHomeAddress" name = "Inbound[Emergency_homeAddress]" maxlength = "255" required placeholder = " "><?= $model->Emergency_homeAddress ?></textarea>
                                <label for = "validationCustomEmHomeAddress" class = "form__label">Home Address</label>
                            </div>
                        </div>
                        <div class = "col-md-3">
                            <?= inputCustomWidget::widget([
                                'value' => $model->Emergency_postCode, 'name' => 'Inbound[Emergency_postCode]',
                                'length' => '10', 'required' => 'required', 'label' => 'Post Code',
                                'inputType' => 'text',
                            ]) ?>
                        </div>
                        <div class = "col-md-3">
                            <div class = "form__div">
                                <select class = "form__input form-control countries" id = "countryId2" name = "Inbound[Emergency_country]" required>
                                    <option value = "">Select Country</option>
                                </select>
                                <label for = "validationCustomEmergencyCountry" class = "form__label">Country</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class = "d-flex justify-content-between">
                    <div>
                        <button class = "btn btn-navigate-form-step btn-next fs-5" type = "button" step_number = "1">Back</button>
                        <button class = "btn btn-primary btn-navigate-form-step btn-next fs-5" type = "button" step_number = "3">Next Step</button>
                    </div>
                        <button class = "btn btn-outline-dark fs-5" type = "button" name = "saveWithoutValidation" onclick = "submitForm('noValidate')"><i class = "ti ti-device-floppy"></i> Save</button>
                </div>
            </div>
        </div>
    </section>
    <!-- Step 3 input fields -->
    <section id = "step-3" class = "form-step d-none">
        <div class = "card w-100">
            <div class = "card-body">
                <div class = "container pt-2" style = "height: 80vh; overflow-y: auto;">
                    <div class = "row mt-3 d-flex flex-row align-items-center">
                        <div class = "col-md-6">
                            <?= inputCustomWidget::widget([
                                'value' => $model->Academic_home_university,
                                'name' => 'Inbound[Academic_home_university]', 'length' => '512',
                                'required' => 'required', 'label' => 'Home University', 'inputType' => 'text',
                            ]) ?>
                        </div>
                        <div class = "col-md-6">
                            <?= inputCustomWidget::widget([
                                'value' => $model->Academic_lvl_edu, 'id' => 'lvl_edu',
                                'name' => 'Inbound[Academic_lvl_edu]', 'required' => 'required',
                                'label' => 'Level of Education', 'inputType' => 'dropdown',
                                'selectOption' => 'Select level of education', 'options' => [
                                    'Diploma' => 'Diploma', 'Degree' => 'Degree', 'Master' => 'Master', 'PhD' => 'PhD'
                                ],
                            ]) ?>
                        </div>
                    </div>

                    <div class = "row mt-3 d-flex flex-row align-items-center">
                        <div class = "col-md-6">
                            <?= inputCustomWidget::widget([
                                'value' => $model->Academic_name_of_programme, 'id' => 'Academic_name_of_programme',
                                'name' => 'Inbound[Academic_name_of_programme]', 'length' => '512',
                                'required' => 'required', 'label' => 'Academic Name of Programme',
                                'inputType' => 'text',
                            ]) ?>
                            <div class = "form__div">
		                    <textarea class = "form__input form-control" id = "Research_title"
                                      name = "Inbound[Research_title]"
                                      maxlength = "255"
                                      placeholder = " " required><?= $model->Research_title ?></textarea>
                                <label for = "Research_title" class = "form__label">Research Title</label>
                            </div>
                        </div>
                        <div class = "col-md-3">
                            <?= InputCustomWidget::widget([
                                'value' => $model->Academic_current_semester, 'id' => '',
                                'name' => 'Inbound[Academic_current_semester]', 'required' => 'required',
                                'label' => 'Current Semester', 'inputType' => 'dropdown',
                                'selectOption' => 'Select Semester', 'options' => (function () {
                                    $options = [];
                                    for ($i = 1; $i <= 10; $i++) {
                                        $options[$i] = 'semester '.$i;
                                    }
                                    return $options;
                                })(),
                            ]) ?>
                        </div>
                        <div class = "col-md-3">
                            <?= InputCustomWidget::widget([
                                'value' => $model->Academic_current_year, 'id' => '',
                                'name' => 'Inbound[Academic_current_year]', 'required' => 'required',
                                'label' => 'Current Year', 'inputType' => 'dropdown', 'selectOption' => 'Select Year',
                                'options' => (function () {
                                    $options = [];
                                    for ($i = 1; $i <= 6; $i++) {
                                        $options[$i] = 'Year '.$i;
                                    }
                                    return $options;
                                })(),
                            ]) ?>
                        </div>
                    </div>
                    <div class = "row mt-3 d-flex flex-row align-items-center">
                        <div class = "col-md-6">
                            <?= inputCustomWidget::widget([
                                'value' => $model->Academic_name_of_faculty,
                                'name' => 'Inbound[Academic_name_of_faculty]', 'length' => '512',
                                'required' => 'required', 'label' => 'Academic Name of Faculty', 'inputType' => 'text',
                            ]) ?>
                        </div>
                        <div class = "col-md-6">
                            <?= inputCustomWidget::widget([
                                'value' => $model->Academic_current_result,
                                'name' => 'Inbound[Academic_current_result]', 'required' => 'required',
                                'label' => 'Current CGPA', 'inputType' => 'text',
                            ]) ?>
                        </div>
                    </div>

                    <div class = "row mt-3 d-flex flex-row align-items-center">
                        <?= inputCustomWidget::widget([
                            'value' => $model->Mou_or_Moa, 'name' => 'Inbound[Mou_or_Moa]', 'inputType' => 'radio',
                            'id' => 'Mou_or_Moa', 'required' => 'required',
                            'legend' => 'Does your University has MoU/ MoA with IIUM?', 'options' => [
                                '1' => 'Yes', '0' => 'No',
                            ],
                        ]) ?>
                    </div>

                    <h4 class = "text-capitalize mt-4">language proficiency</h4>

                    <div class = "row mt-3 d-flex flex-row align-items-center">
                        <?= inputCustomWidget::widget([
                            'value' => $model->English_native, 'name' => 'Inbound[English_native]',
                            'inputType' => 'radio', 'id' => 'English_native', 'required' => 'required',
                            'legend' => 'Is English your First/ Main Language? ', 'options' => [
                                '1' => 'Yes', '0' => 'No',
                            ],
                        ]) ?>
                    </div>

                    <div class = "row mt-3 d-flex flex-row align-items-center">
                        <div class = "col-md-4">
                            <?= InputCustomWidget::widget([
                                'value' => $model->English_test_name, 'id' => 'English_test_name',
                                'name' => 'Inbound[English_test_name]', 'required' => 'required',
                                'label' => 'Name of English Proficiency Test', 'inputType' => 'dropdown',
                                'selectOption' => 'Select Language Proficiency', 'options' => [
                                    'TOFEL' => 'TOFEL', 'IELTS' => 'IELTS', 'OTHERs' => 'OTHERs',
                                ],
                            ]) ?>
                        </div>

                        <div class = "col-md-3">
                            <?= inputCustomWidget::widget([
                                'value' => $model->English_other_test_name,
                                'name' => 'Inbound[English_other_test_name]', 'length' => '512',
                                'id' => 'English_other_test_name', 'label' => 'Others', 'inputType' => 'text',
                            ]) ?>
                        </div>
                    </div>
                    <?php renderFileField($form, $model, 'English_certificate', "EnglishCertificate"); ?>
                </div>
                <div class = "d-flex justify-content-between">
                    <div>
                        <button class = "btn btn-navigate-form-step btn-next fs-5" type = "button" step_number = "2">Back</button>
                        <button class = "btn btn-primary btn-navigate-form-step btn-next fs-5" type = "button" step_number = "4">Next Step</button>
                    </div>
                        <button class = "btn btn-outline-dark fs-5" type = "button" name = "saveWithoutValidation" onclick = "submitForm('noValidate')"><i class = "ti ti-device-floppy"></i> Save</button>
                </div>
            </div>
        </div>
    </section>
    <!-- Step 4 input fields-->
    <section id = "step-4" class = "form-step d-none">
        <div class = "card w-100">
            <div class = "card-body">
                <div class = "container pt-2" style = "height: 80vh; overflow-y: auto;">
                    <div class = "row mt-3 d-flex flex-row align-items-center">
                        <div class = "col-md-6">

                            <?= InputCustomWidget::widget([
                                'value' => $model->Propose_type_of_programme, 'id' => 'Propose_type_of_programme',
                                'name' => 'Inbound[Propose_type_of_programme]', 'required' => 'required',
                                'label' => 'Type of Programme', 'inputType' => 'dropdown',
                                'selectOption' => 'Select Type of Programme', 'options' => [
                                    'Exchange Program (1 or 2 semesters)' => 'Exchange Program (1 or 2 semesters)',
                                    'Erasmus Exchange Program' => 'Erasmus Exchange Program',
                                    'Mevlana Exchange Program' => 'Research Program',
                                    'Internship Programme' => 'Internship Programme',
                                    'Summer Program' => 'Summer Program',
                                    'Short Visiting Programme' => 'Short Visiting Programme',
                                    'University Mobility in Asia and the Pacific (UMAP) Programme' => 'University Mobility in Asia and the Pacific (UMAP) Programme',
                                    'Other' => 'Other',
                                ],
                            ]) ?>
                        </div>
                        <div class = "col-md-6">
                            <?= inputCustomWidget::widget([
                                'value' => $model->Propose_type_of_programme_other,
                                'name' => 'Inbound[Propose_type_of_programme_other]', 'length' => '512',
                                'id' => 'validationTypeProgramOther', 'label' => 'Others (Please specify)',
                                'inputType' => 'text',
                            ]) ?>
                        </div>
                    </div>

                    <div class = "row mt-3 d-flex flex-row align-items-center">
                        <?= inputCustomWidget::widget([
                            'value' => $model->Propose_type_of_mobility, 'name' => 'Inbound[Propose_type_of_mobility]',
                            'inputType' => 'radio', 'id' => 'Propose_type_of_mobility', 'required' => 'required',
                            'legend' => 'Type of Mobility', 'options' => [
                                '1' => 'Physical', '2' => 'Virtual',
                            ],
                        ]) ?>
                    </div>
                    <?= inputCustomWidget::widget([
                        'value' => $model->Propose_transfer_credit_hours,
                        'name' => 'Inbound[Propose_transfer_credit_hours]', 'inputType' => 'radio',
                        'id' => 'Propose_duration_of_study', 'required' => 'required',
                        'legend' => 'Transfer of Credit Hours', 'options' => [
                            '1' => 'Yes', '0' => 'No',
                        ],
                    ]) ?>
                    <div class = "row mt-2 d-flex flex-row align-items-center">
                        <div class = "col-md-6">
                            <?= inputCustomWidget::widget([
                                'value' => $model->Propose_kulliyyah_applied,
                                'name' => 'Inbound[Propose_kulliyyah_applied]', 'length' => '512',
                                'label' => 'Kulliyyah Applied', 'inputType' => 'text',
                            ]) ?>
                        </div>
                        <div class = "col-md-3">
                            <?= inputCustomWidget::widget([
                                'value' => $model->Propose_duration_start, 'name' => 'Inbound[Propose_duration_start]',
                                'id' => "Propose_duration_start", 'minDate' => true, 'label' => 'Mobility From',
                                'inputType' => 'date',
                            ]) ?>
                        </div>
                        <div class = "col-md-3">
                            <?= inputCustomWidget::widget([
                                'value' => $model->Propose_duration_end, 'name' => 'Inbound[Propose_duration_end]',
                                'id' => "Propose_duration_end", 'label' => 'Mobility Until', 'inputType' => 'date',
                            ]) ?>
                        </div>
                    </div>

                    <!--	table location-->
                    <div class = "container mt-lg-5">
                        <div class = "row" id = "tableContainer">
                            <div class = "col">
                                <h4 class = "text-center mb-4">Courses offered by host University</h4>
                                <?= tableMakerWidget::widget([
                                    'tableId' => 'your_table_id',
                                    'tableData' => $coursesData, // Pass your data array here
                                    'modelName' => 'CoursesModel', // Pass your model name here
                                ]) ?>
                            </div>
                        </div>
                    </div>
                </div>
                <div class = "d-flex justify-content-between">
                    <div>
                        <button class = "btn btn-navigate-form-step btn-next fs-5" type = "button" step_number = "3">Back</button>
                        <button class = "btn btn-primary btn-navigate-form-step btn-next fs-5" type = "button" step_number = "5">Next Step</button>
                    </div>
                        <button class = "btn btn-outline-dark fs-5" type = "button" name = "saveWithoutValidation" onclick = "submitForm('noValidate')"><i class = "ti ti-device-floppy"></i> Save</button>
                </div>
            </div>
        </div>
    </section>
    <!--Step 5 input fields-->
    <section id = "step-5" class = "form-step d-none">
        <div class = "card w-100">
            <div class = "card-body">
                <div class = "container pt-2" style = "height: 80vh; overflow-y: auto;">
                    <div class = "row mt-3 d-flex flex-row align-items-center">
                        <?= inputCustomWidget::widget([
                            'value' => $model->Financial_accommodation_on_campus,
                            'name' => 'Inbound[Financial_accommodation_on_campus]', 'inputType' => 'radio',
                            'required' => 'required', 'legend' => 'Accommodation on Campus', 'options' => [
                                '1' => 'Yes', '0' => 'No',
                            ],
                        ]) ?>
                    </div>
                    <div class = "row mt-2">
                        <div class = "col-md-6">
                            <?= InputCustomWidget::widget([
                                'value' => $model->campus_location, 'id' => 'campus_location',
                                'name' => 'Inbound[campus_location]', 'required' => 'required',
                                'label' => 'Campus Location', 'inputType' => 'dropdown',
                                'selectOption' => 'Select Campus Location', 'options' => [
                                    "Main Campus, IIUM Gombak" => "Main Campus, IIUM Gombak",
                                    "Kuantan Campus, IIUM Kuantan" => "Kuantan Campus, IIUM Kuantan",
                                    "Pagoh Campus, IIUM Pagoh" => "Pagoh Campus, IIUM Pagoh",
                                    "Off Campus" => "Off Campus",
                                ],
                            ]) ?>
                        </div>
                        <div class = "col-md-6">
                            <?= InputCustomWidget::widget([
                                'value' => $model->Room_type, 'id' => 'Room_type', 'name' => 'Inbound[Room_type]',
                                'required' => 'required', 'label' => 'Room Type', 'inputType' => 'dropdown',
                                'selectOption' => 'Select Room Type', 'options' => [
                                    "Single Room(for PG Students) RM360/Month" => "Single Room(for PG Students) RM360/Month",
                                    "Quad Room(for UG Students) RM360/Month" => "Quad Room(for UG Students) RM360/Month",
                                ],
                            ]) ?>
                        </div>
                    </div>
                    <h4 class = "text-capitalize mt-4">Financial Details</h4>
                    <?= inputCustomWidget::widget([
                        'value' => $model->Financial_funding, 'name' => 'Inbound[Financial_funding]',
                        'inputType' => 'radio', 'required' => 'required', 'legend' => 'Accommodation on Campus',
                        'options' => [
                            'Self-sponsor' => 'Self-sponsor', 'Scholarship' => 'Scholarship',
                        ],
                    ]) ?>
                    <div class = "row mt-2" id = "ScholarshipSponser">
                        <div class = "col-md-6">
                            <?= inputCustomWidget::widget([
                                'value' => $model->Sponsor_name, 'name' => 'Inbound[Sponsor_name]', 'length' => '100',
                                'id' => 'validationCustomSponsor_name', 'label' => 'Sponsor Name',
                                'inputType' => 'text', 'required' => 'required'
                            ]) ?>
                        </div>
                        <div class = "col-md-6">
                            <?= inputCustomWidget::widget([
                                'value' => $model->Financial_funding_sponsor_amount,
                                'name' => 'Inbound[Financial_funding_sponsor_amount]', 'length' => '100',
                                'id' => 'validationCustomFinancial_funding_sponsor_amount', 'label' => 'Amount',
                                'inputType' => 'text', 'required' => 'required'
                            ]) ?>
                        </div>
                    </div>
                    <div class = "row mt-2" id = "otherFunding">
                        <div class = "col">
                            <div class = "form__div">
                                <textarea class = "form__input form-control" id = "Financial_funding_other" name = "Inbound[Financial_funding_other]" maxlength = "255" required placeholder = " "><?= $model->Financial_funding_other ?></textarea>
                                <label for = "Financial_funding_other" class = "form__label">Please Specify</label>
                            </div>
                        </div>

                    </div>
                </div>
                <input type = "hidden" name = "Inbound[Status]" id = "statusInput" value = "<?= $model->Status ?>">
                <div class = "d-flex justify-content-between">
                    <div>
                        <button class = "btn btn-navigate-form-step btn-next fs-5" type = "button" step_number = "4">Back</button>
                        <button class = "btn btn-primary btn-navigate-form-step btn-next fs-5" type = "button" step_number = "6">Next Step</button>
                    </div>
                        <button class = "btn btn-outline-dark fs-5" type = "button" name = "saveWithoutValidation" onclick = "submitForm('noValidate')"><i class = "ti ti-device-floppy"></i> Save</button>
                </div>
    </section>
    <!-- Step 6 input fields -->
    <section id = "step-6" class = "form-step d-none">
        <div class = "card w-100">
            <div class = "card-body">
                <div class = "container pt-2" style = "height: 80vh; overflow-y: auto;">
                    <p class = "font-monospace">I hereby certify that my home university has recommended me to join the proposed study program at International Islamic University Malaysia (IIUM) as per duration stated. The following is the officer that approved my application from my home university.</p>
                    <div class = "row align-items-center mb-2">
                        <div class = "col-md-6">
                            <?= inputCustomWidget::widget([
                                'value' => $model->Approval_university_person_name,
                                'name' => 'Inbound[Approval_university_person_name]', 'length' => '512',
                                'label' => 'Name', 'inputType' => 'text', 'required' => 'required'
                            ]) ?>
                        </div>
                        <div class = "col-md-6">
                            <?= inputCustomWidget::widget([
                                'value' => $model->Approval_person_position,
                                'name' => 'Inbound[Approval_person_position]', 'length' => '512', 'label' => 'Position',
                                'inputType' => 'text', 'required' => 'required'
                            ]) ?>
                        </div>
                    </div>

                    <div class = "row mt-2">
                        <div class = "col-md-6">
                            <?= inputCustomWidget::widget([
                                'value' => $model->Approval_person_mobile_number,
                                'name' => 'Inbound[Approval_person_mobile_number]', 'length' => '16',
                                'label' => 'Mobile Number', 'inputType' => 'text', 'required' => 'required'
                            ]) ?>
                        </div>
                        <div class = "col-md-6">
                            <?= inputCustomWidget::widget([
                                'value' => $model->Approval_person_email, 'name' => 'Inbound[Approval_person_email]',
                                'length' => '512', 'label' => 'Email Address', 'inputType' => 'email',
                                'required' => 'required'
                            ]) ?>
                        </div>
                    </div>
                    <div class = "row">
                        <div class = "col">
                            <?= inputCustomWidget::widget([
                                'value' => $model->Approval_date, 'name' => 'Inbound[Approval_date]',
                                'label' => 'Approval Date', 'inputType' => 'date', 'required' => 'required'
                            ]) ?>
                        </div>
                    </div>
                    <?php renderFileField($form, $model, 'Recommendation_letter', "RecommendationLetter"); ?>
                </div>

                <div class = "d-flex justify-content-between">
                    <div>
                        <button class = "btn btn-navigate-form-step btn-next fs-5" type = "button" step_number = "5">Back</button>
                        <button class = "btn btn-primary btn-navigate-form-step btn-next fs-5" type = "button" step_number = "7">Next Step</button>
                    </div>
                        <button class = "btn btn-outline-dark fs-5" type = "button" name = "saveWithoutValidation" onclick = "submitForm('noValidate')"><i class = "ti ti-device-floppy"></i> Save</button>
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
                    <p class = "font-monospace">I declare that all the information provided in this application from is true and complete in every detail. I acknowledge that International Islamic University Malaysia (IIUM) reserves the right to vary or reverse any decision regarding admission or enrolment made on the basis of incorrect or incomplete information. I am aware of the conditions relating to my application and admission and agree to pay all fees for which I am liable to.</p>
                    <div class = "form-check">
                        <input type = "checkbox" class = "form-check-input" id = "declaration-checkbox" required>
                        <label class = "form-check-label fw-bolder" for = "declaration-checkbox">I agree to the terms stated above.</label>
                    </div>
                </div>
                <div class = "d-flex justify-content-between">
                    <button class = "btn btn-navigate-form-step btn-next fs-5" type = "button" step_number = "6">Back</button>
                    <div>
                        <button class = "btn btn-outline-dark fs-5" type = "button" name = "saveWithoutValidation" onclick = "submitForm('noValidate')"><i class = "ti ti-device-floppy"></i> Save</button>
                        <button class = "btn btn-dark submit-btn px-3 fs-5" type = "button" name = "saveWithoutValidation" value = "validate" onclick = "submitForm('validate')" id = "submitButton" disabled><i class = "ti ti-send"></i>Submit</button>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
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
            stateId: null,
            countryModel: "<?= htmlspecialchars($model->Country_of_origin)?>",
            stateModel: null,
        },
        {
            countryId: '#countryId4',
            stateId: null,
            countryModel: "<?= htmlspecialchars($model->Country_of_residence)?>",
            stateModel: null,
        },
        {
            countryId: jQuery("#countryId3"),
            stateId: null,
            countryModel: "<?= htmlspecialchars($model->Country) ?>",
            stateModel: null,
        },
        {
            countryId: jQuery("#countryId2"),
            stateId: null, // Replace with the actual state ID
            countryModel: "<?= htmlspecialchars($model->Emergency_country) ?>",
            stateModel: null // Set to null or adjust based on your data
        },
    ];
</script>

<script>
    $(document).ready(function () {
        function handleRadioChange() {
            // Hide all elements initially and remove 'required' attribute from all inputs
            $('#ScholarshipSponser, #otherFunding').hide();
            $('#validationCustomSponsor_name, #validationCustomFinancial_funding_sponsor_amount, #Financial_funding_other')
                .prop('required', false);
            if ($('#Self-sponsor').prop('checked')) {
                // No need to do anything for 'Self-sponsor'
            } else if ($('#Scholarship').prop('checked')) {
                // Show elements for 'Scholarship' and make Sponsor Name and Amount required
                $('#ScholarshipSponser').show();
                $('#validationCustomSponsor_name, #validationCustomFinancial_funding_sponsor_amount')
                    .prop('required', true);
            } else if ($('#Financial_funding_other').prop('checked')) {
                // Show elements for 'Other' and make 'Please Specify' required
                $('#otherFunding').show();
                $('#Financial_funding_other').prop('required', true);
            }
        }

        handleRadioChange();
        $('#Self-sponsor, #Scholarship, #Financial_funding_other')
            .on('change', function () {
                handleRadioChange();
            });
    });
</script>

<script>
    $(document).ready(function () {
        $('#model-agreement-1').on('change', function () {
            if (this.checked) {
                $('.submity').show();

            }
        });
        $('#model-agreement-0').on('change', function () {
            if (this.checked) {

                $('.submity').hide();

            }
        });
    });
</script>


<script src = "https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    $(document).ready(function () {
        $('.file-input').on('change', function () {
            var fileName = $(this).val().split('\\').pop();
            $(this).siblings('.file-label').text(fileName);
        });
    });
</script>


<script>
    function toggleDropdownOnLoad() {
        var dropdown = document.getElementById("campus_location");
        var secondDropdown = document.getElementById("secondDropdown");
        var room_type = document.getElementById("Room_type")
        if (dropdown.value === "Off Campus") {
            secondDropdown.style.display = "none";
            room_type.removeAttribute('required');
            room_type.value = "";
        } else {
            secondDropdown.style.display = "flex";
            room_type.setAttribute('required', true);

        }
    }

    window.onload = toggleDropdownOnLoad;
</script>


<script>
    // Get the start date input element
    const startDateInput = document.getElementById('Propose_duration_start');
    // Get the end date input element
    const endDateInput = document.getElementById('Propose_duration_end');

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
    window.addEventListener('load', function () {
        if (startDateInput.value) {
            setEndDateMinValue();
        }
    });
</script>
