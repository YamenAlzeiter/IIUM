<?php

use common\models\Courses;
use common\models\Iiumcourse;


use yii\bootstrap5\Html;
use yii\bootstrap5\ActiveForm;

/** @var yii\web\View $this */
/** @var common\models\Inbound $model */


?>
<div>
	<!-- Step 1 Content -->
	<form id = "myForm" class = " needs-validation"
	      method = "post"
	      enctype = "multipart/form-data" novalidate>
		<input type = "hidden" name = "<?= Yii::$app->request->csrfParam ?>"
		       value = "<?= Yii::$app->request->csrfToken ?>"
		       required>
		<!-- Step 1 input fields -->
		<section id = "step-1" class = "form-step">
			<div class = "form__div">
				<input type = "text" class = "form__input form-control" id = "validationCustomName"
				       name = "Inbound[Name]"
				       maxlength = "255" placeholder = " " value = "<?= $model->Name ?>" required>
				<label for = "validationCustomName" class = "form__label">Name</label>
			</div>
			<div class = "row align-items-center mb-2">
				<div class = "col-md-6">
					<div class = "row-md-6 mb-2">
						<legend class = "col-form-label col-sm-2 pt-0">Gender:</legend>
						<div class = "form-check form-check-inline">
							<input id = "gender_male" type = "radio" name = "Inbound[Gender]" value = "M"
							       class = "form-check-input" <?= $model->Gender === 'M' ? 'checked' : '' ?> required>
							<label for = "gender_male" class = "form-check-label">Male</label>
						</div>
						<div class = "form-check form-check-inline pl-3">
							<input id = "gender_female" type = "radio" name = "Inbound[Gender]" value = "F"
							       class = "form-check-input" <?= $model->Gender === 'F' ? 'checked' : '' ?>>
							<label for = "gender_female" class = "form-check-label">Female</label>
						</div>
					</div>
					<div class = "row-md-6 mb-2">
						<legend class = "col-form-label col-sm-2 pt-0">Marital Status:</legend>
						<div class = "form-check form-check-inline">
							<input id = "relation-single" type = "radio" name = "Inbound[Relation_ship]"
							       value = "Single"
							       class = "form-check-input" <?= $model->Relation_ship === 'Single' ? 'checked' : '' ?>
							       required>
							<label for = "relation-single" class = "form-check-label">Single</label>
						</div>
						<div class = "form-check form-check-inline pl-3">
							<input id = "relation-married" type = "radio" name = "Inbound[Relation_ship]"
							       value = "Married"
							       class = "form-check-input" <?= $model->Relation_ship === 'Married' ? 'checked' : '' ?>>
							<label for = "relation-married" class = "form-check-label">Married</label>
						</div>
					</div>
				</div>
				<div class = "col-md-6 mt-2">
					<div class = "form__div">
						<input type = "date" class = "form__input form-control" name = "Inbound[Date_of_Birth]"
						       placeholder = " " value = "<?= $model->Date_of_Birth ?>" required>
						<label for = "validationCustomPassport" class = "form__label">Date of Birth</label>
					</div>
				</div>
			</div>
			<div class = "row">
				<div class = "col">
					<div class = "form__div">
						<input type = "text" class = "form__input form-control" id = "validationCustomPassport"
						       name = "Inbound[Passport_Number]"
						       maxlength = "255" placeholder = " "
						       value = "<?= $model->Passport_Number ?>" required>
						<label for = "validationCustomPassport" class = "form__label">Passport Number</label>
					</div>
				</div>
				<div class = "col">
					<div class = "form__div">
						<input type = "date" class = "form__input form-control" name = "Inbound[Passport_Expiration]"
						       placeholder = " "
						       value = "<?= $model->Passport_Expiration ?>" required>
						<label for = "validationCustomPassport" class = "form__label">Expiration Date</label>
					</div>
				</div>
			</div>
			<div class = "row mt-2">
				<div class = "col-md-6">
					<div class = "form__div">
						<input type = "text" class = "form__input form-control" id = "validationCustomMobile"
						       name = "Inbound[Religion]"
						       maxlength = "255" placeholder = " " value = "<?= $model->Religion ?>" required>
						<label for = "validationCustomMobile" class = "form__label">Religion</label>
					</div>
				</div>
				<div class = "col-md-6">
					<div class = "form__div">
						<input type = "text" class = "form__input form-control" id = "validationCustomMazhab"
						       name = "Inbound[Mazhab]"
						       maxlength = "100" placeholder = " " value = "<?= $model->Mazhab ?>" required>
						<label for = "validationCustomMazhab" class = "form__label">Mazhab</label>
					</div>
				</div>
			</div>
			<div class = "row mb-2">
				<div class = "col-md-6">
					<div class = "form__div">

						<select class = "form__input form-control countries" id = "validationCustomCitizenship"
						        name = "Inbound[Citizenship]" required>
							<option value = "">Select Nationality</option>
						</select>
						<label for = "validationCustomCitizenship" class = "form__label">Citizenship</label>
					</div>
				</div>
				<div class = "col-md-3">
					<div class = "form__div">
						<select class = "form__input form-control countries" id = "countryId5"
						        name = "Inbound[Country_of_origin]"
						        required>
							<option value = "">Select Country</option>
						</select>
						<label for = "validationCustomCountryOFOrigin" class = "form__label">Country of Origion</label>
					</div>
				</div>
				<div class = "col-md-3">
					<div class = "form__div">
						<select class = "form__input form-control countries" id = "countryId4"
						        name = "Inbound[Country_of_residence]"
						        required>
							<option value = "">Select Country</option>
						</select>
						<label for = "validationCustomCounryOfResidence" class = "form__label">Country of Residence</label>
					</div>
				</div>
			</div>
			<div class = "row mt-2">
				<div class = "col-md-6">
					<div class = "form__div">
						<input type = "tel" class = "form__input form-control" id = "validationCustomMobile"
						       name = "Inbound[Mobile_Number]"
						       maxlength = "255" placeholder = " " value = "<?= $model->Mobile_Number ?>" required>
						<label for = "validationCustomMobile" class = "form__label">Mobile Number</label>
					</div>
				</div>
				<div class = "col-md-6">
					<div class = "form__div">
						<input type = "email" class = "form__input form-control" id = "validationCustomEmail"
						       name = "Inbound[Email_address]"
						       maxlength = "100" placeholder = " " value = "<?= $model->Email_address ?>" required>
						<label for = "validationCustomEmail" class = "form__label">Email Address</label>
					</div>
				</div>
			</div>
			<div class = "form__div">
				<textarea class = "form__input form-control" id = "validationCustomAddress"
				          name = "Inbound[Permanent_Address]" maxlength = "255" required
				          placeholder = ""><?= $model->Permanent_Address ?></textarea>
				<label for = "validationCustomAddress" class = "form__label">Permanent Address</label>
			</div>
			<div class = "row mt-2">
				<div class = "col-md-6">
					<div class = "form__div">
						<input class = "form__input form-control" id = "validationCustomPostcode"
						       name = "Inbound[Postcode]"
						       value = "<?= $model->Postcode ?>"
						       required placeholder = " ">
						<label for = "validationCustomPostcode" class = "form__label">Postal Code</label>
					</div>
				</div>
				<div class = "col-md-6">
					<div class = "form__div">
						<select class = "form__input form-control countries" id = "countryId3" name = "Inbound[Country]"
						        required>
							<option value = "">Select Country</option>
						</select>
						<label for = "validationCustomCountry" class = "form__label">Country</label>
					</div>
				</div>
				<div class = "mt-3 d-flex justify-content-between">
					<div>
						<div>
							<button class = "button submit-btn" type = "button" name = "saveWithoutValidation"
							        onclick = "submitForm('noValidate')">Save
							</button>
						</div>
					</div>
					<div>
						<button class = "button btn-navigate-form-step btn-next" type = "button" step_number = "2">
							Next
						</button>
					</div>
				</div>
		</section>
		<!-- Step 2 input fields -->
		<section id = "step-2" class = "form-step d-none">
			<div class = "form__div">
				<input type = "text" class = "form__input form-control" id = "validationCustomEmName"
				       name = "Inbound[Emergency_name]"
				       maxlength = "255" placeholder = " " value = "<?= $model->Emergency_name ?>" required>
				<label for = "validationCustomEmName" class = "form__label">Name</label>
			</div>
			<div class = "row mb-2">
				<div class = "col-md-6">
					<div class = "form__div">
						<input type = "text" class = "form__input form-control"
						       id = "validationCustomEmRelationship"
						       name = "Inbound[Emergency_relationship]"
						       maxlength = "255" placeholder = " " value = "<?= $model->Emergency_relationship ?>"
						       required>
						<label for = "validationCustomEmRelationship" class = "form__label">Relationship</label>
					</div>
				</div>
				<div class = "col-md-6">
					<div class = "form__div">
						<input type = "text" class = "form__input form-control" id = "validationCustomEmPhoneNumber"
						       name = "Inbound[Emergency_phoneNumber]"
						       maxlength = "255" placeholder = " " value = "<?= $model->Emergency_phoneNumber ?>"
						       required>
						<label for = "validationCustomEmPhoneNumber" class = "form__label">Phone Number</label>
					</div>
				</div>
				<div class = "col-md-6">
					<div class = "form__div">

						<input type = "email" class = "form__input form-control" id = "validationCustomEmEmail"
						       name = "Inbound[Emergency_email]"
						       maxlength = "255" placeholder = " " value = "<?= $model->Emergency_email ?>" required>
						<label for = "validationCustomEmEmail" class = "form__label">Email</label>
					</div>
				</div>
			</div>
			<div class = "row mt-2">
				<div class = "col-md-6">
					<div class = "form__div">
    <textarea class = "form__input form-control" id = "validationCustomEmHomeAddress"
              name = "Inbound[Emergency_homeAddress]"
              maxlength = "255" required placeholder = " "><?= $model->Emergency_homeAddress ?></textarea>
						<label for = "validationCustomEmHomeAddress" class = "form__label">Home Address</label>
					</div>
				</div>
				<div class = "col-md-3">
					<div class = "form__div">
						<input type = "text" class = "form__input form-control" id = "validationCustomEmPostCode"
						       name = "Inbound[Emergency_postCode]"
						       maxlength = "255" required placeholder = " " value = "<?= $model->Emergency_postCode ?>">
						<label for = "validationCustomEmPostCode" class = "form__label">Post Code</label>
					</div>
				</div>
				<div class = "col-md-3">
					<div class = "form__div">
						<select class = "form__input form-control countries" id = "countryId2"
						        name = "Inbound[Emergency_country]"
						        required>
							<option value = "">Select Country</option>
						</select>
						<label for = "validationCustomEmergencyCountry" class = "form__label">Country</label>
					</div>
				</div>
			</div>
			<div class = "mt-3 d-flex justify-content-between">
				<div>
					<div>
						<button class = "button submit-btn" type = "button" name = "saveWithoutValidation"
						        onclick = "submitForm('noValidate')">Save
						</button>
					</div>
				</div>
				<div>
					<button class = "button btn-navigate-form-step" type = "button" step_number = "1">Prev</button>
					<button class = "button btn-navigate-form-step btn-next" type = "button" step_number = "3">Next
					</button>
				</div>
			</div>
		</section>
		<!-- Step 3 input fields -->
		<section id = "step-3" class = "form-step d-none">

			<div class = "row mt-3 d-flex flex-row align-items-center">
				<div class = "col-md-6">
					<div class = "form__div">
						<input type = "text" class = "form__input form-control" id = "validationCustomProgram"
						       name = "Inbound[Academic_home_university]"
						       value = "<?= $model->Academic_home_university ?>"
						       maxlength = "255" placeholder = " " required>
						<label for = "validationCustomProgram" class = "form__label">Home University</label>
					</div>
				</div>
				<div class = "col-md-6">
					<div class = "form__div">
						<select class = "form__input form-control" id = "lvl_edu" name = "Inbound[Academic_lvl_edu]"
						        required>
							<option value = "">Select your Level of Education</option>
							<option value = "Diploma" <?php echo ($model->Academic_lvl_edu === 'Diploma') ? 'selected' : ''; ?>>
								Diploma
							</option>
							<option value = "Degree" <?php echo ($model->Academic_lvl_edu === 'Degree') ? 'selected' : ''; ?>>
								Degree
							</option>
							<option value = "Master" <?php echo ($model->Academic_lvl_edu === 'Master') ? 'selected' : ''; ?>>
								Master
							</option>
							<option value = "PhD" <?php echo ($model->Academic_lvl_edu === 'PhD') ? 'selected' : ''; ?>>
								PhD
							</option>
						</select>
						<label for = "lvl_edu" class = "form__label">Level of Education</label>
					</div>
				</div>
			</div>
			<div class = "row mt-3 d-flex flex-row align-items-center">
				<div class = "col-md-6">
					<div class = "form__div">
						<input type = "text" class = "form__input form-control" id = "Academic_name_of_programme"
						       name = "Inbound[Academic_name_of_programme]"
						       value = "<?= $model->Academic_name_of_programme ?>"
						       maxlength = "255" placeholder = " " required>
						<label for = "Academic_name_of_programme" class = "form__label">Academic Name of Programme</label>
					</div>
				</div>

				<div class = "col-md-3">
					<div class = "form__div">
						<select class = "form__input form-control" id = "Academic_current_semester"
						        name = "Inbound[Academic_current_semester]" required>
							<option value = "">Select Semester</option>
                            <?php
                            for ($i = 1; $i <= 10; $i++) {
                                echo "<option value=\"$i\" ".(($model->Academic_current_semester == $i) ? 'selected' : '').">Semester $i</option>";
                            }
                            ?>
						</select>
						<label for = "Academic_current_semester" class = "form__label">Current Semester</label>
					</div>
				</div>
				<div class = "col-md-3">
					<div class = "form__div">
						<select class = "form__input form-control" id = "Academic_current_year"
						        name = "Inbound[Academic_current_year]" required>
							<option value = "">Select Year</option>
                            <?php
                            for ($i = 1; $i <= 6; $i++) {
                                echo "<option value=\"$i\" ".(($model->Academic_current_year == $i) ? 'selected' : '').">Year $i</option>";
                            }
                            ?>
						</select>
						<label for = "Academic_current_year" class = "form__label">Current Year</label>
					</div>
				</div>
			</div>

			<div class = "row mt-3 d-flex flex-row align-items-center">
				<div class = "col-md-6">
					<div class = "form__div">
						<input type = "text" class = "form__input form-control" id = "Academic_name_of_faculty"
						       name = "Inbound[Academic_name_of_faculty]"
						       value = "<?= $model->Academic_name_of_faculty ?>"
						       maxlength = "255" placeholder = " " required>
						<label for = "Academic_name_of_faculty" class = "form__label">Name of Faculty</label>
					</div>
				</div>
				<div class = "col-md-6">
					<div class = "form__div">
						<input class = "form__input form-control" id = "Academic_current_result"
						       name = "Inbound[Academic_current_result]"
						       value = "<?= $model->Academic_current_result ?>"
						       maxlength = "255" placeholder = " " required>
						<label for = "Academic_current_result" class = "form__label">Current CGPA</label>
					</div>
				</div>
			</div>


			<div class = "form__div">
    <textarea class = "form__input form-control" id = "Research_title"
              name = "Inbound[Research_title]"
              maxlength = "255" required placeholder = " "><?= $model->Research_title ?></textarea>
				<label for = "Research_title" class = "form__label">Research Title</label>
			</div>

			<div class = "row mt-3 d-flex flex-row align-items-center">
				<div class = "row-md-12 mb-2">
					<legend class = "col-form-label col-lg-4 pt-0">Does your University has MoU/MoA with IIUM?</legend>
					<div class = "form-check form-check-inline">
						<input id = "Mou_or_Moa_yes" type = "radio" name = "Inbound[Mou_or_Moa]" value = "1"
						       class = "form-check-input" <?= $model->Mou_or_Moa === 1 ? 'checked' : '' ?> required>
						<label for = "Mou_or_Moa_yes" class = "form-check-label">Yes</label>
					</div>
					<div class = "form-check form-check-inline pl-3">
						<input id = "Mou_or_Moa_no" type = "radio" name = "Inbound[Mou_or_Moa]" value = "0"
						       class = "form-check-input" <?= $model->Mou_or_Moa === 0 ? 'checked' : '' ?>>
						<label for = "Mou_or_Moa_no" class = "form-check-label">No</label>
					</div>
				</div>
			</div>

			<h4 class = "text-capitalize mt-4">language proficiency</h4>

			<div class = "row mt-3 d-flex flex-row align-items-center">
				<div class = "row-md-12 mb-2">
					<legend class = "col-form-label col-lg-4 pt-0">Is English your First/ Main Language?</legend>
					<div class = "form-check form-check-inline">
						<input id = "English_native" type = "radio" name = "Inbound[English_native]" value = "1"
						       class = "form-check-input" <?= $model->English_native === 1 ? 'checked' : '' ?> required>
						<label for = "English_native" class = "form-check-label">Yes</label>
					</div>
					<div class = "form-check form-check-inline pl-3">
						<input id = "Mou_or_Moa_no" type = "radio" name = "Inbound[English_native]" value = "0"
						       class = "form-check-input" <?= $model->English_native === 0 ? 'checked' : '' ?>>
						<label for = "English_native" class = "form-check-label">No</label>
					</div>
				</div>
			</div>

			<div class = "row mt-3 d-flex flex-row align-items-center">
				<div class = "col-md-4">
					<div class = "form__div">
						<select class = "form__input form-control" id = "English_test_name" name = "Inbound[English_test_name]"
						        required>
							<option value = "">Select Language Proficiency</option>
                            <?php foreach (["TOFEL", "IELTS", "OTHERs"] as $option): ?>
								<option value = "<?= $option ?>" <?= ($model->English_test_name === $option) ? 'selected' : '' ?>>
                                    <?= $option ?>
								</option>
                            <?php endforeach; ?>
						</select>
						<label for = "English_test_name" class = "form__label">Name of English Proficiency Test</label>
					</div>
				</div>
				<div class = "col-md-3">
					<div class = "form__div">
						<input type = "text" class = "form__input form-control" id = "English_other_test_name"
						       name = "Inbound[English_other_test_name]"
						       value = "<?= $model->English_other_test_name ?>"
						       maxlength = "255" placeholder = " " required>
						<label for = "English_other_test_name" class = "form__label">Others</label>
					</div>
				</div>
			</div>
            <?php
            $template = '
