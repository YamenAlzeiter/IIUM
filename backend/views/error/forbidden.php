<?php

use yii\helpers\Html;
use yii\web\ForbiddenHttpException;

/* @var $this yii\web\View */
/* @var $exception ForbiddenHttpException */

$this->title = 'Access Denied';
?>

<div class="site-error">
    <h1><?= Html::encode($this->title) ?></h1>
    <div class="alert alert-danger">
        <?= nl2br(Html::encode($exception->getMessage())) ?>
    </div>
    <p>
        The above error occurred while the server was processing your request.
    </p>
    <p>
        Please contact us if you think this is a server error. Thank you.
    </p>
</div>
