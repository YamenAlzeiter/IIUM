<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var backend\models\UserAdmin $model */

?>
<div class="user-admin-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
