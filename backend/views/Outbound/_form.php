<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var common\models\Outbound $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="outbound-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'Status')->textInput() ?>

    <?= $form->field($model, 'Matric_Number')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Citizenship')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Gender')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Date_of_Birth')->textInput() ?>

    <?= $form->field($model, 'Passport_Number')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Passport_Expiration')->textInput() ?>

    <?= $form->field($model, 'Mobile_Number')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Email')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Permanent_Address')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Postcode')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'State')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Country')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Mailing_Address')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Mailing_Postcode')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Mailing_State')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Mailing_Country')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Dean_ID')->textInput() ?>

    <?= $form->field($model, 'Person_in_charge_ID')->textInput() ?>

    <?= $form->field($model, 'Note_dean')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Note_hod')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Emergency_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Emergency_relationship')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Emergency_phoneNumber')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Emergency_email')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Emergency_homeAddress')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Emergency_postCode')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Emergency_tate')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Emergency_country')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Academic_lvl_edu')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Academic_kulliyyah')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Academic_kulliyyah_others')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Academic_current_semester')->textInput() ?>

    <?= $form->field($model, 'Academic_current_year')->textInput() ?>

    <?= $form->field($model, 'Academic_cgpa')->textInput() ?>

    <?= $form->field($model, 'Research')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'English_language_proficiency')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'English_result')->textInput() ?>

    <?= $form->field($model, 'Third_language')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Financial_funded_accept')->textInput() ?>

    <?= $form->field($model, 'Sponsoring_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Sponsoring_name_other')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Sponsoring_funding')->textInput() ?>

    <?= $form->field($model, 'Type_mobility')->textInput() ?>

    <?= $form->field($model, 'Type_mobility_program')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Type_mobility_program_other')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Host_university_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Mobility_from')->textInput() ?>

    <?= $form->field($model, 'Mobility_until')->textInput() ?>

    <?= $form->field($model, 'Country_host_university')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'credit_transfer_availability')->textInput() ?>

    <?= $form->field($model, 'Connect_host_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Connect_host_position')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Connect_host_mobile_number')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Connect_host_address')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Connect_host_postcode')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Connect_host_country')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'host_scholarship')->textInput() ?>

    <?= $form->field($model, 'host_scholarship_amount')->textInput(['maxlength' => true]) ?>

<!--    --><?php //= $form->field($model, 'Offer_letter')->textInput() ?>
<!---->
<!--    --><?php //= $form->field($model, 'Academic_transcript')->textInput() ?>
<!---->
<!--    --><?php //= $form->field($model, 'Program_brochure')->textInput() ?>
<!---->
<!--    --><?php //= $form->field($model, 'Latest_pay_slip')->textInput() ?>
<!---->
<!--    --><?php //= $form->field($model, 'Other_latest_pay_slip')->textInput() ?>
<!---->
<!--    --><?php //= $form->field($model, 'Proof_of_sponsorship')->textInput() ?>
<!---->
<!--    --><?php //= $form->field($model, 'Proof_insurance_cover')->textInput() ?>
<!---->
<!--    --><?php //= $form->field($model, 'Letter_of_indemnity')->textInput() ?>
<!---->
<!--    --><?php //= $form->field($model, 'Flight_ticket')->textInput() ?>

    <?= $form->field($model, 'agreement_data')->textInput() ?>

    <?= $form->field($model, 'agreement')->textInput() ?>

    <?= $form->field($model, 'updated_at')->textInput() ?>

    <?= $form->field($model, 'created_at')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
