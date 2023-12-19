<?php

use common\models\Courses;
use common\models\Iiumcourse;


use yii\bootstrap5\Html;
use yii\bootstrap5\ActiveForm;

/** @var yii\web\View $this */
/** @var common\models\Outbound $model */
/** @var Iiumcourse $coursesData */
/** @var Iiumcourse $iiumcourseData */

?>
<div>

	<!-- Step 1 Content -->
	<form id = "myForm" class = " needs-validation"
	      method = "post"
	      enctype = "multipart/form-data" novalidate>
		<input type = "hidden" name = "<?= Yii::$app->request->csrfParam ?>"
		       value = "<?= Yii::$app->request->csrfToken ?>"
		       required>
		<section id = "step-1" class = "form-step">
			<div class = "row mb-2">
				<div class = "col-md-6">
					<div class = "form__div">
						<input type = "text" class = "form__input form-control" id = "validationCustom01"
						       name = "Outbound[Matric_Number]"
						       maxlength = "255" placeholder = " " value = "<?= $model->Matric_Number ?>" required>
						<label for = "validationCustomMatric" class = "form__label">Matric Number</label>
					</div>
				</div>
				<div class = "col-md-6">
					<div class = "form__div">
						<input type = "text" class = "form__input form-control" id = "validationCustomCitizenship"
						       name = "Outbound[Citizenship]"
						       maxlength = "255" placeholder = " "
						       value = "<?= $model->Citizenship ?>" required>
						<label for = "validationCustomCitizenship" class = "form__label">Citizenship</label>
					</div>
				</div>
			</div>
			<div class = "form__div">
				<input type = "text" class = "form__input form-control" id = "validationCustomName" name = "Outbound[Name]"
				       maxlength = "255" placeholder = " " value = "<?= $model->Name ?>" required>
				<label for = "validationCustomName" class = "form__label">Name</label>
			</div>
			<div class = "row align-items-center">
				<div class = "col">
					<legend class = "col-form-label col-sm-2 pt-0">Gender</legend>
					<div class = "form-check form-check-inline">
						<input id = "gender_male" type = "radio" name = "Outbound[Gender]" value = "M"
						       class = "form-check-input" <?= $model->Gender === 'M' ? 'checked' : '' ?> required>
						<label for = "gender_male" class = "form-check-label">Male</label>
					</div>
					<div class = "form-check form-check-inline pl-3">
						<input id = "gender_female" type = "radio" name = "Outbound[Gender]" value = "F"
						       class = "form-check-input" <?= $model->Gender === 'F' ? 'checked' : '' ?>>
						<label for = "gender_female" class = "form-check-label">Female</label>
					</div>
				</div>
				<div class = "col">
					<div class = "form__div">
						<input type = "date" class = "form__input form-control" name = "Outbound[Date_of_Birth]"
						       placeholder = " "
						       value = "<?= $model->Date_of_Birth ?>" required>
						<label for = "validationCustomPassport" class = "form__label">Date of Birth</label>
					</div>
				</div>
			</div>
			<div class = "row">
				<div class = "col">
					<div class = "form__div">
						<input type = "text" class = "form__input form-control" id = "validationCustomPassport"
						       name = "Outbound[Passport_Number]"
						       maxlength = "255" placeholder = " "
						       value = "<?= $model->Passport_Number ?>" required>
						<label for = "validationCustomPassport" class = "form__label">Passport Number</label>
					</div>
				</div>
				<div class = "col">
					<div class = "form__div">
						<input type = "date" class = "form__input form-control" name = "Outbound[Passport_Expiration]"
						       placeholder = " "
						       value = "<?= $model->Passport_Expiration ?>" required>
						<label for = "validationCustomPassport" class = "form__label">Expiration Date</label>
					</div>
				</div>
			</div>
			<div class = "row mt-2">
				<div class = "col-md-6">
					<div class = "form__div">
						<input type = "tel" class = "form__input form-control" id = "validationCustomMobile"
						       name = "Outbound[Mobile_Number]"
						       maxlength = "255" placeholder = " " value = "<?= $model->Mobile_Number ?>" required>
						<label for = "validationCustomMobile" class = "form__label">Mobile Number</label>
					</div>
				</div>
				<div class = "col-md-6">
					<div class = "form__div">
						<input type = "email" class = "form__input form-control" id = "validationCustomEmail"
						       name = "Outbound[Email]"
						       maxlength = "100" placeholder = " " value = "<?= $model->Email ?>" required>
						<label for = "validationCustomEmail" class = "form__label">Email</label>
					</div>
				</div>
			</div>

			<div class = "form__div">
    <textarea class = "form__input form-control" id = "validationCustomAddress" name = "Outbound[Permanent_Address]"
              maxlength = "255" required placeholder = " "><?= $model->Permanent_Address ?></textarea>
				<label for = "validationCustomAddress" class = "form__label">Permanent Address</label>
			</div>

			<div class = "row mt-2">
				<div class = "col-md-6">
					<div class = "form__div">
						<input type = "number" class = "form__input form-control" id = "validationCustomPostcode"
						       name = "Outbound[Postcode]"
						       value = "<?= $model->Postcode ?>"
						       required placeholder = " ">
						<label for = "validationCustomPostcode" class = "form__label">Postal Code</label>
					</div>
				</div>
				<div class = "col-md-6">
					<div class = "form__div">
						<select class = "form__input form-control countries" id = "countryId5" name = "Outbound[Country]"
						        required>
							<option value = "">Select Country</option>
						</select>
					</div>
				</div>
				<div class = "col-md-6">
					<div class = "form__div">
						<select class = "form__input form-control states" id = "stateId1" name = "Outbound[State]"
						        value = "<?= $model->State ?>" required>
							<option value = "">Select State</option>
						</select>
					</div>
				</div>
			</div>
			<div class = "form__div">
    <textarea class = "form__input form-control" id = "validationCustomMailingAddress" name = "Outbound[Mailing_Address]"
              maxlength = "255" required placeholder = " "><?= $model->Mailing_Address ?></textarea>
				<label for = "validationCustomMailingAddress" class = "form__label">Mailing Address</label>
			</div>

			<div class = "row mt-2">
				<div class = "col-md-6">
					<div class = "form__div">
						<input type = "number" class = "form__input form-control" id = "validationCustomMailingPostcode"
						       value = '<?= $model->Postcode ?>' name = "Outbound[Mailing_Postcode]" maxlength = "255"
						       required placeholder = " ">
						<label for = "validationCustomMailingPostcode" class = "form__label">Mailing Post Code</label>
					</div>
				</div>
				<div class = "col-md-6">
					<div class = "form__div">
						<select class = "form__input form-control countries" id = "countryId4"
						        name = "Outbound[Mailing_Country]" required>
							<option value = "">Select Country</option>
						</select>
					</div>
				</div>
				<div class = "col-md-6">
					<div class = "form__div">
						<select class = "form__input form-control states" id = "stateId2" name = "Outbound[Mailing_State]"
						        required>
							<option value = "">Select State</option>
						</select>
					</div>
				</div>
			</div>
			<div class = "mt-3 d-flex justify-content-between">
				<div>
					<div>
						<button class="button submit-btn" type="button" name="saveWithoutValidation" onclick="submitForm('noValidate')">Save</button>
					</div>
				</div>
				<div>

					<button class="button btn-navigate-form-step btn-next" type="button" step_number="2">Next</button>
				</div>

			</div>
		</section>
		<!-- Step 2 Content, default hidden on page load. -->
		<section id = "step-2" class = "form-step d-none">
			<!-- Step 2 input fields -->
			<div class = "row mb-2">
				<div class = "col-md-6">
					<div class = "form__div">
						<input type = "text" class = "form__input form-control" id = "validationCustomEmName"
						       name = "Outbound[Emergency_name]"
						       maxlength = "255" placeholder = " " value = "<?= $model->Emergency_name ?>" required>
						<label for = "validationCustomEmName" class = "form__label">Name</label>
					</div>
				</div>
			</div>

			<div class = "row mb-2">
				<div class = "col-md-6">
					<div class = "form__div">
						<input type = "text" class = "form__input form-control"
						       id = "validationCustomEmRelationship"
						       name = "Outbound[Emergency_relationship]"
						       maxlength = "255" placeholder = " " value = "<?= $model->Emergency_relationship ?>" required>
						<label for = "validationCustomEmRelationship" class = "form__label">Relationship</label>
					</div>
				</div>
				<div class = "col-md-6">
					<div class = "form__div">
						<input type = "text" class = "form__input form-control" id = "validationCustomEmPhoneNumber"
						       name = "Outbound[Emergency_phoneNumber]"
						       maxlength = "255" placeholder = " " value = "<?= $model->Emergency_phoneNumber ?>" required>
						<label for = "validationCustomEmPhoneNumber" class = "form__label">Phone Number</label>
					</div>
				</div>
				<div class = "col-md-6">
					<div class = "form__div">

						<input type = "email" class = "form__input form-control" id = "validationCustomEmEmail"
						       name = "Outbound[Emergency_email]"
						       maxlength = "255" placeholder = " " value = "<?= $model->Emergency_email ?>" required>
						<label for = "validationCustomEmEmail" class = "form__label">Email</label>
					</div>
				</div>
			</div>

			<div class = "form__div">
    <textarea class = "form__input form-control" id = "validationCustomEmHomeAddress" name = "Outbound[Emergency_homeAddress]"
              maxlength = "255" required placeholder = " "><?= $model->Emergency_homeAddress ?></textarea>
				<label for = "validationCustomEmHomeAddress" class = "form__label">Home Address</label>
			</div>

			<div class = "row mt-2">
				<div class = "col-md-3">
					<div class = "form__div">
						<input type = "number" class = "form__input form-control" id = "validationCustomEmPostCode"
						       name = "Outbound[Emergency_postCode]"
						       maxlength = "255" required placeholder = " " value = "<?= $model->Emergency_postCode ?>">
						<label for = "validationCustomEmPostCode" class = "form__label">Post Code</label>
					</div>
				</div>
				<div class = "col-md-3">
					<div class = "form__div">
						<select class = "form__input form-control countries" id = "countryId3"
						        name = "Outbound[Emergency_country]"
						        required>
							<option value = "">Select Country</option>
						</select>
					</div>
				</div>
				<div class = "col-md-3">
					<div class = "form__div">
						<select class = "form__input form-control states" id = "stateId3" name = "Outbound[Emergency_tate]"
						        required>
							<option value = "">Select State</option>
						</select>
					</div>
				</div>
			</div>

			<div class = "mt-3 d-flex justify-content-between">
				<div>
					<div>
						<button class="button submit-btn" type="button" name="saveWithoutValidation" onclick="submitForm('noValidate')">Save</button>
					</div>
				</div>
				<div>
					<button class="button btn-navigate-form-step" type="button" step_number="1">Prev</button>
					<button class="button btn-navigate-form-step btn-next" type="button" step_number="3">Next</button>
				</div>

			</div>
		</section>
		<!-- Step 3 content, default hidden on page load. -->
		<section id = "step-3" class = "form-step d-none">
			<!-- Step 2 input fields -->
			<div class = "row mt-3 d-flex flex-row align-items-center">
				<div class = "col-md-5">
					<div class = "form__div">
						<select class = "form__input form-control" id = "lvl_edu" name = "Outbound[Academic_lvl_edu]" required>
							<option value = "">Select your Level of Education</option>
							<option value = "UG" <?php echo ($model->Academic_lvl_edu === 'UG') ? 'selected' : ''; ?>>Under
							                                                                                 Graduate
							</option>
							<option value = "PG" <?php echo ($model->Academic_lvl_edu === 'PG') ? 'selected' : ''; ?>>Post
							                                                                                 Graduate
							</option>
						</select>
					</div>
				</div>
				<div class = "col-md-6">
					<div class = "form__div">
						<select class = "form__input form-control" id = "kulliyyah" name = "Outbound[Academic_kulliyyah]" required>
							<option value = "">Select Kulliyyah</option>
                            <?php
                            $kulliyyahOptions = [
                                "KICT", "KIRKHS", "KENMS", "AIKOL", "KOE", "KOM", "KAED", "KOS", "KOP", "KAHS", "ISTAC",
                                "KOED", "KON", "KOD", "IIiBF", "KLM", "OTHERS"
                            ];

                            foreach ($kulliyyahOptions as $option) {
                                $selected = ($model->Academic_kulliyyah === $option) ? 'selected' : '';
                                echo "<option value=\"$option\" $selected>$option</option>";
                            }
                            ?>
						</select>
					</div>
				</div>


				<div class = "row mt-3 d-flex flex-row align-items-center">
					<div class = "col-md-4">
						<div class = "form__div">
							<input type = "text" class = "form__input form-control" id = "validationCustomOthers"
							       name = "Outbound[Academic_kulliyyah_others]" value = "<?= $model->Academic_kulliyyah_others ?>"
							       maxlength = "255" placeholder = " ">
							<label for = "validationCustomOthers" class = "form__label">Others (Please specify)</label>
						</div>
					</div>
					<div class = "col-md-4">
						<div class = "form__div">
							<select class = "form__input form-control" id = "sem" name = "Outbound[Academic_current_semester]" required>
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
							<input type = "text" class = "form__input form-control" id = "validationCustomYear"
							       name = "Outbound[Academic_current_year]" value = "<?= $model->Academic_current_year ?>"
							       maxlength = "255" placeholder = " " required>
							<label for = "validationCustomYear" class = "form__label">Year</label>
						</div>
					</div>
				</div>

				<div class = "row mt-3 d-flex flex-row align-items-center">
					<div class = "col-md-6">
						<div class = "form__div">
							<input type = "text" class = "form__input form-control" id = "validationCustomProgram"
							       name = "Outbound[Academic_name_of_programme]" value = "<?= $model->Academic_name_of_programme ?>"
							       maxlength = "255" placeholder = " " required>
							<label for = "validationCustomProgram" class = "form__label">Programme</label>
						</div>
					</div>
					<div class = "col-md-5">
						<div class = "form__div">
							<input type = "text" class = "form__input form-control" id = "validationCustomCGPA"
							       name = "Outbound[Academic_cgpa]" value = "<?= $model->Academic_cgpa ?>"
							       maxlength = "255" placeholder = " " required>
							<label for = "validationCustomCGPA" class = "form__label">Current CGPA</label>
						</div>
					</div>
				</div>

				<div class = "alert alert-light p-2 my-3">
					<h1 class = "fs-6 mt-0 mb-0 p-0 font-monospace text-capitalize alert">Language proficiency</h1>
				</div>

				<div class = "col-md-4">
					<div class = "form__div">
						<select class = "form__input form-control" id = "e_lang_pro" name = "Outbound[English_language_proficiency]"
						        required>
							<option value = "">Select Language Proficiency</option>
                            <?php foreach (["Malaysia University English Test (MUET)", "TOFEL", "IELTS"] as $option): ?>
								<option value = "<?= $option ?>" <?= ($model->English_language_proficiency === $option) ? 'selected' : '' ?>>
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
						       maxlength = "255" required placeholder = " ">
						<label for = "validationCustomResult" class = "form__label">Result</label>
					</div>
				</div>
				<div class = "col-md-4">
					<div class = "form__div">
						<input type = "text" class = "form__input form-control" id = "validationCustomThirdLang"
						       name = "Outbound[Third_language]" value = "<?= $model->Third_language ?>"
						       maxlength = "255" required placeholder = " ">
						<label for = "validationCustomThirdLang" class = "form__label">Third Language</label>
					</div>
				</div>
			</div>

			<div class = "alert alert-light p-2 my-3">
				<h1 class = "alert fs-6 m-0 p-0 font-monospace text-capitalize">Financial information</h1>
			</div>

			<div class = "row mt-3 d-flex flex-row align-items-center">
				<div class = "row">
					<legend class = "col-3 col-form-label">I'm Fully Funded for the Programme</legend>
					<div class = "col-3 py-2-5">
						<div class = "form-check form-check-inline">
							<input type = "radio" class = "form-check-input" id = "academic_accept"
							       name = "Outbound[Financial_funded_accept]"
							       value = "1" <?= $model->Financial_funded_accept === 1 ? 'checked' : '' ?> required>
							<label class = "form-check-label" for = "academic_accept">Yes</label>
						</div>
						<div class = "form-check form-check-inline">
							<input type = "radio" class = "form-check-input" id = "academic_accept"
							       name = "Outbound[Financial_funded_accept]"
							       value = "0" <?= $model->Financial_funded_accept === 0 ? 'checked' : '' ?> required>
							<label class = "form-check-label" for = "academic_accept">No</label>
						</div>
					</div>
				</div>

				<div class = "col-md-4 mt-2">
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


				<div class = "col-md-4 mt-2">
					<div class = "form__div">
						<input type = "text" class = "form__input form-control"
						       id = "validationCustomSponsoringNameOther"
						       name = "Outbound[Sponsoring_name_other]" value = "<?= $model->Sponsoring_name_other ?>"
						       maxlength = "255" placeholder = " ">
						<label for = "validationCustomSponsoringNameOther" class = "form__label">Others (Please
						                                                                         Specify)</label>
					</div>
				</div>
				<div class = "col-md-4 mt-2">
					<div class = "form__div">
						<input type = "number" class = "form__input form-control" id = "validationCustomFunding"
						       name = "Outbound[Sponsoring_funding]" value = "<?= $model->Sponsoring_funding ?>" maxlength = "255"
						       placeholder = " " required>
						<label for = "validationCustomFunding" class = "form__label">Funding/ Sponsoring Amount
						                                                             (RM)</label>
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
					<button class="button btn-navigate-form-step" type="button" step_number="2">Prev</button>
					<button class="button btn-navigate-form-step btn-next" type="button" step_number="4">Next</button>
				</div>
			</div>
		</section>
		<!-- Step 4 content, default hidden on page load.-->
		<section id = "step-4" class = "form-step d-none">

			<!-- Step 2 input fields -->
			<div class = "row mt-3 d-flex flex-row align-items-center">
				<div class = "row">
					<legend class = "col-2 col-form-label">Type of Mobility</legend>
					<div class = "col-8 py-2-5">
                        <?php
                        $mobilityOptions = [
                            "1" => "Physical", "2" => "Virtual", "3" => "Partner with IIUM (MoU/MoA)",
                            "4" => "Partner University", "5" => "Non-partner University",
                        ];

                        foreach ($mobilityOptions as $value => $label) {
                            $checked = ($model->Type_mobility === $value) ? 'checked' : '';
                            ?>
							<div class = "form-check form-check-inline">
								<input type = "radio" class = "form-check-input" id = "type_mobility_<?= $value ?>"
								       name = "Outbound[Type_mobility]" value = "<?= $value ?>" <?= $checked ?> required>
								<label class = "form-check-label"
								       for = "type_mobility_<?= $value ?>"><?= $label ?></label>
							</div>
                        <?php } ?>
					</div>
				</div>
			</div>


			<div class = "row mt-3 d-flex flex-row align-items-center">

				<div class = "col-md-6">
					<div class = "form__div">
						<select class = "form__input form-control" id = "type_program" name = "Outbound[Type_mobility_program]"
						        required>
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
						       name = "Outbound[Host_university_name]" maxlength = "255" required placeholder = " "
						       value = "<?= htmlspecialchars($model->Host_university_name ?? '') ?>">
						<label for = "validationCustomHostUniName" class = "form__label">Name of Host University</label>
					</div>
				</div>
				<div class = "col-md-3">
					<div class = "form__div">
						<input type = "date" class = "form__input form-control" id = "validationCustomMobilityFrom"
						       name = "Outbound[Mobility_from]" required
						       value = "<?= htmlspecialchars($model->Mobility_from ?? '') ?>">
						<label for = "validationCustomMobilityFrom" class = "form__label">Mobility From</label>
					</div>
				</div>
				<div class = "col-md-3">
					<div class = "form__div">
						<input type = "date" class = "form__input form-control" id = "validationCustomMobilityUntil"
						       name = "Outbound[Mobility_until]" required
						       value = "<?= htmlspecialchars($model->Mobility_until ?? '') ?>">
						<label for = "validationCustomMobilityUntil" class = "form__label">Mobility Until</label>
					</div>
				</div>
			</div>


			<div class = "row mt-2">
				<div class = "col-md-6">
					<div class = "form__div">
						<select class = "form__input form-control countries" id = "countryId2"
						        name = "Outbound[Country_host_university]"
						        required>
							<option value = "">Select Country</option>
						</select>
					</div>
				</div>
				<div class = "col-md-6 d-flex flex-row align-items-center">
					<legend class = "col-4 col-form-label">Credit Transfer Availability</legend>
					<div class = "col-4 py-2-5">
						<div class = "form-check form-check-inline">
							<input type = "radio" class = "form-check-input" id = "credit_transfer_availability_1"
							       name = "Outbound[credit_transfer_availability]" value = "1"
                                <?= ($model->credit_transfer_availability == 1) ? 'checked' : '' ?>>
							<label class = "form-check-label" for = "credit_transfer_availability_1">Yes</label>
						</div>
						<div class = "form-check form-check-inline">
							<input type = "radio" class = "form-check-input" id = "credit_transfer_availability_0"
							       name = "Outbound[credit_transfer_avability]" value = "0"
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
				<div class = "col-md-4">
					<div class = "form__div">
						<input type = "text" class = "form__input form-control" id = "validationCustomConnectHostName"
						       name = "Outbound[Connect_host_name]" maxlength = "255" required placeholder = " "
						       value = "<?= htmlspecialchars($model->Connect_host_name ?? '') ?>">
						<label for = "validationCustomConnectHostName" class = "form__label">Name</label>
					</div>
				</div>
				<div class = "col-md-4">
					<div class = "form__div">
						<input type = "text" class = "form__input form-control"
						       id = "validationCustomConnectHostPosition"
						       name = "Outbound[Connect_host_position]" maxlength = "255" required placeholder = " "
						       value = "<?= htmlspecialchars($model->Connect_host_position ?? '') ?>">
						<label for = "validationCustomConnectHostPosition" class = "form__label">Position</label>
					</div>
				</div>
				<div class = "col-md-4">
					<div class = "form__div">
						<input type = "text" class = "form__input form-control"
						       id = "validationCustomConnectHostMobileNo"
						       name = "Outbound[Connect_host_mobile_number]" maxlength = "255" required placeholder = " "
						       value = "<?= htmlspecialchars($model->Connect_host_mobile_number ?? '') ?>">
						<label for = "validationCustomConnectHostMobileNo" class = "form__label">Mobile Number</label>
					</div>
				</div>
			</div>

			<div class = "form__div mt-2">
    <textarea class = "form__input form-control" id = "validationCustomConnectHostAddress"
              name = "Outbound[Connect_host_address]" maxlength = "255" required
              placeholder = " "><?= htmlspecialchars($model->Connect_host_address ?? '') ?></textarea>
				<label for = "validationCustomConnectHostAddress" class = "form__label">Address</label>
			</div>

			<div class = "row mt-2">
				<div class = "col-md-6">
					<div class = "form__div">
						<input type = "number" class = "form__input form-control"
						       id = "validationCustomConnectHostPostcode"
						       name = "Outbound[Connect_host_postcode]" required placeholder = " "
						       value = "<?= htmlspecialchars($model->Connect_host_postcode ?? '') ?>">
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
				<div class = "col-md-6 d-flex flex-row align-items-center">
					<legend class = "col-6 col-form-label">Scholarship/ grant from host university</legend>
					<div class = "col-6 py-2-5">
						<div class = "form-check form-check-inline">
							<input type = "radio" class = "form-check-input" id = "host_scholarship_1"
							       name = "Outbound[host_scholarship]" value = "1"
                                <?= ($model->host_scholarship == 1) ? 'checked' : '' ?>>
							<label class = "form-check-label" for = "host_scholarship_1">Yes</label>
						</div>
						<div class = "form-check form-check-inline">
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


			<div class = "mt-3 d-flex justify-content-between">
				<div>
					<button class = "button submit-btn" type = "button" name = "saveWithoutValidation"
					        onclick = "submitForm('noValidate')">Save
					</button>
				</div>
				<div>
					<button class="button btn-navigate-form-step" type="button" step_number="3">Prev</button>
					<button class="button btn-navigate-form-step btn-next" type="button" step_number="5">Next</button>
				</div>

			</div>
		</section>
		<!-- Step 5 content, default hidden on page load. -->
		<section id = "step-5" class = "form-step d-none">
			<!-- Step 2 input fields -->
			<div class = "alert alert-light p-2 my-3">
				<h1 class = "fs-6 mt-0 mb-0 p-0 font-monospace text-capitalize alert">Academic Background</h1>
			</div>

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
										       required>
									</td>
									<td class="py-2 px-1">
										<input type="text" class="form-control"
										       name="CoursesModel[<?= $i ?>][course_name]" placeholder="Course Name"
										       value="<?= isset($coursesData[$i]['course_name']) ? $coursesData[$i]['course_name'] : '' ?>"
										       required>
									</td>
									<td class="py-2 px-1">
										<input type="text" class="form-control"
										       name="CoursesModel[<?= $i ?>][credit_hours]" placeholder="Credit Hours"
										       value="<?= isset($coursesData[$i]['credit_hours']) ? $coursesData[$i]['credit_hours'] : '' ?>"
										       required>
									</td>
								</tr>
                            <?php endfor; ?>

							</tbody>
						</table>
					</div>

					<div class = "col">
						<h4 class = "text-center mb-4">IIUM Courses</h4>
						<table class = "table table-hover">
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
									<td class = "py-2 px-1">

										<input type="hidden" name="IiumcoursesModel[<?= $i ?>][id]"
										       value="<?= isset($iiumcourseData[$i]['id']) ? $iiumcourseData[$i]['id'] : '' ?>">

										<input type = "text" class = "form-control"
										       name = "IiumcoursesModel[<?= $i ?>][course_code]"
										       placeholder = "Course Code"
										       value = "<?= isset($iiumcourseData[$i]['course_code']) ? $iiumcourseData[$i]['course_code'] : '' ?>"
										       required>
									</td>
									<td class = "py-2 px-1">
										<input type = "text" class = "form-control"
										       name = "IiumcoursesModel[<?= $i ?>][course_name]"
										       placeholder = "Course Name"
										       value = "<?= isset($iiumcourseData[$i]['course_name']) ? $iiumcourseData[$i]['course_name'] : '' ?>"
										       required>
									</td>
									<td class = "py-2 px-1">
										<input type = "text" class = "form-control"
										       name = "IiumcoursesModel[<?= $i ?>][credit_hours]"
										       placeholder = "Credit Hours"
										       value = "<?= isset($iiumcourseData[$i]['credit_hours']) ? $iiumcourseData[$i]['credit_hours'] : '' ?>"
										       required>
									</td>
								</tr>
                            <?php endfor; ?>

							</tbody>
						</table>
					</div>

				</div>
				<div class = "col" id = "textareaContainer">
					<div class = "form__div">
						<textarea class = "form__input form-control" id = "model-Research" name = "Outbound[Research]"
						          required><?= htmlspecialchars($model->Research ?? '') ?></textarea>
						<label for = "model-Research" class = "form__label">Write your research</label>
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
					<button class="button btn-navigate-form-step" type="button" step_number="4">Prev</button>
					<button class="button btn-navigate-form-step btn-next" type="button" step_number="6">Next</button>
				</div>

			</div>
		</section>
		<!-- Step 6 content, default hidden on page load. -->
		<section id = "step-6" class = "form-step d-none">

			<!-- Step 3 input fields -->
			<div class = "alert alert-light p-2 my-3">
				<h1 class = "fs-6 mt-0 mb-0 p-0 font-monospace text-capitalize alert">student declaration</h1>
			</div>

			<p class = "font-monospace"><strong>I hereby submit this application for the IIUM Student Program
			                                    (outbound)
			                                    and
			                                    attached all the following compulsory documents in support of the
			                                    information
			                                    provided<strong></p>


