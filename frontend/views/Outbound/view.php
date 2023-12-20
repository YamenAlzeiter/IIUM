<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/** @var yii\web\View $this */
/** @var common\models\Outbound $model */

$this->title = $model->Name;
$this->params['breadcrumbs'][] = ['label' => 'Outbounds', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="outbound-view">

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
            'Status',
            'Matric_Number',
            'Name',
            'Citizenship',
            'Gender',
            'Date_of_Birth',
            'Passport_Number',
            'Passport_Expiration',
            'Mobile_Number',
            'Email:email',
            'Permanent_Address',
            'Postcode',
            'State',
            'Country',
            'Mailing_Address',
            'Mailing_Postcode',
            'Mailing_State',
            'Mailing_Country',
            'Dean_ID',
            'Person_in_charge_ID',
            'Note_dean',
            'Note_hod',
            'Emergency_name',
            'Emergency_relationship',
            'Emergency_phoneNumber',
            'Emergency_email:email',
            'Emergency_homeAddress',
            'Emergency_postCode',
            'Emergency_tate',
            'Emergency_country',
            'Academic_lvl_edu',
            'Academic_kulliyyah',
            'Academic_kulliyyah_others',
            'Academic_current_semester',
            'Academic_current_year',
            'Academic_name_of_programme',
            'Academic_cgpa',
            'Research',
            'English_language_proficiency',
            'English_result',
            'Third_language',
            'Financial_funded_accept',
            'Sponsoring_name',
            'Sponsoring_name_other',
            'Sponsoring_funding',
            'Type_mobility',
            'Type_mobility_program',
            'Type_mobility_program_other',
            'Host_university_name',
            'Mobility_from',
            'Mobility_until',
            'Country_host_university',
            'credit_transfer_availability',
            'Connect_host_name',
            'Connect_host_position',
            'Connect_host_mobile_number',
            'Connect_host_address',
            'Connect_host_postcode',
            'Connect_host_country',
            'host_scholarship',
            'host_scholarship_amount',
            'Offer_letter',
            'Academic_transcript',
            'Program_brochure',
            'Latest_pay_slip',
            'Other_latest_pay_slip',
            'Proof_of_sponsorship',
            'Proof_insurance_cover',
            'Letter_of_indemnity',
            'Flight_ticket',
            'agreement_data',
            'agreement',
            'updated_at',
            'created_at',
            'token',
            'Connect_host_email:email',
            'temp',
        ],
    ]) ?>

</div>
