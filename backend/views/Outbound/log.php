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
        'tableOptions' => ['class' => 'table border text-nowrap customize-table mb-0 text-center'],
        'summary' => '', // Show the current page and total pages
        'columns' => [

            ['attribute' => 'created_at',
                'label' => 'Date',
                'format' => ['date', 'php:d/M/y H:i'],

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
//            [
//                'attribute' => 'description',
//                'value' => function ($model) {
//                    $status = Status::findOne(['ID' => $model->new_status]);
//                    return $status ? $status->description : 'Status not found'; //
//                },
//            ],
            [
                'attribute' => 'message',
                'format' => 'raw',
                'value' => function ($model) {
                    $shortMessage = strlen($model->message) > 30 ? substr($model->message, 0, 30) . '...' : $model->message;
                    $fullMessage = nl2br(htmlspecialchars($model->message));

                     $messageHtml = '';

                    if (strlen($model->message) > 30) {
                        $messageHtml .= "<span class='full-message visually-hidden'>$fullMessage</span><button class='show-more-btn btn btn-link btn-sm'>Show More</button>";
                    } else {
                        $messageHtml .= "<span class='full-message'>$fullMessage</span>";
                    }


                },
                'contentOptions' => ['class' => 'col-2'],
            ],

            // Add more columns as needed
        ],
    ]); ?>
</div>
<script>
    $(document).ready(function() {
        $('.show-more-btn').on('click', function() {
            var $parentRow = $(this).closest('tr');
            var $shortMessage = $parentRow.find('.short-message');
            var $fullMessage = $parentRow.find('.full-message');

            if ($shortMessage.hasClass('visually-hidden')) {
                $shortMessage.removeClass('visually-hidden');
                $fullMessage.addClass('visually-hidden');
                $(this).text('Show More');
            } else {
                $shortMessage.addClass('visually-hidden');
                $fullMessage.removeClass('visually-hidden');
                $(this).text('Show Less');
            }
        });
    });
</script>
