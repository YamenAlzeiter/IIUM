<?php

use common\models\Countries;
use common\models\States;
use yii\bootstrap5\ActiveForm;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;


/** @var yii\web\View $this */
/** @var common\models\Outbound $model */
/** @var yii\widgets\ActiveForm $form */

$templateFileInput = '<div class="row align-items-center"><div class="col-md-2">{label}</div><div class="col-md">{input}</div>{error}</div>';
$templateRadio = '<legend class="col-form-label col-sm-6 pt-0">{label}</legend>{input}{error}';
require Yii::getAlias('@common').'/Helpers/helper.php';
?>

<?php $form = ActiveForm::begin([
    'enableClientValidation' => false,
    'fieldConfig' => [
        'template' => "<div class='form-floating mb-3'>{input}{label}{error}</div>",
        'labelOptions' => ['class' => null],  // Remove label class

    ],
]); ?>

<div class = "mb-3 form-group">
    <?= $form->field($model, 'Name')->textInput(['maxlength' => true, 'placeholder' => '']) ?>
</div>
<div class = "row">
    <div class = "col-md-6">
        <?= $form->field($model, 'Matric_Number')->textInput(['value' => Yii::$app->user->identity->matric_number ,'maxlength' => true, 'placeholder' => '', 'disabled' => true]) ?>
    </div>
    <div class = "col-md-6">
        <?= $form->field($model, 'Citizenship')->dropDownList(ArrayHelper::map(Countries::find()->where(['nationality' => 'Malaysian'])->all(), 'nationality', 'nationality'), ['prompt' => 'Select Nationality', 'unselect' => null]) ?>
    </div>
</div>
<div class = "row align-items-center">
    <div class = "col-md-6">
        <?= $form->field($model, 'Gender', ['template' => $templateRadio,   'labelOptions' => ['class' => 'form-label'], ])->inline(true)->radioList(['M' => 'Male', 'F' => 'Female']) ?>
    </div>
    <div class = "col-md-6">
        <?= $form->field($model, 'Date_of_Birth')->Input('date') ?>
    </div>
</div>
<div class = "row">
    <div class = "col-md-6">
        <?= $form->field($model, 'Passport_Number')->textInput(['maxlength' => true, 'placeholder' => '']) ?>
    </div>
    <div class = "col-md-6">
        <?= $form->field($model, 'Passport_Expiration')->input('date', ['min' => date('Y-m-d')]) ?>
    </div>
</div>
<div class = "row">
    <div class = "col-md-6"><?= $form->field($model, 'Mobile_Number')->textInput(['maxlength' => true, 'placeholder' => '']) ?></div>
    <div class = "col-md-6"><?= $form->field($model, 'Email')->textInput(['maxlength' => true, 'placeholder' => '']) ?></div>
</div>
<div class = "row">
    <div class = "col"><?= $form->field($model, 'Permanent_Address')->textarea(['maxlength' => true, 'placeholder' => '']) ?></div>
</div>
<div class = "row">
    <div class = "col-md-4">
        <?= $form->field($model, 'Country')->dropDownList(ArrayHelper::map(Countries::find()->where([ 'name' => 'Malaysia'])->all(), 'id', 'name'), ['prompt' => 'Select Country', 'id' => 'country-dropdown']) ?>
    </div>
    <div class = "col-md-4">
        <?= $form->field($model, 'State')->dropDownList($model->Country != '' ? ArrayHelper::map(States::find()->where(['country_id' => $model->Country])->all(), 'id', 'name') : [] , ['prompt' => 'Select State', 'id' => 'state-dropdown']) ?>
    </div>
    <div class = "col-md-4">
        <?= $form->field($model, 'Postcode')->textInput(['maxlength' => true, 'placeholder' => '']) ?>
    </div>
</div>
<?= $form->field($model, 'Emergency_name')->textInput(['maxlength' => true, 'placeholder' => ''])?>

<div class = "row">
    <div class = "col-md-4">
        <?= $form->field($model, 'Emergency_relationship')->textInput(['maxlength' => true, 'placeholder' => ''])?>
    </div>
    <div class = "col-md-4">
        <?= $form->field($model, 'Emergency_phoneNumber')->textInput(['maxlength' => true, 'placeholder' => ''])?>
    </div>
    <div class = "col-md-4">
        <?= $form->field($model, 'Emergency_email')->textInput(['maxlength' => true, 'placeholder' => ''])?>
    </div>