<div class="row mb-3">
    <div class="col-md-6">
        <div class="mb-3">
            <label for="{inputId}" class="form-label">{labelText}</label>
        </div>
    </div>
    <div class="col-md-6">
        <div class="input-group">
            <input type="file" class="form-control file-input" id="{inputId}" name="{inputName}" accept=".pdf, .docx" {requiredAttribute}>
        </div>
    </div>
</div>
';

            // Function to check if the file is required
            function isFileRequired($file)
            {
                return $file === null;
            }

            // File input sections
            echo strtr($template, [
                '{inputId}' => 'Englishcertificate', '{labelText}' => 'English certificate',
                '{inputName}' => 'Inbound[English_certificate]',
                '{requiredAttribute}' => isFileRequired($model->English_certificate) ? 'required' : '',
            ]);
            ?>
			<div class = "mt-3 d-flex justify-content-between">
				<div>
					<button class = "button submit-btn" type = "button" name = "saveWithoutValidation"
					        onclick = "submitForm('noValidate')">Save
					</button>
				</div>
				<div>
					<button class = "button btn-navigate-form-step" type = "button" step_number = "2">Prev</button>
					<button class = "button btn-navigate-form-step btn-next" type = "button" step_number = "4">Next
					</button>
				</div>
			</div>
		</section>
		<!-- Step 4 input fields-->
		<section id = "step-4" class = "form-step d-none">

			<div class = "row mt-3 d-flex flex-row align-items-center">
				<div class = "col-md-6">
					<div class = "form__div">
						<select class = "form__input form-control" id = "Propose_type_of_programme"
						        name = "Inbound[Propose_type_of_programme]"
						        required>
							<option value = "">Select Type of Programme</option>
                            <?php
                            $programOptions = [
                                "Exchange Program (1 or 2 semesters)", "Erasmus Exchange Program",
                                "Mevlana Exchange Program", "Research Program", "Internship Programme",
                                "Summer Program", "Short Visiting Programme",
                                "University Mobility in Asia and the Pacific (UMAP) Programme", "Other"
                            ];

                            foreach ($programOptions as $option) {
                                $selected = ($model->Propose_type_of_programme === $option) ? 'selected' : '';
                                echo "<option value=\"".htmlspecialchars($option)."\" $selected>$option</option>";
                            }
                            ?>
						</select>
						<label for = "Propose_type_of_programme" class = "form__label">Type of Programme</label>
					</div>
				</div>
				<div class = "col-md-6">
					<div class = "form__div">
						<input type = "text" class = "form__input form-control"
						       id = "validationCustomTypeProgramOther"
						       name = "Inbound[Propose_type_of_programme_other]"
						       maxlength = "255" placeholder = " "
						       value = "<?= $model->Propose_type_of_programme_other ?>">
						<label for = "validationCustomTypeProgramOther" class = "form__label">Others (Please
						                                                                      specify)</label>
					</div>
				</div>
			</div>
			<div class = "row mt-3 d-flex flex-row align-items-center">
				<div class = "col-6">
					<div class = "row">
						<legend class = "col-3 col-form-label">Type of Mobility</legend>
						<div class = "col py-2-5">
							<div class = "form-check form-check-inline">
								<input id = "Propose_type_of_mobility" type = "radio" name = "Inbound[Propose_type_of_mobility]" value = "1"
								       class = "form-check-input" <?= $model->Propose_type_of_mobility === 1 ? 'checked' : '' ?> required>
								<label for = "Propose_type_of_mobility" class = "form-check-label">Physical</label>
							</div>
							<div class = "form-check form-check-inline pl-3">
								<input id = "Propose_type_of_mobility_no" type = "radio" name = "Inbound[Propose_type_of_mobility]" value = "2"
								       class = "form-check-input" <?= $model->Propose_type_of_mobility === 2 ? 'checked' : '' ?>>
								<label for = "Propose_type_of_mobility_no" class = "form-check-label">Virtual</label>
							</div>
						</div>
					</div>
				</div>


				<div class = "col-md-6">
					<div class = "form__div">
						<input type = "text" class = "form__input form-control"
						       id = "Propose_kulliyyah_applied"
						       name = "Inbound[Propose_kulliyyah_applied]"
						       maxlength = "255" placeholder = " " value = "<?= $model->Propose_kulliyyah_applied ?>">
						<label for = "Propose_kulliyyah_applied" class = "form__label">Others (Please
						                                                               specify)</label>
					</div>
				</div>
			</div>

			<div class = "row mt-2 d-flex flex-row align-items-center">
				<div class = "col-md-3">
					<div class = "form__div">
						<input type = "date" class = "form__input form-control" id = "Propose_duration_start"
						       name = "Inbound[Propose_duration_start]" required
						       value = "<?= htmlspecialchars($model->Propose_duration_start ?? '') ?>">
						<label for = "Propose_duration_start" class = "form__label">Mobility From</label>
					</div>
				</div>
				<div class = "col-md-3">
					<div class = "form__div">
						<input type = "date" class = "form__input form-control" id = "Propose_duration_end"
						       name = "Inbound[Propose_duration_end]" required
						       value = "<?= htmlspecialchars($model->Propose_duration_end ?? '') ?>">
						<label for = "Propose_duration_end" class = "form__label">Mobility Until</label>
					</div>
				</div>
			</div>

			<div class = "col-6">
				<div class = "row">
					<legend class = "col-3 col-form-label">Transfer of Credit Hours</legend>
					<div class = "col py-2-5">
						<div class = "col py-2-5">
							<div class = "form-check form-check-inline">
								<input id = "Propose_duration_of_study_semester" type = "radio" name = "Inbound[Propose_duration_of_study]" value = "Semester"
								       class = "form-check-input" <?= $model->Propose_duration_of_study === "Semester" ? 'checked' : '' ?> required>
								<label for = "Propose_duration_of_study_semester" class = "form-check-label">Semester</label>
							</div>
							<div class = "form-check form-check-inline pl-3">
								<input id = "Propose_duration_of_study_others" type = "radio" name = "Inbound[Propose_duration_of_study]" value = "Others"
								       class = "form-check-input" <?= $model->Propose_duration_of_study === "Others" ? 'checked' : '' ?>>
								<label for = "Propose_duration_of_study_others" class = "form-check-label">Others</label>
							</div>
						</div>
					</div>
				</div>
			</div>

			<h4 class = "text-capitalize mt-4">Proposed courses of study at iium</h4>

			<!--	table location-->
			<div class = "container mt-lg-5">
				<div class = "row" id = "tableContainer">
					<div class = "col">
						<h4 class = "text-center mb-4">Courses offered by host University</h4>
						<table class = "table">
							<thead>
							<tr>
								<th style = "width: 30%">Course Code</th>
								<th style = "width: 50%">Course Name</th>
								<th style = "width: 20%">Credit Hours</th>
							</tr>
							</thead>
							<tbody>
                            <?php for ($i = 0; $i < 7; $i++) : ?>
								<tr>
									<td class="py-2 px-1">
										<input type="hidden" name="CoursesModel[<?= $i ?>][id]"
										       value="<?= isset($coursesData[$i]['id']) ? $coursesData[$i]['id'] : '' ?>">
										<input type="text" class="form-control"
										       name="CoursesModel[<?= $i ?>][course_code]" placeholder="Course Code"
										       value="<?= isset($coursesData[$i]['course_code']) ? $coursesData[$i]['course_code'] : '' ?>"
										>
									</td>
									<td class="py-2 px-1">
										<input type="text" class="form-control"
										       name="CoursesModel[<?= $i ?>][course_name]" placeholder="Course Name"
										       value="<?= isset($coursesData[$i]['course_name']) ? $coursesData[$i]['course_name'] : '' ?>"
										>
									</td>
									<td class="py-2 px-1">
										<input type="text" class="form-control"
										       name="CoursesModel[<?= $i ?>][credit_hours]" placeholder="Credit Hours"
										       value="<?= isset($coursesData[$i]['credit_hours']) ? $coursesData[$i]['credit_hours'] : '' ?>"
										>
									</td>
								</tr>
                            <?php endfor; ?>

							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class = "mt-3 d-flex justify-content-between">
				<div>
					<button class = "button submit-btn" type = "button" name = "saveWithoutValidation"
					        onclick = "submitForm('noValidate')">Save
					</button>
				</div>
				<div>
					<button class = "button btn-navigate-form-step" type = "button" step_number = "3">Prev</button>
					<button class = "button btn-navigate-form-step btn-next" type = "button" step_number = "5">Next
					</button>
				</div>

			</div>
		</section>
		<!--Step 5 input fields-->
		<section id = "step-5" class = "form-step d-none">

			<div class = "row mt-3 d-flex flex-row align-items-center">
				<div class = "col-md-6 d-flex flex-row align-items-center">
					<legend class = "col-4 col-form-label">Accommodation on Campus</legend>
					<div class = "col-4 py-2-5">
						<div class = "form-check form-check-inline">
							<input type = "radio" class = "form-check-input" id = "credit_transfer_availability_1"
							       name = "Inbound[Financial_accommodation_on_campus]" value = 1
                                <?= ($model->Financial_accommodation_on_campus == 1) ? 'checked' : '' ?>>
							<label class = "form-check-label" for = "credit_transfer_availability_1">Yes</label>
						</div>
						<div class = "form-check form-check-inline">
							<input type = "radio" class = "form-check-input" id = "credit_transfer_availability_0"
							       name = "Inbound[Financial_accommodation_on_campus]" value = 0
                                <?= ($model->Financial_accommodation_on_campus == 0) ? 'checked' : '' ?>>
							<label class = "form-check-label" for = "credit_transfer_availability_0">No</label>
						</div>
					</div>
				</div>
				<div class = "col-md-6">
					<div class = "form__div">
						<select class = "form__input form-control" id = "campus_location"
						        name = "Inbound[campus_location]" required onchange = "toggleDropdownOnLoad()">
							<option value = "">Select Campus Location</option>
                            <?php
                            $programOptions = [
                                "Main Campus, IIUM Gombak", "Kuantan Campus, IIUMKuantan", "Pagoh Campus, IIUM Pagoh",
                                "Off Campus"
                            ];

                            foreach ($programOptions as $option) {
                                $selected = ($model->campus_location === $option) ? 'selected' : '';
                                echo "<option value=\"".htmlspecialchars($option)."\" $selected>$option</option>";
                            }
                            ?>
						</select>
						<label for = "campus_location" class = "form__label">Campus Location</label>
					</div>
				</div>
			</div>
			<div class = "row mt-3" id = "secondDropdown" style = "display: none;">
				<div class = "col">
					<div class = "form__div">
						<select class = "form__input form-control" id = "Room_type"
						        name = "Inbound[Room_type]">
							<option value = "">Select Campus Location</option>
                            <?php
                            $programOptions = [
                                "Single Room(for PG Students) RM360/Month", "Quad Room(for UG Students) RM360/Month",
                            ];

                            foreach ($programOptions as $option) {
                                $selected = ($model->Room_type === $option) ? 'selected' : '';
                                echo "<option value=\"".htmlspecialchars($option)."\" $selected>$option</option>";
                            }
                            ?>
						</select>
						<label for = "Room_type" class = "form__label">Campus Location</label>
					</div>
				</div>
			</div>


			<h4 class = "text-capitalize mt-4">Financial Details</h4>

			<div class = "row mt-3 d-flex flex-row align-items-center">
				<div class = "col-md-12 d-flex flex-row align-items-center">
					<legend class = "col-2 col-form-label">Accommodation on Campus</legend>
					<div class = "col py-2-5">
						<div class = "form-check form-check-inline">
							<input type = "radio" class = "form-check-input" id = "Financial_funding_self"
							       name = "Inbound[Financial_funding]" value = "Self-sponsor"
                                <?= ($model->Financial_funding == "Self-sponsor") ? 'checked' : '' ?>>
							<label class = "form-check-label" for = "Financial_funding_self">Self-sponsor</label>
						</div>
						<div class = "form-check form-check-inline">
							<input type = "radio" class = "form-check-input" id = "Financial_funding_scholarship"
							       name = "Inbound[Financial_funding]" value = "Scholarship"
                                <?= ($model->Financial_funding == "Scholarship") ? 'checked' : '' ?>>
							<label class = "form-check-label" for = "Financial_funding_scholarship">Scholarship</label>
						</div>
						<div class = "form-check form-check-inline">
							<input type = "radio" class = "form-check-input" id = "Financial_funding_other"
							       name = "Inbound[Financial_funding]" value = Others
                                <?= ($model->Financial_funding == "Others") ? 'checked' : '' ?>>
							<label class = "form-check-label" for = "Financial_funding_other">Others</label>
						</div>
					</div>
				</div>
			</div>
			<div class = "row mt-2" id = "Scholarship">
				<div class = "col-md-6">
					<div class = "form__div">
						<input type = "text" class = "form__input form-control" id = "validationCustomSponsor_name"
						       name = "Inbound[Sponsor_name]"
						       maxlength = "100" placeholder = " " value = "<?= $model->Sponsor_name ?>" required>
						<label for = "validationCustomSponsor_name" class = "form__label">Sponsor Name</label>
					</div>
				</div>
				<div class = "col-md-6">
					<div class = "form__div">
						<input type = "text" class = "form__input form-control"
						       id = "validationCustomFinancial_funding_sponsor_amount"
						       name = "Inbound[Financial_funding_sponsor_amount]"
						       maxlength = "100" placeholder = " "
						       value = "<?= $model->Financial_funding_sponsor_amount ?>" required>
						<label for = "validationCustomFinancial_funding_sponsor_amount"
						       class = "form__label">Amount</label>
					</div>
				</div>
			</div>
			<div class = "row mt-2" id = "otherFunding">
				<div class = "col">
					<div class = "form__div">
    <textarea class = "form__input form-control" id = "Financial_funding_other"
              name = "Inbound[Financial_funding_other]"
              maxlength = "255" required placeholder = " "><?= $model->Financial_funding_other ?></textarea>
						<label for = "Financial_funding_other" class = "form__label">Please Specify</label>
					</div>
				</div>

			</div>

			<div class = "mt-3 d-flex justify-content-between">
				<div>
					<button class = "button submit-btn" type = "button" name = "saveWithoutValidation"
					        onclick = "submitForm('noValidate')">Save
					</button>
				</div>
				<div>
					<button class = "button btn-navigate-form-step" type = "button" step_number = "4">Prev</button>
					<button class = "button btn-navigate-form-step btn-next" type = "button" step_number = "6">Next
					</button>
				</div>

			</div>
		</section>
		<!-- Step 6 input fields -->
		<section id = "step-6" class = "form-step d-none">
			<p class = "font-monospace">I hereby certify that my home university has recommended me to join the proposed
			                            study program at
			                            International Islamic University Malaysia (IIUM) as per duration stated. The
			                            following is the officer
			                            that approved my application from my home university.</p>

			<div class = "row align-items-center mb-2">
				<div class = "col-md-6">
					<div class = "form__div">
						<input type = "text" class = "form__input form-control"
						       id = "validationCustomApproval_university_person_name"
						       name = "Inbound[Approval_university_person_name]"
						       maxlength = "255" placeholder = " "
						       value = "<?= $model->Approval_university_person_name ?>" required>
						<label for = "validationCustomApproval_university_person_name"
						       class = "form__label">Name</label>
					</div>
				</div>
				<div class = "col-md-6">
					<div class = "form__div">
						<input type = "text" class = "form__input form-control"
						       id = "validationCustomApproval_person_position"
						       name = "Inbound[Approval_person_position]"
						       maxlength = "255" placeholder = " " value = "<?= $model->Approval_person_position ?>"
						       required>
						<label for = "validationCustomApproval_person_position" class = "form__label">Position</label>
					</div>
				</div>
			</div>

			<div class = "row mt-2">
				<div class = "col-md-6">
					<div class = "form__div">
						<input type = "tel" class = "form__input form-control"
						       id = "validationCustomApproval_person_mobile_number"
						       name = "Inbound[Approval_person_mobile_number]"
						       maxlength = "255" placeholder = " "
						       value = "<?= $model->Approval_person_mobile_number ?>" required>
						<label for = "validationCustomApproval_person_mobile_number" class = "form__label">Mobile
						                                                                                   Number</label>
					</div>
				</div>
				<div class = "col-md-6">
					<div class = "form__div">
						<input type = "email" class = "form__input form-control"
						       id = "validationCustomApproval_person_email"
						       name = "Inbound[Approval_person_email]"
						       maxlength = "100" placeholder = " " value = "<?= $model->Approval_person_email ?>"
						       required>
						<label for = "validationCustomApproval_person_email" class = "form__label">Email Address</label>
					</div>
				</div>
			</div>
			<div class = "row">
				<div class = "col">
					<div class = "form__div">
						<input type = "date" class = "form__input form-control" name = "Inbound[Approval_date]"
						       id = "Approval_date"
						       placeholder = " "
						       value = "<?= $model->Approval_date ?>" required>
						<label for = "Approval_date" class = "form__label">Approval Date</label>
					</div>
				</div>
			</div>
            <?php
            $template = '
