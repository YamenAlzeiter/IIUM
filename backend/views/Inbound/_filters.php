
<?php

use common\models\Status;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var backend\views\Outbound\outboundSearch $searchModel */
$statusModel =  Status::find()->all();
?>


<?php $form = ActiveForm::begin([
    'action' => ['index'], // Change the action as needed
    'method' => 'get',
]); ?>
<div class = "d-flex flex-row gap-3 mt-2 mb-2">

    <?= $form->field($searchModel, 'Name') ?>

    <?= $form->field($searchModel, 'Gender')->dropDownList(['M' => 'Male', 'F' => 'Female'],
        ['prompt' => 'All']) ?>


    <?= $form->field($searchModel, 'Status')->dropDownList(
        \yii\helpers\ArrayHelper::map($statusModel, 'ID', 'description'),
        ['prompt' => 'Select Status', 'class' => 'form-select mb-2']
    ) ?>


    <?= Html::submitButton('Enter', ['class' => 'collapsed fs-4 fw-semibold shadow-none btn btn-danger align-self-end']) ?>
</div>
<?php ActiveForm::end(); ?>
