<?php

use common\models\Status;
use yii\grid\GridView;

$this->title = 'Status Change Logs';

/** @var common\models\Log $model */
require Yii::getAlias('@common').'/Helpers/helper.php';
?>

<div class="outbound-log">

    <?= GridView::widget([
        'dataProvider' => $logsDataProvider,
        'tableOptions' => ['class' => 'table border text-nowrap customize-table mb-0 text-center'],
        'summary' => '', // Show the current page and total pages
        'columns' => [
            [
                'attribute' => 'created_at', 'label' => 'Date', 'format' => ['date', 'php:d/M/Y h:i'],

            ],
            [
                'label' => 'Current Status',
                'format' => 'raw',
                'value' => function ($model) {
                    $statusModel = Status::findOne(['ID' => $model->new_status]);
                    $statusMeaning = $statusModel ? $statusModel->status : '';

                    $class = '';

                    if (in_array($model->new_status, [2, 12, 22, 32, 42])) {
                        $class = 'badge bg-danger-subtle text-danger fw-semibold fs-3';
                    } elseif ($model->new_status == 61) {
                        $class = 'badge bg-success-subtle text-success fw-semibold fs-3';
                    } else {
                        $class = 'badge bg-warning-subtle text-warning fw-semibold fs-3';
                    }

                    return '<div class="' . $class . '">' . $statusMeaning . '</div>';
                },
                'contentOptions' => ['class' => 'col-1'],
            ],
            [
                'attribute' => 'From',
                'value' => function ($model) {
                    return getStatusFrom($model->new_status);
                },
            ],
            [
                'attribute' => 'To',
                'value' => function ($model) {
                    return getStatusTo($model->new_status);
                },
            ],
            'message',

            // Add more columns as needed
        ],
    ]); ?>
</div>
