<?php
date_default_timezone_set('UTC');

use common\models\Status;
use yii\grid\GridView;
use yii\web\JqueryAsset;

$this->title = 'Status Change Logs';

/** @var common\models\Log $model */
require Yii::getAlias('@common').'/Helpers/helper.php';
?>

	<div class = "outbound-log">

        <?= GridView::widget([
            'dataProvider' => $logsDataProvider,
            'tableOptions' => ['class' => 'table border text-nowrap customize-table mb-0 text-center'], 'summary' => '',
            // Show the current page and total pages
            'columns' => [

                [
                    'attribute' => 'created_at', 'label' => 'Date', 'format' => ['date', 'php:d/M/y H:i'],

                ], [
                    'label' => 'Current Status', 'format' => 'raw', 'value' => function ($model) {
                        $statusModel = Status::findOne(['ID' => $model->new_status]);
                        $statusMeaning = $statusModel ? $statusModel->status : '';

                        $class = '';
                        $status = Status::findOne(['ID' => $model->new_status]);

                        if (in_array($model->new_status, [2, 12, 22, 32, 42])) {
                            $class = 'badge bg-danger-subtle text-danger fw-semibold fs-3';
							$text_color = 'text-danger';
                        } elseif(in_array($model->new_status, [61, 81])) {
                            $class = 'badge bg-success-subtle text-success-style2 fw-semibold fs-3';
                            $text_color = 'text-success-style2';
                        }elseif(in_array($model->new_status, [1,21,41,71])) {
                            $class = 'badge bg-primary-subtle text-primary fw-semibold fs-3';
                            $text_color = 'text-primary';
                        } else {
                            $class = 'badge bg-warning-subtle text-warning fw-semibold fs-3';
                            $text_color = 'text-warning';
                        }

                        return '<div class="d-flex align-items-center gap-2"><div class="'.$class.'">'.$statusMeaning.'</div><i class="cursor-pointer ti ti-info-circle fs-5 '.$text_color.' " data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-html="true" title="'.htmlspecialchars($status->description).'"></i></div>';
                    }, 'contentOptions' => ['class' => 'col-1'],
                ], [
                    'attribute' => 'From', 'value' => function ($model) {
                        return getStatusFrom($model->new_status);
                    },
                ], [
                    'attribute' => 'To', 'value' => function ($model) {
                        return getStatusTo($model->new_status);
                    },
                ],

                [
                    'attribute' => 'message',
                    'format' => 'raw',
                    'value' => function ($model) {
                        if ($model->message == "") {
                            // If $model->message is empty, return a disabled icon or any alternative content
                            return '<i class="ti ti-message-circle fs-7 disabled-icon text-gray"></i>';
                        } else {
                            // If $model->message is not empty, return the regular icon with tooltip
                            return '<i class="cursor-pointer ti ti-message-circle fs-7 fw-semibold text-dark" data-bs-toggle="tooltip" data-bs-placement="left" data-bs-html="true" title="'.htmlspecialchars($model->message).'"></i>';
                        }
                    },
                ],

            ],
        ]); ?>
	</div>