</div>
<div class="row">
    <div class="col">
        <?= $form->field($model, 'Emergency_homeAddress')->textarea(['maxlength' => true, 'placeholder' => ''])?>
    </div>
</div>
<div class = "row">
    <div class = "col-md-4">
        <?= $form->field($model, 'Emergency_country')->dropDownList(ArrayHelper::map(Countries::find()->all(), 'id', 'name'), ['prompt' => 'Select Country', 'id' => 'emergency-country-dropdown']) ?>
    </div>
    <div class = "col-md-4">
        <?= $form->field($model, 'Emergency_tate')->dropDownList($model->Emergency_country != '' ? ArrayHelper::map(States::find()->where(['country_id' => $model->Emergency_country])->all(), 'id', 'name') : [] , ['prompt' => 'Select State', 'id' => 'state-dropdown']) ?>
    </div>
    <div class = "col-md-4">
        <?= $form->field($model, 'Emergency_postCode')->textInput(['maxlength' => true, 'placeholder' => '']) ?>
    </div>
</div>
<div class = "row">
    <div class = "col-md-4"><?= $form->field($model, 'Academic_lvl_edu')->dropDownList(['UG' => 'Undergraduate', 'PG' => 'Postgraduate'],['prompt' => 'Select Level of Education', 'id' => 'edu-lvl']) ?></div>
    <div class = "col-md-4"><?= $form->field($model, 'Academic_kulliyyah')->dropDownList(ArrayHelper::map(\common\models\Kcdio::find()->all(), 'kcdio', 'kcdio') + ['Other' => 'Other'], ['prompt' => 'Select Kulliyyah','id' => 'kulliyyah']) ?></div>
    <div class="col-md-4"><?= $form->field($model, 'Academic_kulliyyah_others')->textInput(['maxlength' => true, 'placeholder' => '', 'disabled' => $model->Academic_kulliyyah !== 'Other', 'id' => 'kulliyyah_other',])?></div>
</div>
<div class = "row">
    <div class = "col-md"><?= $form->field($model, 'Academic_current_semester')->dropDownList(array_combine(range(1, 10), array_map(function ($i) {return "Semester  $i";}, range(1, 10))), ['prompt' => 'Select Semester']) ?></div>
    <div class = "col-md"><?= $form->field($model, 'Academic_current_year')->dropDownList(array_combine(range(1,6), array_map(function ($i){return "Year $i";}, range(1, 6))), ['prompt' => 'Select Year'],)?></div>
</div>
<div class = "row">
    <div class = "col-md"><?= $form->field($model, 'Academic_name_of_programme')->textInput(['maxlength' => true, 'placeholder' => ''])?></div>
    <div class = "col-md-3"><?= $form->field($model, 'Academic_cgpa')->textInput(['maxlength' => true, 'placeholder' => ''])?></div>
</div>
<hr>
<h4>LANGUAGE PROFICIENCY</h4>
<div class = "row">
    <div class = "col-md"><?= $form->field($model, 'English_language_proficiency')->dropDownList(['Malaysia University English Test' => 'Malaysia University English Test', 'TOFEL'=> 'TOFEL', 'IELTS' => 'IELTS', 'Other' => 'Third Language'],['prompt' => 'Select Test', 'id' => 'english'])?></div>
    <div class = "col-md"><?= $form->field($model, 'Third_language')->textInput(['maxlength' => true, 'placeholder' => '', 'id' => 'english_other', 'disabled' => $model->English_language_proficiency !== 'Other'])?></div>
    <div class = "col-md"><?= $form->field($model, 'English_result')->textInput(['maxlength' => true, 'placeholder' => ''])?></div>
</div>
<h4>FINANCIAL INFORMATION</h4>
<div class = "row">
    <div class = "col-md"><?= $form->field($model, 'Financial_funded_accept', ['template' => $templateRadio,   'labelOptions' => ['class' => 'form-label']])->inline('true')->radioList(['1' => 'Yes', '0' => 'No'], ['unselect' => null])?></div>
    <div class = "col-md">    <?= $form->field($model, 'Sponsoring_name')->dropDownList(['JPA' => 'JPA', 'MARA' => 'MARA', 'PTPTN' => 'PTPTN', 'Other' => 'Other'], ['prompt' => 'Select Sponsor', 'id' => 'sponsor_name']) ?></div>
    <div class = "col-md"><?= $form->field($model, 'Sponsoring_name_other')->textInput(['maxlength' => true, 'placeholder' => '', 'id' => 'sponsor_other', 'disabled' => $model->Sponsoring_name !== 'Other'],  )?></div>
    <div class="col-md"><?= $form->field($model, 'Sponsoring_funding')->textInput(['maxlength' => true, 'placeholder' => ''])?></div>
