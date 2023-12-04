<?php


use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var backend\views\outbound\outboundSearch $searchModel */

?>
<div class="">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_search', [
        'model' => $searchModel,
    ]) ?>

</div>