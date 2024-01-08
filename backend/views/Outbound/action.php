<?php

use common\models\Kcdio;
use dosamigos\tinymce\TinyMce;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\web\YiiAsset;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var common\models\Outbound $model */
/** @var common\models\Kcdio $modelKedio */


$this->title = $model->Name;

YiiAsset::register($this);
require Yii::getAlias('@common').'/Helpers/helper.php';
$this->registerJsFile('https://code.jquery.com/jquery-3.6.0.min.js');
?>




	<div class = "card shadow-none border">
	<div class = "card-body">
		<div class="d-flex justify-content-between">
	<div class = "d-flex align-items-center header-info gap-1 mb-4">
		<i class = "ti ti-activity text-dark"></i>
		<strong>
			<h4 class = "fw-semibold m-0 text-capitalize">Applicant Action: <?= $model->Name?></h4>
		</strong>
	</div>
            <?= Html::a(
                '<button class="btn btn-dark p-3 rounded-circle d-flex align-items-center justify-content-center customizer-btn"><i class="ti ti-eye fs-7"></i></button>',
                ['view', 'ID' => $model->ID],
            ) ?>


		</div>

		<div class = "row">
			<div class = "col-md-6">

				<p class = "mb-2 fw-light mb-1"><strong>Matric Number:</strong> <?= $model->Matric_Number ?></p>
				<p class = "mb-2 fw-light mb-1"><strong>Citizenship:</strong> <?= $model->Citizenship ?></p>
				<p class = "mb-2 fw-light mb-1"><strong>Gender:</strong> <?= getGenderMeaning($model->Gender) ?></p>
				<p class = "mb-2 fw-light mb-1"><strong>Date of Birth:</strong> <?= $model->Date_of_Birth ?></p>
			</div>
			<div class = "col-md-6">
				<p class = "mb-2 fw-light mb-1"><strong>Passport Number:</strong> <?= $model->Passport_Number ?></p>
				<p class = "mb-2 fw-light mb-1"><strong>Passport Expiration:</strong> <?= $model->Passport_Expiration ?></p>
				<p class = "mb-2 fw-light mb-1"><strong>Mobile Number:</strong> <?= $model->Mobile_Number ?></p>
				<p class = "mb-2 fw-light mb-1"><strong>Mobile Number:</strong> <?= $model->Email ?></p>

			</div>
		</div>
	</div>
	</div>