<div class="row mb-3">
    <div class="col-md-6">
        <div class="mb-3">
            <label for="{inputId}" class="form-label">{labelText}</label>
        </div>
    </div>
    <div class="col-md-6">
        <div class="input-group">
            <input type="file" class="form-control file-input" id="{inputId}" name="{inputName}" accept=".pdf, .docx" {requiredAttribute}>
        </div>
    </div>
</div>
';
            // File input sections
            echo strtr($template, [
                '{inputId}' => 'Recommendationletter', '{labelText}' => 'Recommendation Letter',
                '{inputName}' => 'Inbound[Recommendation_letter]',
                '{requiredAttribute}' => isFileRequired($model->Recommendation_letter) ? 'required' : '',
            ]);
            ?>

			<p class = "font-monospace">I declare that all the information provided in this application from is true and
			                            complete in every
			                            detail. I acknowledge that International Islamic University Malaysia (IIUM)
			                            reserves the right to vary or
			                            reverse any decision regarding admission or enrolment made on the basis of
			                            incorrect or incomplete
			                            information. I am aware of the conditions relating to my application and
			                            admission and agree to pay all
			                            fees for which I am liable to.</p>

			<div class = "row align-items-center">
				<div class = "col">
					<legend class = "col-form-label col-sm-2 pt-0">Do you agree?</legend>
					<div class = "form-check form-check-inline pl-3">
						<input type = "radio" class = "form-check-input" id = "model-agreement-1"
						       name = "Inbound[Student_declaration_agreement]"
						       value = 1 <?= $model->Student_declaration_agreement === 1 ? 'checked' : '' ?>>
						<label class = "form-check-label" for = "model-agreement-1">Yes</label>
					</div>
					<div class = "form-check form-check-inline">
						<input type = "radio" class = "form-check-input" id = "model-agreement-0"
						       name = "Inbound[Student_declaration_agreement]"
						       value = 0 <?= $model->Student_declaration_agreement === 0 ? 'checked' : '' ?> required>
						<label class = "form-check-label" for = "model-agreement-0">No</label>
					</div>
				</div>
				<input type="hidden" name="Inbound[Status]" id="statusInput" value="">
				<div class = "mt-3 d-flex justify-content-between">
					<div>
						<div>
							<button class = "button submit-btn" type = "button" name = "saveWithoutValidation"
							        onclick = "submitForm('noValidate')">Save
							</button>
						</div>
					</div>
					<div>
						<button class = "button btn-navigate-form-step" type = "button" step_number = "5">Prev</button>
						<button class = "button btn-navigate-form-step btn-next" type = "button" step_number = "7">Next
						</button>
					</div>
				</div>
		</section>
		<section id = "step-7" class = "form-step d-none">
            <?php
            $template = '
