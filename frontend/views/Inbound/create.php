<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var common\models\Inbound $model */
/** @var common\models\Courses $coursesData */

?>
<div class="inbound-create">

    <?= $this->render('_form', [
        'model' => $model,
        'coursesData' => $coursesData,
    ]) ?>

</div>