<!--            --><?php
//            $template = '
//<div class="row mb-3">
//    <div class="col-md-6">
//        <div class="mb-3">
//            <label for="{inputId}" class="form-label">{labelText}</label>
//        </div>
//    </div>
//    <div class="col-md-6">
//        <div class="input-group">
//            <input type="file" class="form-control file-input" id="{inputId}" name="{inputName}" accept=".pdf, .docx" {requiredAttribute}>
//        </div>
//    </div>
//</div>
//';
//
//            // Function to check if the file is required
//            function isFileRequired($file) {
//                return $file === null;
//            }
//
//            // File input sections
//            echo strtr($template, [
//                '{inputId}' => 'offerLetter',
//                '{labelText}' => 'Offer Letter/Invitation Letter/Acceptance Letter from Host University',
//                '{inputName}' => 'Outbound[Offer_letter]',
//                '{requiredAttribute}' => isFileRequired($model->Offer_letter) ? 'required' : '',
//            ]);
//
//            echo strtr($template, [
//                '{inputId}' => 'academicTranscript',
//                '{labelText}' => 'Latest certified academic transcript',
//                '{inputName}' => 'Outbound[Academic_transcript]',
//                '{requiredAttribute}' => isFileRequired($model->Academic_transcript) ? 'required' :'',
//            ]);
//
//            echo strtr($template, [
//                '{inputId}' => 'programBrochure',
//                '{labelText}' => 'Program brochure (if available)',
//                '{inputName}' => 'Outbound[Program_brochure]',
//                '{requiredAttribute}' => isFileRequired($model->Program_brochure) ? 'required' : '',
//            ]);
//
//            echo strtr($template, [
//                '{inputId}' => 'latestPaySlip',
//                '{labelText}' => 'Parent or Guardian latest payslip',
//                '{inputName}' => 'Outbound[Latest_pay_slip]',
//                '{requiredAttribute}' => isFileRequired($model->Latest_pay_slip) ? 'required' : '',
//            ]);
//
//            echo strtr($template, [
//                '{inputId}' => 'otherLatestPaySlip',
//                '{labelText}' => 'Other Parent or Guardian latest payslip (if available)',
//                '{inputName}' => 'Outbound[Other_latest_pay_slip]',
//                '{requiredAttribute}' => isFileRequired($model->Other_latest_pay_slip) ? 'required' : '',
//            ]);
//            ?>



			<div>
				<p class = "font-monospace">I declare that all the information provided in this application from is
				                            true
				                            and
				                            complete in every detail. I acknowledge that International Islamic
				                            University
				                            Malaysia (IIUM) reserves the right to approve or reject made on the
				                            basis of
				                            incorrect or incomplete information. I am aware of the conditions
				                            relating
				                            to my
				                            application and agree to pay IIUM fees for which I am liable for while
				                            joining the
				                            above programme </p>
			</div>

			<div class = "row align-items-center">
				<div class = "col">
					<legend class = "col-form-label col-sm-2 pt-0">Do you agree?</legend>
					<div class = "form-check form-check-inline">
						<input type = "radio" class = "form-check-input" id = "model-agreement-0"
						       name = "Outbound[agreement]" value = "0"  <?= $model->agreement === 0 ? 'checked' : '' ?> required>
						<label class = "form-check-label" for = "model-agreement-0" >No</label>
					</div>
					<div class = "form-check form-check-inline pl-3">
						<input type = "radio" class = "form-check-input" id = "model-agreement-1"
						       name = "Outbound[agreement]" value = "1"  <?= $model->agreement === 1 ? 'checked' : '' ?>>
						<label class = "form-check-label" for = "model-agreement-1">Yes</label>
					</div>
				</div>

				<input type="hidden" name="Outbound[Status]" id="statusInput" value="">
				<div class = "mt-3 d-flex justify-content-between">
					<div>
						<button class="button submit-btn" type="button" name="saveWithoutValidation" onclick="submitForm('noValidate')">Save</button>
					</div>


					<div>
						<button class="button submit-btn submity" type="button" name="saveWithoutValidation" onclick="submitForm('validate')">Submit</button>
					</div>

					<div>
						<button class = "button btn-navigate-form-step" type = "button" step_number = "5">Prev</button>

					</div>
				</div>
		</section>

	</form>