<div class="row mb-3">
    <div class="col-md-6">
        <div class="mb-3">
            <label for="{inputId}" class="form-label">{labelText}</label>
        </div>
    </div>
    <div class="col-md-6">
        <div class="input-group">
            <input type="file" class="form-control file-input" id="{inputId}" name="{inputName}" accept=".pdf, .docx" {requiredAttribute}>
        </div>
    </div>
</div>
';
            // File input sections
            echo strtr($template, [
                '{inputId}' => 'Passport', '{labelText}' => 'Passport',
                '{inputName}' => 'Inbound[Passport]',
                '{requiredAttribute}' => isFileRequired($model->Passport) ? 'required' : '',
            ]);
            echo strtr($template, [
                '{inputId}' => 'Latestpassportphoto', '{labelText}' => 'Latest Passport Photo',
                '{inputName}' => 'Inbound[Latest_passport_photo]',
                '{requiredAttribute}' => isFileRequired($model->Latest_passport_photo) ? 'required' : '',
            ]);
            echo strtr($template, [
                '{inputId}' => 'Latestcertifiedacademictranscript', '{labelText}' => 'Latest Certified Academic Transcript',
                '{inputName}' => 'Inbound[Latest_certified_academic_transcript]',
                '{requiredAttribute}' => isFileRequired($model->Latest_certified_academic_transcript) ? 'required' : '',
            ]);
            echo strtr($template, [
                '{inputId}' => 'Confirmationletter', '{labelText}' => 'Confirmation Letter',
                '{inputName}' => 'Inbound[Confirmation_letter]',
                '{requiredAttribute}' => isFileRequired($model->Confirmation_letter) ? 'required' : '',
            ]);
            echo strtr($template, [
                '{inputId}' => 'Confirmationletter', '{labelText}' => 'Confirmation Letter',
                '{inputName}' => 'Inbound[Confirmation_letter]',
                '{requiredAttribute}' => isFileRequired($model->Confirmation_letter) ? 'required' : '',
            ]);
            echo strtr($template, [
                '{inputId}' => 'Sponsorshipletter', '{labelText}' => 'Sponsorship Letter',
                '{inputName}' => 'Inbound[Sponsorship_letter]',
                '{requiredAttribute}' => isFileRequired($model->Sponsorship_letter) ? 'required' : '',
            ]);

            ?>



				<div class = "mt-3 d-flex justify-content-between">
					<div>
						<div>
							<button class = "button submit-btn" type = "button" name = "saveWithoutValidation"
							        onclick = "submitForm('noValidate')">Save
							</button>
							<div>
								<button class="button submit-btn" type="button" name="saveWithoutValidation" value="validate"  onclick= "submitForm('validate')">Submit</button>
							</div>
						</div>
					</div>
					<div>
						<button class = "button btn-navigate-form-step" type = "button" step_number = "6">Prev</button>

					</div>
				</div>
		</section>
	</form>
