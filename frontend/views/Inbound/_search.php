<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var frontend\views\Inbound\inboundSearch $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="inbound-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'ID') ?>

    <?= $form->field($model, 'Name') ?>

    <?= $form->field($model, 'Gender') ?>

    <?= $form->field($model, 'Relation_ship') ?>

    <?= $form->field($model, 'Date_of_Birth') ?>

    <?php // echo $form->field($model, 'Passport_Number') ?>

    <?php // echo $form->field($model, 'Passport_Expiration') ?>

    <?php // echo $form->field($model, 'Religion') ?>

    <?php // echo $form->field($model, 'Mazhab') ?>

    <?php // echo $form->field($model, 'Citizenship') ?>

    <?php // echo $form->field($model, 'Country_of_origin') ?>

    <?php // echo $form->field($model, 'Country_of_residence') ?>

    <?php // echo $form->field($model, 'Mobile_Number') ?>

    <?php // echo $form->field($model, 'Email_address') ?>

    <?php // echo $form->field($model, 'Permanent_Address') ?>

    <?php // echo $form->field($model, 'Postcode') ?>

    <?php // echo $form->field($model, 'Country') ?>

    <?php // echo $form->field($model, 'Emergency_name') ?>

    <?php // echo $form->field($model, 'Emergency_relationship') ?>

    <?php // echo $form->field($model, 'Emergency_phoneNumber') ?>

    <?php // echo $form->field($model, 'Emergency_email') ?>

    <?php // echo $form->field($model, 'Emergency_homeAddress') ?>

    <?php // echo $form->field($model, 'Emergency_postCode') ?>

    <?php // echo $form->field($model, 'Emergency_country') ?>

    <?php // echo $form->field($model, 'Academic_home_university') ?>

    <?php // echo $form->field($model, 'Academic_lvl_edu') ?>

    <?php // echo $form->field($model, 'Academic_name_of_programme') ?>

    <?php // echo $form->field($model, 'Academic_current_semester') ?>

    <?php // echo $form->field($model, 'Academic_current_year') ?>

    <?php // echo $form->field($model, 'Academic_name_of_faculty') ?>

    <?php // echo $form->field($model, 'Academic_current_result') ?>

    <?php // echo $form->field($model, 'Research_title') ?>

    <?php // echo $form->field($model, 'Mou_or_Moa') ?>

    <?php // echo $form->field($model, 'English_native') ?>

    <?php // echo $form->field($model, 'English_test_name') ?>

    <?php // echo $form->field($model, 'English_certificate') ?>

    <?php // echo $form->field($model, 'Propose_type_of_programme') ?>

    <?php // echo $form->field($model, 'Propose_type_of_programme_other') ?>

    <?php // echo $form->field($model, 'Propose_type_of_mobility') ?>

    <?php // echo $form->field($model, 'Propose_kulliyyah_applied') ?>

    <?php // echo $form->field($model, 'Propose_duration_of_study') ?>

    <?php // echo $form->field($model, 'Propose_duration_start') ?>

    <?php // echo $form->field($model, 'Propose_duration_end') ?>

    <?php // echo $form->field($model, 'Propose_transfer_credit_hours') ?>

    <?php // echo $form->field($model, 'Financial_accommodation_on_campus') ?>

    <?php // echo $form->field($model, 'campus_location') ?>

    <?php // echo $form->field($model, 'Financial_funding') ?>

    <?php // echo $form->field($model, 'Sponsor_name') ?>

    <?php // echo $form->field($model, 'Financial_funding_sponsor_amount') ?>

    <?php // echo $form->field($model, 'Financial_funding_other') ?>

    <?php // echo $form->field($model, 'Approval_university_person_name') ?>

    <?php // echo $form->field($model, 'Approval_person_position') ?>

    <?php // echo $form->field($model, 'Approval_person_email') ?>

    <?php // echo $form->field($model, 'Approval_person_mobile_number') ?>

    <?php // echo $form->field($model, 'Approval_date') ?>

    <?php // echo $form->field($model, 'Recommendation_letter') ?>

    <?php // echo $form->field($model, 'Student_declaration_name') ?>

    <?php // echo $form->field($model, 'Student_declaration_date') ?>

    <?php // echo $form->field($model, 'Student_declaration_agreement') ?>

    <?php // echo $form->field($model, 'Passport') ?>

    <?php // echo $form->field($model, 'Latest_passport_photo') ?>

    <?php // echo $form->field($model, 'Latest_certified_academic_transcript') ?>

    <?php // echo $form->field($model, 'Confirmation_letter') ?>

    <?php // echo $form->field($model, 'Sponsorship_letter') ?>

    <?php // echo $form->field($model, 'Status') ?>

    <?php // echo $form->field($model, 'Kulliyyah') ?>

    <?php // echo $form->field($model, 'msd_cps') ?>

    <?php // echo $form->field($model, 'note_kulliyyah') ?>

    <?php // echo $form->field($model, 'note_msd_cps') ?>

    <?php // echo $form->field($model, 'Token') ?>

    <?php // echo $form->field($model, 'created_at') ?>

    <?php // echo $form->field($model, 'updated_at') ?>

    <?php // echo $form->field($model, 'offer_letter') ?>

    <?php // echo $form->field($model, 'reference_number') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