</div>
<script>
    // Function to navigate between form steps
    const navigateToFormStep = (stepNumber) => {
        // Hide all form steps
        document.querySelectorAll(".form-step").forEach((formStepElement) => {
            formStepElement.classList.add("d-none");
        });

        // Mark all form steps as unfinished
        document.querySelectorAll(".form-stepper-list").forEach((formStepHeader) => {
            formStepHeader.classList.add("form-stepper-unfinished");
            formStepHeader.classList.remove("form-stepper-active", "form-stepper-completed", "is-invalid",  "form-stepper-invalid");
        });

        // Show the current form step
        document.querySelector("#step-" + stepNumber).classList.remove("d-none");

        // Select the form step circle (progress bar)
        const formStepCircle = document.querySelector('li[step="' + stepNumber + '"]');

        // Mark the current form step as active
        formStepCircle.classList.remove("form-stepper-unfinished", "form-stepper-completed", "is-invalid");
        formStepCircle.classList.add("form-stepper-active");

        // Loop through each form step circle up to the current step number
        for (let index = 0; index < stepNumber; index++) {
            const formStepCircle = document.querySelector('li[step="' + index + '"]');
            if (formStepCircle) {
                // Mark the form step as completed
                formStepCircle.classList.remove("form-stepper-unfinished", "form-stepper-active", "is-invalid");
                formStepCircle.classList.add("form-stepper-completed");
            }
        }
    };

    // Function to validate the form step before navigating to the next step
    const validateFormStep = (stepNumber) => {
        const formStep = document.querySelector("#step-" + stepNumber);
        const inputElements = formStep.querySelectorAll("input, select, textarea");

        // Perform your custom validation logic here
        let isValid = true;

        inputElements.forEach((input) => {
            // Add an event listener to track changes in the input fields
            input.addEventListener("input", () => {
                input.classList.remove("is-invalid");
            });

            if (!input.checkValidity()) {
                isValid = false;
                input.classList.add("is-invalid");
            } else {
                input.classList.remove("is-invalid");
            }
        });

        // Highlight the step in the form-stepper when it's not valid
        const formStepperList = document.querySelector('li[step="' + stepNumber + '"]');
        if (!isValid) {
            formStepperList.classList.remove("form-stepper-completed")

            formStepperList.classList.add("form-stepper-invalid");
        } else {
            formStepperList.classList.remove("form-stepper-invalid");
        }

        // Return whether the form step is valid or not
        return isValid;
    };

    document.querySelectorAll(".form-stepper-list").forEach((formStepperList) => {
        formStepperList.addEventListener("click", () => {
            const stepNumber = parseInt(formStepperList.getAttribute("step"));
            navigateToFormStep(stepNumber);
        });
    });

    // Add click event listeners to form navigation buttons
    document.querySelectorAll(".btn-navigate-form-step").forEach((formNavigationBtn) => {
        formNavigationBtn.addEventListener("click", () => {
            const stepNumber = parseInt(formNavigationBtn.getAttribute("step_number"));

            // Call the function to navigate to the target form step
            navigateToFormStep(stepNumber);
        });
    });

    // Function to navigate to the previous step
    document.querySelector(".btn-prev").addEventListener("click", function () {
        const stepNumber = parseInt(this.getAttribute("step_number"));
        const prevStepNumber = stepNumber - 1;

        // Check if it's the first step, and do not proceed to a negative step
        if (prevStepNumber > 0) {
            navigateToFormStep(prevStepNumber);
        }
    });

    // Function to submit the form
    function submitForm(validationType) {
        // Get the last step number
        const lastStepNumber = document.querySelectorAll(".form-step").length;

        if (validationType === 'validate') {
            // Validate all form steps before submitting
            for (let i = 1; i <= lastStepNumber; i++) {
                if (!validateFormStep(i)) {
                    return; // Do not proceed if validation fails
                }
            }
            if (getCurrentStepNumber() === lastStepNumber) {
                document.getElementById('statusInput').value = 10;
            }
        }

        // Capture the form element
        const form = document.getElementById('myForm'); // Make sure to use the correct form ID

        // Set the status to 10 if it's the last step


        // Your AJAX submit logic here
        $.ajax({
            type: 'POST',
            url: form.action,
            data: new FormData(form),
            processData: false,
            contentType: false,
            success: function (data) {
                // Handle the success response, if needed
                console.log(data);
            },
            error: function (xhr, status, error) {
                // Handle the error, if needed
                console.error(xhr.responseText);
            }
        });

        console.log("Form submitted successfully");
    }

    // Function to get the current step number
    function getCurrentStepNumber() {
        const activeStep = document.querySelector('.form-stepper-active');
        return activeStep ? parseInt(activeStep.getAttribute('step')) : 0;
    }
