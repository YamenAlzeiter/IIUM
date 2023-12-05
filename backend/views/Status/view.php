<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/** @var yii\web\View $this */
/** @var common\models\Ststus $model */



\yii\web\YiiAsset::register($this);
?>
<div class="ststus-view">

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'ID',
            'description',
        ],
    ]) ?>

</div>
