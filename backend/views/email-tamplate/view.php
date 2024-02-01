<?php

use yii\helpers\Html;
use yii\helpers\Json;
use yii\helpers\Url;

/** @var yii\web\View $this */
/** @var common\models\EmailTemplate $model */
?>

<div class = "d-flex align-items-center header-info gap-1 mb-3">
    <i class = "ti ti-mail-opened text-dark"></i>
    <strong>
        <h4 class = "fw-semibold m-0">Email preview</h4>
    </strong>
</div>
<div class = "card shadow-none border bg-light-gray mb-0">
    <div class = "card-body">
        <h3><strong>Subject: </strong><?= $model->subject ?></h3>
    </div>
</div>
<div class = "card shadow-none border">
    <div class = "card-body">

        <?= $model->body ?>
    </div>
</div>

<?= Html::button('Update', [
    'class' => 'btn btn-dark', 'onclick' => 'location.href='.Json::encode(Url::to(['update', 'id' => $model->id])),
]) ?>