<?php if ($model->Status === 10 || $model->Status === 31 || $model->Status === 51 || $model -> Status === 11): ?>
	<div class = "mt-4 mb-4" id = "radio-buttons">

		<h1 class = "text-start fs-5 fw-semibold mb-3">RECOMMENDATION FROM OFFICE OF INTERNATIONAL AFFAIRS</h1>
		<form action = "" class = "d-flex mb-3">
			<?php if ($model->Status === 10 || $model->Status === 31 || $model -> Status === 51 || $model -> Status === 11): ?>
	                    <div>
		                    <input type="radio" class="btn-check" name="inlineRadioOptions" id="inlineRadio1" autocomplete="off" value="1" >
		                    <label class="btn btn-outline-success rounded-pill font-medium me-2 mb-2" for="inlineRadio1">Accept</label>
	                    </div>
                    <?php endif; ?>

                    <?php if ($model->Status === 10) : ?>
	                    <div>
		                    <input type="radio" class="btn-check" name="inlineRadioOptions" id="inlineRadio2" autocomplete="off" value="2">
		                    <label class="btn btn-outline-danger rounded-pill font-medium me-2 mb-2" for="inlineRadio2">Reject</label>
	                    </div>
                    <?php endif; ?>

                    <?php if ($model->Status === 10 || $model->Status === 51) : ?>

	                    <div>
		                    <input type="radio" class="btn-check" name="inlineRadioOptions" id="inlineRadio3" autocomplete="off" value="3">
		                    <label class="btn btn-outline-warning rounded-pill font-medium me-2 mb-2" for="inlineRadio3">Application Not Complete</label>
	                    </div>
                    <?php endif; ?>
				</form>
			</div>
        <?php endif; ?>
        <?php if ($model->Status === 12 || $model -> Status === 32): ?>
			<div class = "mt-4 mb-4" id = "radio-buttons1">
				<form action = "" class = "d-flex gap-5">

					<div class = "form-check form-check-inline">
						<label class = "form-check-label" for = "inlineRadio5">Reject</label>
						<input class = "form-check-input" type = "radio" name = "inlineRadioOptions" id = "inlineRadio5"
						       value = "2"/>
					</div>

					<div class = "form-check form-check-inline">
						<label class = "form-check-label" for = "inlineRadio4">resend</label>
						<input class = "form-check-input" type = "radio" name = "inlineRadioOptions" id = "inlineRadio4"
						       value = "3"/>
					</div>
				</form>
			</div>
        <?php endif; ?>


		<!--Status message-->
        <?php if ($model->Status === 1): ?>
			<div id = "approval-message-hod" class = "mt-4 alert alert-warning  ">
				<h5 class = "m-0 text-capitalize alert">waiting approval from HOD</h5>
			</div>
        <?php endif; ?>

        <?php if ($model->Status === 21): ?>
			<div id = "approval-message-dean"  class = "mt-4 alert alert-warning  ">
				<h5 class = "m-0 text-capitalize alert">waiting approval from dean</h5>
			</div>
        <?php endif; ?>

        <?php if($model ->Status === 61):?>
			<div id = "success" class = "mt-4 alert alert-success">
				<h5 class = "m-0 text-capitalize alert">application has been accepted</h5>
			</div>
        <?php endif?>

        <?php if($model -> Status === 2):?>
			<div id = "reject-io" class = "mt-4 alert alert-danger ">
				<h5 class = " alert m-0 text-capitalize">application has been rejected</h5>
			</div>
        <?php endif;?>

        <?php if($model -> Status === 3):?>
			<div id = "not-complete-io" class = "mt-4 alert alert-warning ">
				<h5 class = "m-0 text-capitalize alert">application is not completed, waiting for student to response</h5>
			</div>
        <?php endif;?>

        <?php $form = ActiveForm::begin(['action' => ['accept', 'ID' => $model->ID], 'class' => 'form']) ?>

		<div class = "conditional-form-elements" style = "display: none">
            <?php if ($model->Status === 10 || $model->Status === 11): ?>
				<div class = " row conditional-form-elements-initial">
					<div class = "col-md-6">
						<input type = "hidden" id = "selectedPersonId" name = "selectedPersonId">


						<div class = "form-group mb-2">
                            <?= $form->field($modelKedio, 'kcdio')->dropDownList(ArrayHelper::map(Kcdio::find()->all(),
                                'id', 'kcdio'),
                                ['prompt' => 'Select KCDIO', 'id' => 'kcdio-dropdown', 'required' => true])->label(false,
                                ['style' => 'display: none;']) ?>
						</div>

					</div>
					<div class = "col-md-6">
						<div class = "form-group mb-2">
							<select class = "form-control" id = "personInChargeDropdown" name = "personInChargeDropdown"
							        required>
								<option value = "">Select KCDIO first</option>
							</select>
						</div>
						<div class = "form-group mb-2">
							<input type = "text" readonly class = "form-control" id = "emailAddress" name = "emailAddress"
							       placeholder = "Email Address"/>
						</div>
						<div class = "form-group mb-2">
							<input type = "text" readonly class = "form-control" id = "ccEmailAddress"
							       placeholder = "CC Email Address"/>
						</div>
					</div>
				</div>
            <?php endif; ?>
			<div class = "d-flex justify-content-end">
                <?= Html::submitButton('Submit', ['class' => 'btn btn-dark px-5 mt-3']) ?>
			</div>

		</div>

        <?php ActiveForm::end() ?>


        <?php ActiveForm::begin(['action' => ['reject', 'ID' => $model->ID], 'class' => 'form']) ?>
        <?= Html::hiddenInput('status', 2, ['id' => 'status-input-reject']); ?>

		<div class = "conditional-form-elements-reject" style = "display: none;">
			<div class = "form-group">
                <?php
                echo TinyMce::widget([
                    'name' => 'reason', // Setting a name for the input
                    'options' => ['rows' => 12],
                    'language' => 'en',
                    'clientOptions' => [
                        'toolbar' => false,
                    ],
                    'value' => '', // Set initial value if needed
                ]);
                ?>
			</div>
			<div class = "d-flex justify-content-center">
                <?= Html::submitButton('Submit', ['class' => 'btn btn-dark px-5 mt-3']) ?>
			</div>
		</div>
        <?php ActiveForm::end() ?>


        <?php ActiveForm::begin(['action' => ['complete', 'ID' => $model->ID], 'class' => 'form']) ?>

		<div class = "conditional-form-elements-incomplete" style = "display: none;">
			<div class = "form-group">
				<?php
				echo TinyMce::widget([
                    'name' => 'reason', // Setting a name for the input
                    'options' => ['rows' => 12],
                    'language' => 'en',
                    'clientOptions' => [
                        'toolbar' => false,
                    ],
                    'value' => '', // Set initial value if needed
                ]);
				?>
			</div>
			<div class = "d-flex justify-content-center">
                <?= Html::submitButton('Submit', ['class' => 'btn btn-dark px-5 mt-3']) ?>
			</div>
		</div>
        <?php ActiveForm::end() ?>

        <?php ActiveForm::begin(['action' => ['resend', 'ID' => $model->ID], 'class' => 'form']) ?>

		<div class = "resend mt-3" id = "resend" style = "display: none;">
			<div class = "form-group">
                <?php
                echo TinyMce::widget([
                    'name' => 'reason', // Setting a name for the input
                    'options' => ['rows' => 12],
                    'language' => 'en',
                    'clientOptions' => [
                        'toolbar' => false,
                    ],
                    'value' => '', // Set initial value if needed
                ]);
                ?>
			</div>
			<div class = "d-flex justify-content-center">
                <?= Html::submitButton('Submit', ['class' => 'btn btn-dark px-5 mt-3']) ?>
			</div>
		</div>
        <?php ActiveForm::end() ?>






