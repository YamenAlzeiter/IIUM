<?php

use common\models\Status;
use yii\bootstrap5\Html;
use yii\helpers\Url; ?>

    <div class = "mb-2">
        <div class = "d-flex gap-1 align-items-center">
            <?= Html::a('<i class="ti ti-chevron-left fs-8 fw-bolder" ></i>', Yii::$app->request->referrer) ?>
            <div class = "d-flex flex-column">
                <h1 class = "text-capitalize text-start m-0"><?= $model->Name ?></h1>
                <?php
                $statusModel = Status::findOne(['ID' => $model->Status]);
                $class = statusHelper($model->Status);

                // Creating the <p> element
                $p = Html::tag('p', // Nesting the <span> inside the <p> element
                    Html::tag('span', '', [
                        'class' => ''.$class[1],
                    ]).($statusModel ? $statusModel->status : ''), // Text content
                    [
                        'class' => 'fw-semibold m-0 text-capitalize status-badge d-flex align-items-center gap-1 '.$class[0],
                    ]);
                echo $p;
                ?>
            </div>
        </div>
    </div>