</script>

<script>
    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function () {
        'use strict'

        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.querySelectorAll('.needs-validation')

        // Loop over them and prevent submission
        Array.prototype.slice.call(forms)
            .forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }

                    form.classList.add('was-validated')
                }, false)
            })
    })()
    function getCurrentStepNumber() {
        const activeStep = document.querySelector('.form-stepper-active');
        return activeStep ? parseInt(activeStep.getAttribute('step')) : 0;
    }
</script>

<script>
    // AJAX utility function
    function ajaxCall() {
        this.send = function (data, url, method, success, type) {
            type = type || "json";
            var successRes = function (data) {
                success(data);
            };
            var errorRes = function (xhr, ajaxOptions, thrownError) {
                console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            };
            jQuery.ajax({
                url: url,
                type: method,
                data: data,
                success: successRes,
                error: errorRes,
                dataType: type,
                timeout: 60000
            });
        };
    }

    // LocationInfo class for managing country and state information
    function LocationInfo(selectElement, stateSelectElement, countryModelValue, stateModelValue) {
        var rootUrl = "https://geodata.phplift.net/api/index.php";
        var call = new ajaxCall();

        // Set the value of a select element
        this.setSelectValue = function (element, value) {
            element.val(value).trigger("change");
        };

        // Get the list of countries and populate the select element
        this.getCountries = function () {
            var url = rootUrl + "?type=getCountries";
            var method = "post";
            var data = {};
            call.send(data, url, method, function (data) {
                selectElement.find("option:eq(0)").html("Select Country");
                jQuery.each(data.result, function (key, val) {
                    var option = jQuery("<option>");
                    option.attr("value", val.name).text(val.name);
                    option.attr("countryId", val.id);
                    if (val.name === countryModelValue) {
                        option.prop("selected", true);
                    }
                    selectElement.append(option);
                });

                selectElement.trigger("change");
                selectElement.prop("disabled", false);
            });
        };

        // Get the list of states based on the selected country and populate the state select element
        this.getStates = function (countryId) {
            stateSelectElement.find("option:gt(0)").remove();
            var url = rootUrl + "?type=getStates&countryId=" + countryId;
            var method = "post";
            var data = {};
            call.send(data, url, method, function (data) {
                stateSelectElement.find("option:eq(0)").html("Select State");
                jQuery.each(data.result, function (key, val) {
                    var option = jQuery("<option>");
                    option.attr("value", val.name).text(val.name);
                    option.attr("stateid", val.id);
                    if (val.name === stateModelValue) {
                        option.prop("selected", true);
                    }

                    stateSelectElement.append(option);
                });

                stateSelectElement.prop("disabled", false);
            });
        };
    }

    // Document ready function
    jQuery(function () {
        var countrySelects = [
            {
                selectElement: jQuery("#countryId5"),
                stateSelectElement: jQuery("#stateId1"),
                countryModelValue: "<?= htmlspecialchars($model->Country) ?>",
                stateModelValue: "<?= htmlspecialchars($model->State) ?>"
            },
            {
                selectElement: jQuery("#countryId4"),
                stateSelectElement: jQuery("#stateId2"),
                countryModelValue: "<?= htmlspecialchars($model->Mailing_Country) ?>",
                stateModelValue: "<?= htmlspecialchars($model->Mailing_State) ?>"
            },
            {
                selectElement: jQuery("#countryId3"),
                stateSelectElement: jQuery("#stateId3"),
                countryModelValue: "<?= htmlspecialchars($model->Emergency_country) ?>",
                stateModelValue: "<?= htmlspecialchars($model->Emergency_tate) ?>"
            },
            {
                selectElement: jQuery("#countryId2"),
                stateSelectElement: null, // Replace with the actual state ID
                countryModelValue: "<?= htmlspecialchars($model->Country_host_university) ?>",
                stateModelValue: null // Set to null or adjust based on your data
            },
            {
                selectElement: jQuery("#countryId1"),
                stateSelectElement: null,
                countryModelValue: "<?= htmlspecialchars($model->Connect_host_country) ?>",
                stateModelValue: null
            }
            // Add more countrySelects for additional sections if needed
        ];

        countrySelects.forEach(function (countrySelect) {
            var loc = new LocationInfo(countrySelect.selectElement, countrySelect.stateSelectElement, countrySelect.countryModelValue, countrySelect.stateModelValue);

            loc.getCountries();

            countrySelect.selectElement.on("change", function (ev) {
                var countryId = jQuery("option:selected", this).attr("countryid");
                if (countryId !== "") {
                    loc.getStates(countryId);
                } else {
                    if (countrySelect.stateSelectElement) {
                        countrySelect.stateSelectElement.find("option:gt(0)").remove();
                    }
                }
            });
        });
    });
