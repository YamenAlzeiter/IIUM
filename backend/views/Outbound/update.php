<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var common\models\Outbound $model */

$this->title = 'Update Outbound: ' . $model->Name;
$this->params['breadcrumbs'][] = ['label' => 'Outbounds', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->Name, 'url' => ['view', 'ID' => $model->ID]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="outbound-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
