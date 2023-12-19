<?php

use common\models\Courses;
use common\models\Iiumcourse;
use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var common\models\Outbound $model */
/** @var Courses $coursesModel */
/** @var Iiumcourse $iiumcoursesModel */


?>
<div class="ob010-create">

    <?= $this->render('_form', [
        'model' => $model,
        'coursesData' => $coursesData,
        'iiumcourseData' => $iiumcourseData,
    ]) ?>

</div>