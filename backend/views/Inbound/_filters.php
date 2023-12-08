
<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var backend\views\Outbound\outboundSearch $searchModel */

?>


<?php $form = ActiveForm::begin([
    'action' => ['index'], // Change the action as needed
    'method' => 'get',
]); ?>
<div class = "d-flex flex-row gap-3 mt-2 mb-2">

    <?= $form->field($searchModel, 'Name') ?>

    <?= $form->field($searchModel, 'Gender')->dropDownList(['M' => 'Male', 'F' => 'Female'],
        ['prompt' => 'All']) ?>

    <?= $form->field($searchModel, 'Status')->dropDownList([
        'Active' => 'Active', 'Pending' => 'Pending', 'Completed' => 'Completed', 'Cancel' => 'Cancel'
    ], ['prompt' => 'All']) ?>

    <?= Html::submitButton('Enter', ['class' => 'collapsed fs-4 fw-semibold shadow-none btn btn-danger align-self-end']) ?>
</div>
<?php ActiveForm::end(); ?>
