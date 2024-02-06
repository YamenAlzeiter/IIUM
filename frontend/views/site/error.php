<?php

/** @var yii\web\View $this */
/** @var string $name */
/** @var string $message */
/** @var Exception $exception*/

use yii\helpers\Html;

$this->title = $name;
?>
<div class="position-relative overflow-hidden min-vh-100 w-100 d-flex align-items-center justify-content-center">
    <div class = "d-flex align-items-center justify-content-center w-100">
        <div class = "row justify-content-center w-100">
            <p class="fs-5 font-monospace fw-bolder text-center"><?= nl2br(Html::encode($name)) ?></p>
            <p class="fs-8 text-center"><?= nl2br(Html::decode($message)) ?></p>
        </div>
    </div>
</div>