</div>

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
            $('#Scholarship, #otherFunding').hide();
            $('#validationCustomSponsor_name, #validationCustomFinancial_funding_sponsor_amount, #Financial_funding_other')
                .prop('required', false);

            if ($('#Financial_funding_self').prop('checked')) {
                // No need to do anything for 'Self-sponsor'
            } else if ($('#Financial_funding_scholarship').prop('checked')) {
                // Show elements for 'Scholarship' and make Sponsor Name and Amount required
                $('#Scholarship').show();
                $('#validationCustomSponsor_name, #validationCustomFinancial_funding_sponsor_amount')
                    .prop('required', true);
            } else if ($('#Financial_funding_other').prop('checked')) {
                // Show elements for 'Other' and make 'Please Specify' required
                $('#otherFunding').show();
                $('#Financial_funding_other').prop('required', true);
            }
        }

        handleRadioChange();

        $('#Financial_funding_self, #Financial_funding_scholarship, #Financial_funding_other')
            .on('change', function () {
                handleRadioChange();
            });
    });



</script>


<!--<script>-->
<!--    // Function to toggle the visibility and required attribute of the table and text area-->
<!--    function toggleFields() {-->
<!--        var selectedOption = document.getElementById('lvl_edu').value;-->
<!--        var tableContainer = document.getElementById('tableContainer');-->
<!--        var textareaContainer = document.getElementById('textareaContainer');-->
<!--        var tableInputs = tableContainer.querySelectorAll('input');-->
<!--        var textareaInput = document.getElementById('model-Research');-->
<!---->
<!--        if (selectedOption !== 'UG' && selectedOption !== 'PG') {-->
<!--            tableContainer.style.display = 'none';-->
<!--            textareaContainer.style.display = 'none';-->
<!---->
<!--            // Remove the required attribute from all input fields-->
<!--            tableInputs.forEach(function (input) {-->
<!--                input.removeAttribute('required');-->
<!--            });-->
<!---->
<!--            textareaInput.removeAttribute('required');-->
<!--        } else if (selectedOption === 'UG') {-->
<!--            tableContainer.style.display = 'flex';-->
<!--            textareaContainer.style.display = 'none';-->
<!---->
<!--            // Add the required attribute to input fields in the UG table-->
<!--            tableInputs.forEach(function (input) {-->
<!--                input.setAttribute('required', 'required');-->
<!--            });-->
<!---->
<!--            textareaInput.removeAttribute('required');-->
<!--        } else if (selectedOption === 'PG') {-->
<!--            tableContainer.style.display = 'none';-->
<!--            textareaContainer.style.display = 'block';-->
<!---->
<!--            // Remove the required attribute from input fields in the UG table-->
<!--            tableInputs.forEach(function (input) {-->
<!--                input.removeAttribute('required');-->
<!--            });-->
<!---->
<!--            // Add the required attribute to the textarea in the PG section-->
<!--            textareaInput.setAttribute('required', 'required');-->
<!--        }-->
<!--    }-->
<!---->
<!--    // Attach an event listener to the dropdown to trigger the toggle function-->
<!--    document.getElementById('lvl_edu').addEventListener('change', toggleFields);-->
<!---->
<!--    // Initial state based on the default dropdown value-->
<!--    toggleFields();-->
<!--</script>-->


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
        console.log(dropdown.value);
        if (dropdown.value === "Off Campus") {
            secondDropdown.style.display = "none";
            room_type.value = "";
        } else {
            secondDropdown.style.display = "flex";
            room_type.setAttribute('required', 'required');
        }
    }

    window.onload = toggleDropdownOnLoad;
</script>