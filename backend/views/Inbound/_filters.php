<?php

use common\models\Status;
use yii\data\ActiveDataProvider;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var backend\views\Outbound\outboundSearch $searchModel */
$statusModelID10 = Status::find()->where(['ID' => 10, 'type' => ['I', 'I/O']])->one();

// Fetch all records except ID 10, ordered by ID
$statusModelsExceptID10 = Status::find()->where(['not', ['ID' => 10]])->andWhere([
        'type' => ['I', 'I/O']
    ])->orderBy(['ID' => SORT_ASC])->all();

// Merge the results
$statusModels = [$statusModelID10];
$statusModel = array_merge($statusModels, $statusModelsExceptID10);

?>


<?php $form = ActiveForm::begin([
    'action' => ['index'], // Change the action as needed
    'method' => 'get']); ?>
<div class = "d-flex flex-row gap-3 align-items-center">

    <?= $form->field($searchModel, 'Name') ?>

    <?= $form->field($searchModel, 'Gender')->dropDownList(['M' => 'Male', 'F' => 'Female'], ['prompt' => 'All']) ?>

    <?= $form->field($searchModel, 'Status')->dropDownList(ArrayHelper::map($statusModel, 'ID', 'status'), ['prompt' => 'All', 'class' => 'form-select']) ?>

    <?= Html::submitButton('Search', ['class' => 'collapsed fs-3 fw-semibold shadow-none btn btn-dark align-self-end']) ?>
</div>

<?php ActiveForm::end(); ?>
