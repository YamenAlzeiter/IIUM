<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var common\models\Inbound $model */

$this->title = 'Update Inbound: ' . $model->Name;

?>


    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>