<?php
$this->registerJs("
        $(document).ready(function() {
            $('#inlineRadio1').on('change', function() {
                  if(this.checked){                            
                    $('.conditional-form-elements').show();
                    $('.conditional-form-elements-reject').hide();
                       $('.conditional-form-elements-incomplete').hide();
                }
            });
           $('#inlineRadio2, #inlineRadio5').on('change', function() {
                if (this.checked) {
                    $('.conditional-form-elements-reject').show();
                    $('.conditional-form-elements').hide();
                    $('.conditional-form-elements-incomplete').hide();
                    $('.resend').hide();
                }
            });
            $('#inlineRadio3').on('change', function() {
                if (this.checked) {
                    $('.conditional-form-elements-incomplete').show();
                       $('.conditional-form-elements').hide();
                       $('.conditional-form-elements-reject').hide();
                }
            });
            $('#inlineRadio4').on('change',function(){
                if (this.checked){
                    $('.resend').show();
                       $('.conditional-form-elements').hide();
                       $('.conditional-form-elements-reject').hide();
                         
                }
            });
        });
    ");
?>

<?php
$this->registerJs("
    $(document).ready(function() {
        $('#kcdio-dropdown').on('change', function() {
            var selectedValueFromKedio = $(this).find('option:selected').text(); // Get the selected option's text (KCDIO value)
            var personInChargeDropdown = $('#personInChargeDropdown');
            var emailValue = $('#emailAddress').val();
           
            var personInChargeEmail = $('#emailAddress');
            var selectedPersonInChargeName = $(this).find('option:selected').data('name');
            var personInChargeCCEmail = $('#ccEmailAddress');
            if (selectedValueFromKedio) {
                // Make an AJAX request to load people based on the selected KCDIO
                $.ajax({
                    url: '".yii\helpers\Url::to(['load-people'])."',
                    type: 'POST',
                    data: {
                    kcdio: selectedValueFromKedio,
                    emailAddress: emailValue,
                    name: selectedPersonInChargeName,    
                  
                    }, // Send the KCDIO value
                    success: function(data) {
                   console.log(data);
                      
                        personInChargeDropdown.empty();
                        personInChargeDropdown.append($('<option value=\"\">Select a Person in Charge</option>'));

                        // Populate the Person in Charge dropdown with the loaded data
                        $.each(data, function(index, person) {                        
                            personInChargeDropdown.append($('<option value=\"' + person.id + '\">' + person.name + '</option>'));                          
                        });    
                        
                        //based of selection of person in charge --> auto fill needed informations                   
                        personInChargeDropdown.on('change', function(){
                        var selectedPersonInCharge= $(this).val();
                        var selectedPersonInCharge = data.find(function(person) {                                                                                                      
                                return person.id == selectedPersonInCharge;                           
                            });
                         if (selectedPersonInCharge) {
                                // Display the email
                                personInChargeEmail.val(selectedPersonInCharge.email);
                                personInChargeCCEmail.val(selectedPersonInCharge.email)
                                $('#selectedPersonId').val(selectedPersonInCharge.id);
                            } else {
                            personInChargeEmail.val('');
					        personInChargeCCEmail.val('');
                            $('#selectedPersonId').val('');
                            }
                        
                        });                          
        
                    },
                    error: function() {
                        console.log('Error loading data.');
                    }
                });
            } else {
                // If no KCDIO is selected, reset the Person in Charge dropdown
                personInChargeDropdown.empty();
                personInChargeDropdown.append($('<option value=\"\">Select KCDIO first</option>'));
            }
        });
    });
");
?>