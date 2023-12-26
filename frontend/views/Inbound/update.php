<?php

use common\models\Courses;
use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var common\models\Inbound $model */
/** @var Courses $coursesData */

?>
<div class="inbound-update">


    <?= $this->render('_form', [
        'model' => $model,
        'coursesData' => $coursesData,
    ]) ?>

</div>
