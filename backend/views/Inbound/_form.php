<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var common\models\Inbound $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="inbound-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'Name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Gender')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Relation_ship')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Date_of_Birth')->textInput() ?>

    <?= $form->field($model, 'Passport_Number')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Passport_Expiration')->textInput() ?>

    <?= $form->field($model, 'Religion')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Mazhab')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Citizenship')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Country_of_origin')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Country_of_residence')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Mobile_Number')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Email_address')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Permanent_Address')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Postcode')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Country')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Emergency_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Emergency_relationship')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Emergency_phoneNumber')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Emergency_email')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Emergency_homeAddress')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Emergency_postCode')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Emergency_country')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Academic_home_university')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Academic_lvl_edu')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Academic_name_of_programme')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Academic_current_semester')->textInput() ?>

    <?= $form->field($model, 'Academic_current_year')->textInput() ?>

    <?= $form->field($model, 'Academic_name_of_faculty')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Academic_current_result')->textInput() ?>

    <?= $form->field($model, 'Research_title')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Mou_or_Moa')->textInput() ?>

    <?= $form->field($model, 'English_native')->textInput() ?>

    <?= $form->field($model, 'English_test_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'English_other_test_name')->textInput(['maxlength' => true]) ?>



    <?= $form->field($model, 'Propose_type_of_programme')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Propose_type_of_programme_other')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Propose_type_of_mobility')->textInput() ?>

    <?= $form->field($model, 'Propose_kulliyyah_applied')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Propose_duration_of_study')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Propose_duration_start')->textInput() ?>

    <?= $form->field($model, 'Propose_duration_end')->textInput() ?>

    <?= $form->field($model, 'Propose_transfer_credit_hours')->textInput() ?>

    <?= $form->field($model, 'Financial_accommodation_on_campus')->textInput() ?>

    <?= $form->field($model, 'campus_location')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Financial_funding')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Sponsor_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Room_type')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Financial_funding_sponsor_amount')->textInput() ?>

    <?= $form->field($model, 'Financial_funding_other')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Approval_university_person_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Approval_person_position')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Approval_person_email')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Approval_person_mobile_number')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Approval_date')->textInput() ?>

    <?= $form->field($model, 'Status')->textInput() ?>

    <?= $form->field($model, 'Kulliyyah')->textInput() ?>

    <?= $form->field($model, 'msd_cps')->textInput() ?>

    <?= $form->field($model, 'note_kulliyyah')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'note_msd_cps')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'Token')->textInput(['maxlength' => true]) ?>



    <?= $form->field($model, 'reference_number')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
