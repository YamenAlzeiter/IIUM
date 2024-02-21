<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var common\models\Outbound $model */

?>
<div class="outbound-create">

    <?= $this->render('_form', [
        'model' => $model,
        'coursesData' => $coursesData,
        'iiumCoursesData' => $iiumCoursesData
    ]) ?>

</div>
