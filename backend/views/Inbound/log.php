<?php
date_default_timezone_set('UTC');
use common\models\Status;
use yii\grid\GridView;

$this->title = 'Status Change Logs';

/** @var common\models\Log $model */
require Yii::getAlias('@common').'/Helpers/helper.php';
?>

<div class="outbound-log">

    <?= GridView::widget([
        'dataProvider' => $logsDataProvider,
        'tableOptions' => ['class' => 'table border text-wrap customize-table mb-0 text-center'],
        'summary' => '', // Show the current page and total pages
        'columns' => [

            [
                'label' => 'Status',
                'format' => 'raw',
                'value' => function ($model) {
                    $statusModel = Status::findOne(['ID' => $model->new_status]);
                    $statusMeaning = $statusModel ? $statusModel->status : '';

                    $class = '';

                    if (in_array($model->new_status, [6, 16, 22, 36, 46])) {
                        $class = 'badge bg-danger-subtle text-danger fw-semibold fs-3';
                    } elseif ($model->new_status == 65) {
                        $class = 'badge bg-success-subtle text-success fw-semibold fs-3';
                    } else {
                        $class = 'badge bg-warning-subtle text-warning fw-semibold fs-3';
                    }

                    return '<div class="' . $class . '">' . $statusMeaning . '</div>';
                },
                'contentOptions' => ['class' => 'col-1'],
            ],
	        [
                'attribute' => 'old_status',
                'value' => function ($model) {
                    return getStatusFrom($model->new_status);
                },
            ],
            [
                'attribute' => 'old_status',
                'value' => function ($model) {
                    return getStatusTo($model->new_status);
                },
            ],
            [
                'attribute' => 'message',
                'contentOptions' => ['class' => 'col-4 text']
            ],
            ['attribute' => 'created_at',
                'label' => 'Date',
                'format' => ['date', 'php:d/M/y H:i'],

            ]
            // Add more columns as needed
        ],
    ]); ?>
</div>
