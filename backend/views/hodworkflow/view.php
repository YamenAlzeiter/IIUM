<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;

$this->title = 'Approval';

/** @var common\models\Ob010 $model */
require Yii::getAlias('@common') . '/Helpers/helper.php';
?>
<h3>OB-210S</h3>

<div class="ob010-view">

    <h1 class="text-capitalize mb-4 ">Personal info</h1>

    <div class="row">
        <div class="col-md-6">
            <p class="mb-2"><strong>Name:</strong> <?= $model->Name ?></p>
            <p class="mb-2"><strong>Matric Number:</strong> <?= $model->Matric_Number ?></p>
            <p class="mb-2"><strong>Citizenship:</strong> <?= $model->Citizenship ?></p>
            <p class="mb-2"><strong>Gender:</strong> <?= getGenderMeaning($model->Gender) ?></p>
            <p class="mb-2"><strong>Date of Birth:</strong> <?= $model->Date_of_Birth ?></p>
        </div>
        <div class="col-md-6">
            <p class="mb-2"><strong>Passport Number:</strong> <?= $model->Passport_Number ?></p>
            <p class="mb-2"><strong>Passport Expiration:</strong> <?= $model->Passport_Expiration ?></p>
            <p class="mb-2"><strong>Mobile Number:</strong> <?= $model->Mobile_Number ?></p>
            <p class="mb-2"><strong>Email Address:</strong> <?= $model->Email ?></p>
        </div>
    </div>

    <!--        <div class="flex-grow-1">-->
<!--            <p class="mb-2"><strong>Permanent Address:</strong> --><?php //= $model->Permanent_Address ?><!--</p>-->
<!--            <p class="mb-2"><strong>Postcode:</strong> --><?php //= $model->Postcode ?><!--</p>-->
<!--            <p class="mb-2"><strong>State:</strong> --><?php //= $model->State ?><!--</p>-->
<!--            <p class="mb-2"><strong>Country:</strong> --><?php //= $model->Country ?><!--</p>-->
<!--            <p class="mb-2"><strong>Mailing Address:</strong> --><?php //= $model->Mailing_Address ?><!--</p>-->
<!--            <p class="mb-2"><strong>Mailing state:</strong> --><?php //= $model->Mailing_State ?><!--</p>-->
<!--            <p class="mb-2"><strong>Mailing Country:</strong> --><?php //= $model->Mailing_Country ?><!--</p>-->
<!--            <p class="mb-2"><strong>Relationship:</strong> --><?php //= $model->Relationship ?><!--</p>-->
<!--            <p class="mb-2"><strong>Status:</strong> --><?php //= getStatusMeaning($model->Status) ?><!--</p>-->
<!--        </div>-->
    </div>


<!--</div>-->

<div class="d-flex flex-row flex-row-reverse gap-2">

    <?= Html::a('Next', ['course-info', 'ID' => $model->ID, 'token' => $model->token], [
        'class' => 'btn  btn-success']) ?>
    <?= Html::a('View Full Record', ['view-full', 'ID' => $model->ID, 'token' => $model->token], ['class' => 'btn btn-primary']) ?>


</div>
