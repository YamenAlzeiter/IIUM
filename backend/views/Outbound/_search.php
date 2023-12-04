<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var backend\views\Outbound\outboundSearch $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="outbound-search mb-2">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'ID') ?>

    <?= $form->field($model, 'Status') ?>

    <?= $form->field($model, 'Matric_Number') ?>

    <?= $form->field($model, 'Name') ?>

    <?= $form->field($model, 'Citizenship') ?>

    <?php // echo $form->field($model, 'Gender') ?>

    <?php // echo $form->field($model, 'Date_of_Birth') ?>

    <?php // echo $form->field($model, 'Passport_Number') ?>

    <?php // echo $form->field($model, 'Passport_Expiration') ?>

    <?php // echo $form->field($model, 'Mobile_Number') ?>

    <?php // echo $form->field($model, 'Email') ?>

    <?php // echo $form->field($model, 'Permanent_Address') ?>

    <?php // echo $form->field($model, 'Postcode') ?>

    <?php // echo $form->field($model, 'State') ?>

    <?php // echo $form->field($model, 'Country') ?>

    <?php // echo $form->field($model, 'Mailing_Address') ?>

    <?php // echo $form->field($model, 'Mailing_Postcode') ?>

    <?php // echo $form->field($model, 'Mailing_State') ?>

    <?php // echo $form->field($model, 'Mailing_Country') ?>

    <?php // echo $form->field($model, 'Dean_ID') ?>

    <?php // echo $form->field($model, 'Person_in_charge_ID') ?>

    <?php // echo $form->field($model, 'Note_dean') ?>

    <?php // echo $form->field($model, 'Note_hod') ?>

    <?php // echo $form->field($model, 'Emergency_name') ?>

    <?php // echo $form->field($model, 'Emergency_relationship') ?>

    <?php // echo $form->field($model, 'Emergency_phoneNumber') ?>

    <?php // echo $form->field($model, 'Emergency_email') ?>

    <?php // echo $form->field($model, 'Emergency_homeAddress') ?>

    <?php // echo $form->field($model, 'Emergency_postCode') ?>

    <?php // echo $form->field($model, 'Emergency_tate') ?>

    <?php // echo $form->field($model, 'Emergency_country') ?>

    <?php // echo $form->field($model, 'Academic_lvl_edu') ?>

    <?php // echo $form->field($model, 'Academic_kulliyyah') ?>

    <?php // echo $form->field($model, 'Academic_kulliyyah_others') ?>

    <?php // echo $form->field($model, 'Academic_current_semester') ?>

    <?php // echo $form->field($model, 'Academic_current_year') ?>

    <?php // echo $form->field($model, 'Academic_name_of_programme ') ?>

    <?php // echo $form->field($model, 'Academic_cgpa') ?>

    <?php // echo $form->field($model, 'Research') ?>

    <?php // echo $form->field($model, 'English_language_proficiency') ?>

    <?php // echo $form->field($model, 'English_result') ?>

    <?php // echo $form->field($model, 'Third_language') ?>

    <?php // echo $form->field($model, 'Financial_funded_accept') ?>

    <?php // echo $form->field($model, 'Sponsoring_name') ?>

    <?php // echo $form->field($model, 'Sponsoring_name_other') ?>

    <?php // echo $form->field($model, 'Sponsoring_funding') ?>

    <?php // echo $form->field($model, 'Type_mobility') ?>

    <?php // echo $form->field($model, 'Type_mobility_program') ?>

    <?php // echo $form->field($model, 'Type_mobility_program_other') ?>

    <?php // echo $form->field($model, 'Host_university_name') ?>

    <?php // echo $form->field($model, 'Mobility_from') ?>

    <?php // echo $form->field($model, 'Mobility_until') ?>

    <?php // echo $form->field($model, 'Country_host_university') ?>

    <?php // echo $form->field($model, 'credit_transfer_availability') ?>

    <?php // echo $form->field($model, 'Connect_host_name') ?>

    <?php // echo $form->field($model, 'Connect_host_position') ?>

    <?php // echo $form->field($model, 'Connect_host_mobile_number') ?>

    <?php // echo $form->field($model, 'Connect_host_address') ?>

    <?php // echo $form->field($model, 'Connect_host_postcode') ?>

    <?php // echo $form->field($model, 'Connect_host_country') ?>

    <?php // echo $form->field($model, 'host_scholarship') ?>

    <?php // echo $form->field($model, 'host_scholarship_amount') ?>

    <?php // echo $form->field($model, 'Offer_letter') ?>

    <?php // echo $form->field($model, 'Academic_transcript') ?>

    <?php // echo $form->field($model, 'Program_brochure') ?>

    <?php // echo $form->field($model, 'Latest_pay_slip') ?>

    <?php // echo $form->field($model, 'Other_latest_pay_slip') ?>

    <?php // echo $form->field($model, 'Proof_of_sponsorship') ?>

    <?php // echo $form->field($model, 'Proof_insurance_cover') ?>

    <?php // echo $form->field($model, 'Letter_of_indemnity') ?>

    <?php // echo $form->field($model, 'Flight_ticket') ?>

    <?php // echo $form->field($model, 'agreement_data') ?>

    <?php // echo $form->field($model, 'agreement') ?>

    <?php // echo $form->field($model, 'updated_at') ?>

    <?php // echo $form->field($model, 'created_at') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