</script>

<script>
    // Function to toggle the visibility and required attribute of the table and text area
    function toggleFields() {
        var selectedOption = document.getElementById('lvl_edu').value;
        var tableContainer = document.getElementById('tableContainer');
        var textareaContainer = document.getElementById('textareaContainer');
        var tableInputs = tableContainer.querySelectorAll('input');
        var textareaInput = document.getElementById('model-Research');

        if (selectedOption !== 'UG' && selectedOption !== 'PG') {
            tableContainer.style.display = 'none';
            textareaContainer.style.display = 'none';

            // Remove the required attribute from all input fields
            tableInputs.forEach(function (input) {
                input.removeAttribute('required');
            });

            textareaInput.removeAttribute('required');
        } else if (selectedOption === 'UG') {
            tableContainer.style.display = 'flex';
            textareaContainer.style.display = 'none';

            // Add the required attribute to input fields in the UG table
            tableInputs.forEach(function (input) {
                input.setAttribute('required', 'required');
            });

            textareaInput.removeAttribute('required');
        } else if (selectedOption === 'PG') {
            tableContainer.style.display = 'none';
            textareaContainer.style.display = 'block';

            // Remove the required attribute from input fields in the UG table
            tableInputs.forEach(function (input) {
                input.removeAttribute('required');
            });

            // Add the required attribute to the textarea in the PG section
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

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    $(document).ready(function() {
        $('.file-input').on('change', function() {
            var fileName = $(this).val().split('\\').pop();
            $(this).siblings('.file-label').text(fileName);
        });
    });
</script>
