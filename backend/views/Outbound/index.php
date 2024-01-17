<?php

use common\models\Status;
use yii\bootstrap5\LinkPager;
use yii\grid\GridView;
use yii\helpers\Html;
use yii\data\ActiveDataProvider;
use common\models\Outbound;
use yii\helpers\Url;

// Import your model class here

/** @var yii\web\View $this */
/** @var yii\data\ActiveDataProvider $dataProvider */
$this->title = 'Outbound';

$distinctYears = Outbound::find()->select(['EXTRACT(YEAR FROM created_at) as year'])->distinct()->orderBy(['year' => SORT_DESC])->asArray()->column();
$icon = Html::tag('i', '', ['class' => 'ti ti-file-spreadsheet']);

require Yii::getAlias('@common').'/Helpers/helper.php';
?>

<div class = "d-flex flex-column flex-md-row gap-3 mt-2 mb-2 justify-content-between align-items-end">
	<div>
        <?= $this->render('_filters', ['searchModel' => $searchModel]); ?>
	</div>

	<div class = "dropdown">
		<button class = "btn btn-excel btn-lg dropdown-toggle mb-0" type = "button" id = "dropdownMenuButton1"
		        data-bs-toggle = "dropdown" aria-expanded = "false">
			<i class = "ti ti-file-spreadsheet"></i> Download Excel
		</button>
		<ul class = "dropdown-menu" aria-labelledby = "dropdownMenuButton1">

            <?php foreach ($distinctYears as $option): ?>
				<li>
                    <?= Html::a('Year '.$option, Url::to(['export-excel', 'year' => $option]),
                        ['class' => 'dropdown-item']) ?>
				</li>
            <?php endforeach; ?>

		</ul>
	</div>
</div>


<div class = "table-responsive rounded-2 mb-4">
    <?=

    GridView::widget([
        'dataProvider' => $dataProvider,
        'tableOptions' => ['class' => 'table border text-nowrap customize-table mb-0 text-center'], 'summary' => '',
        // Show the current page and total pages
        'columns' => [
            [
                'attribute' => 'created_at', 'label' => 'Date', 'format' => ['date', 'php:Y-m-d'],
                'contentOptions' => ['class' => 'col-1'],
            ], [
                'attribute' => 'Matric_Number', 'contentOptions' => ['class' => 'col-1'],
            ], [
                'attribute' => 'Name', 'contentOptions' => ['class' => 'col-1'],
            ], [
                'attribute' => 'Citizenship', 'contentOptions' => ['class' => 'col-1 text-center'],
            ], [
                'label' => 'Status', 'attribute' => 'Status', 'format' => 'raw', 'value' => function ($model) {
                    $statusModel = Status::findOne(['ID' => $model->Status]);
                    $statusMeaning = $statusModel ? $statusModel->status : '';

                    $class = '';

                    if (in_array($model->Status, [2, 12, 22, 32, 42])) {
                        $class = 'badge bg-danger-subtle text-danger fw-semibold fs-3';
                        $classSpan = 'round-8 text-bg-danger rounded-circle d-inline-block me-1';
                    } elseif ($model->Status == 61 || $model->Status == 81) {
                        $class = 'badge bg-success-subtle text-success-style2 fw-semibold fs-3';
                        $classSpan = 'round-8 text-bg-success-style2 rounded-circle d-inline-block me-1';
                    } elseif ($model->Status == 1 || $model->Status == 21 || $model->Status == 41 || $model->Status == 71){
                        $class = 'badge bg-primary-subtle text-primary fw-semibold fs-3';
                        $classSpan = 'round-8 text-bg-primary rounded-circle d-inline-block me-1';
                    }
					else {
                        $class = 'badge bg-warning-subtle text-warning fw-semibold fs-3';
                        $classSpan = 'round-8 text-bg-warning rounded-circle d-inline-block me-1';
                    }

                    return '<div class="'.$class.'"><span class="'.$classSpan.'"></span>'.$statusMeaning.'</div>';
                }, 'contentOptions' => ['class' => 'col-1'],
            ], [
                'label' => 'Actions', 'format' => 'raw', 'value' => function ($model) {
                    return '<div class="">'.Html::a('<i class="ti ti-eye fs-7" data-toggle="tooltip" title="View"></i>',
                            ['view', 'ID' => $model->ID], [
                                'class' => 'text-dark edit update-button mx-1', 'data-toggle' => 'tooltip',
                                'title' => 'View', // Tooltip for the 'View' action
                            ]).' '.Html::a('<i class="ti ti-circle-check fs-7" data-toggle="tooltip" title="Action"></i>',
                            ['action', 'ID' => $model->ID], [
                                'class' => 'text-primary edit mx-1', 'data-toggle' => 'tooltip',
                                'data-placement' => "top", 'title' => 'Action', // Tooltip for the 'Action' action
                            ]).' '.Html::a('<i class="ti ti-trash fs-7" data-toggle="tooltip" title="Log"></i>', ['delete', 'ID' => $model->ID], [
                            'class' => 'text-danger edit mx-1', 'data' => [
                                'confirm' => 'Are you sure you want to delete this item?', 'method' => 'post',
                            ],
                        ]) .' '.Html::a('<i class="ti ti-file-database fs-7" data-toggle="tooltip" title="Log"></i>',
                            ['log', 'ID' => $model->ID], [
                                'class' => 'text-warning edit mx-1', 'data-toggle' => 'tooltip', 'title' => 'Log',
                                // Tooltip for the 'Log' action
                            ]).

                        '</div>';
                }, 'contentOptions' => ['class' => 'col-1'],
            ],
        ], 'pager' => [
            'class' => LinkPager::class, 'options' => ['class' => 'pagination justify-content-right pagination-lg'],
        ], 'layout' => "{pager}\n{items}\n",
    ]); ?>
</div>