</div>
<h4>MOBILITY PROGRAM INFORMATION</h4>
<hr>
<div class="row">
    <div class = "col-md"><?= $form->field($model, 'Type_mobility', ['template' =>$templateRadio,   'labelOptions' => ['class' => 'form-label']])->inline(true)->radioList(['1' => 'Physical', '2' => 'Virtual'],['unselect' => null])?></div>
    <div class = "col-md"><?= $form->field($model, 'Type_mobility_program')->dropDownList(["Exchange Program (1 or 2 semesters)" => "Exchange Program (1 or 2 semesters)", "Erasmus+ Exchange Program" => "Erasmus+ Exchange Program", "Mevlana Exchange Program" => "Mevlana Exchange Program", "Global UGRAD Program" => "Global UGRAD Program", "Research Program" => "Research Program", "Summer Program" => "Summer Program", "Industrial Training/Internship" => "Industrial Training/Internship", "Educational Visit" => "Educational Visit", "Other" => "Other"], ['prompt' => 'Select Program', 'id' => 'mobility_programme']) ?></div>
    <div class = "col-md-3"><?= $form->field($model, 'Type_mobility_program_other')->textInput(['maxlength' => true, 'placeholder' => '', 'id' => 'mobility_other', 'disabled' => $model->Type_mobility_program !== 'Other'])?></div>
    <div class = "col-md"><?= $form->field($model, 'Country_host_university')->dropDownList(ArrayHelper::map(Countries::find()->all(), 'id', 'name'), ['prompt' => 'Select Country', 'id' => 'host-country-dropdown'])?></div>
</div>
<div class = "row">
    <div class = "col-md"><?= $form->field($model, 'Host_university_name')->textInput(['maxlength' => true, 'placeholder' => ''])?></div>
    <div class = "col-md"><?= $form->field($model, 'Mobility_from')->input('date', ['id' => 'Propose_duration_start', 'onkeydown' => 'return false'])?></div>
    <div class = "col-md"><?= $form->field($model, 'Mobility_until')->input('date', ['id' =>'Propose_duration_end', 'onkeydown' => 'return false'])?></div>
    <div class = "col-md"><?= $form->field($model, 'credit_transfer_availability', ['template' =>$templateRadio,   'labelOptions' => ['class' => 'form-label']])->inline(true)->radioList(['1' => 'Yes', '2' => 'No'],['unselect' => null])?></div>
</div>

<h4>CONTACT PERSON AT HOST UNIVERSITY</h4>
<hr>
<div class = "row">
    <div class = "col-md"><?= $form->field($model, 'Connect_host_name')->textInput(['maxlength' => true, 'placeholder' => ''])?></div>
</div>
<div class = "row">
    <div class = "col-md"><?= $form->field($model, 'Connect_host_position')->textInput(['maxlength' => true, 'placeholder' => ''])?></div>
    <div class = "col-md"><?= $form->field($model, 'Connect_host_mobile_number')->textInput(['maxlength' => true, 'placeholder' => ''])?></div>
    <div class = "col-md"><?= $form->field($model, 'Connect_host_email')->textInput(['maxlength' => true, 'placeholder' => ''])?></div>
</div>
<?= $form->field($model, 'Connect_host_address')->textarea(['maxlength' => true, 'placeholder' => ''])?>
<div class = "row">
    <div class = "col-md"><?= $form->field($model, 'Connect_host_country')->dropDownList(ArrayHelper::map(Countries::find()->all(), 'id', 'name'), ['prompt' => 'Select Country', 'id' => 'host-country-dropdown'])?></div>
    <div class = "col-md"><?= $form->field($model, 'Connect_host_postcode')->textInput(['maxlength'])?></div>
</div>
<?= $form->field($model, 'Research')->textarea(['maxlength' => true, 'placeholder' => null])?>
<?= Html::submitButton('Save',
    ['class' => 'btn btn-outline-dark btn-navigate-form-step btn-next fs-5']) ?>
<?php ActiveForm::end(); ?>