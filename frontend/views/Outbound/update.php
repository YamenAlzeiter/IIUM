<?php

use common\models\Courses;
use common\models\Iiumcourse;
use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var common\models\Outbound $model */
/** @var Courses $coursesData */
/** @var Iiumcourse $iiumcourseData */


?>
<div class="outbound-update">



    <?= $this->render('_form', [
        'model' => $model,
        'coursesData' => $coursesData,
        'iiumcourseData' => $iiumcourseData,
    ]) ?>

</div>
