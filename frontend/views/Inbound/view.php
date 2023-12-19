<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/** @var yii\web\View $this */
/** @var common\models\Inbound $model */

$this->title = $model->Name;
$this->params['breadcrumbs'][] = ['label' => 'Inbounds', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="inbound-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'ID' => $model->ID], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'ID' => $model->ID], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'ID',
            'Name',
            'Gender',
            'Relation_ship',
            'Date_of_Birth',
            'Passport_Number',
            'Passport_Expiration',
            'Religion',
            'Mazhab',
            'Citizenship',
            'Country_of_origin',
            'Country_of_residence',
            'Mobile_Number',
            'Email_address:email',
            'Permanent_Address',
            'Postcode',
            'Country',
            'Emergency_name',
            'Emergency_relationship',
            'Emergency_phoneNumber',
            'Emergency_email:email',
            'Emergency_homeAddress',
            'Emergency_postCode',
            'Emergency_country',
            'Academic_home_university',
            'Academic_lvl_edu',
            'Academic_name_of_programme',
            'Academic_current_semester',
            'Academic_current_year',
            'Academic_name_of_faculty',
            'Academic_current_result',
            'Research_title',
            'Mou_or_Moa',
            'English_native',
            'English_test_name',
            'English_certificate',
            'Propose_type_of_programme',
            'Propose_type_of_programme_other',
            'Propose_type_of_mobility',
            'Propose_kulliyyah_applied',
            'Propose_duration_of_study',
            'Propose_duration_start',
            'Propose_duration_end',
            'Propose_transfer_credit_hours',
            'Financial_accommodation_on_campus',
            'campus_location',
            'Financial_funding',
            'Sponsor_name',
            'Financial_funding_sponsor_amount',
            'Financial_funding_other',
            'Approval_university_person_name',
            'Approval_person_position',
            'Approval_person_email:email',
            'Approval_person_mobile_number',
            'Approval_date',
            'Recommendation_letter',
            'Student_declaration_name',
            'Student_declaration_date',
            'Student_declaration_agreement',
            'Passport',
            'Latest_passport_photo',
            'Latest_certified_academic_transcript',
            'Confirmation_letter',
            'Sponsorship_letter',
            'Status',
            'Kulliyyah',
            'msd_cps',
            'note_kulliyyah',
            'note_msd_cps',
            'Token',
            'created_at',
            'updated_at',
            'offer_letter',
            'reference_number',
        ],
    ]) ?>

</div>
