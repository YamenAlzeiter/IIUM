<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var common\models\Inbound $model */

$this->title = 'Create Inbound';
$this->params['breadcrumbs'][] = ['label' => 'Inbounds', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="inbound-create">

    <?= $this->render('_form', [
        'model' => $model,

    ]) ?>

</div>
