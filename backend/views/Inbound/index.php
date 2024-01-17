<?php

use common\models\Status;
use yii\bootstrap5\LinkPager;
use yii\grid\GridView;
use yii\helpers\Html;
use yii\data\ActiveDataProvider;
use common\models\Inbound;
use yii\helpers\Url;

// Import your model class here

/** @var yii\web\View $this */
/** @var yii\data\ActiveDataProvider $dataProvider */
$this->title = 'Inbound';

$distinctYears = Inbound::find()->select(['EXTRACT(YEAR FROM created_at) as year'])->distinct()->orderBy(['year' => SORT_DESC])->asArray()->column();
$icon = Html::tag('i', '', ['class' => 'ti ti-file-spreadsheet']);

require Yii::getAlias('@common').'/Helpers/helper.php';
?>


<div class = "accordion-item mb-2">

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
        <?= GridView::widget([
            'dataProvider' => $dataProvider,
            'tableOptions' => ['class' => 'table border text-nowrap customize-table mb-0 text-center'], 'summary' => '',
            // Show the current page and total pages
            'columns' => [
                [
                    'attribute' => 'updated_at', 'contentOptions' => ['class' => 'col-1'],
                    // Set the width for this column

                ], [
                    'attribute' => 'Name', 'contentOptions' => ['class' => 'col-2 text-truncate'],
                ], [
                    'attribute' => 'Country_of_origin', 'label' => 'Country of Origin', 'content' => function ($model) {
                        $countryName = getcountry($model->Country_of_origin); // Assuming getcountry() fetches the country name
                        return $countryName;
                    }, 'contentOptions' => ['class' => 'col-2'],
                ], [
                    'attribute' => 'Academic_home_university', 'contentOptions' => ['class' => 'col-2'],
                    // Apply Bootstrap grid class
                ], [
                    'attribute' => 'Academic_lvl_edu', 'contentOptions' => ['class' => 'col-2'],
                    // Apply Bootstrap grid class
                ], [
                    'label' => 'Status',  'attribute' => 'Status', 'format' => 'raw', 'value' => function ($model) {
                        $statusModel = Status::findOne(['ID' => $model->Status]);
                        $statusMeaning = $statusModel ? $statusModel->status : '';

                        $class = '';

                        if (in_array($model->Status, [6, 16, 26, 36, 46])) {
                            $class = 'badge bg-danger-subtle text-danger fw-semibold fs-3';
                        } elseif ($model->Status == 65) {
                            $class = 'badge bg-success-subtle text-success-style2 fw-semibold fs-3';
                        } elseif ($model->Status == 5 || $model->Status == 25 || $model->Status == 45){
                            $class = 'badge bg-primary-subtle text-primary fw-semibold fs-3';
                        } else {
                            $class = 'badge bg-warning-subtle text-warning fw-semibold fs-3';
                        }

                        return '<div class="'.$class.'">'.$statusMeaning.'</div>';
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
                                ]).' '.Html::a('<i class="ti ti-trash fs-7" data-toggle="tooltip" title="Log"></i>',
                                ['delete', 'id' => $model->ID], [
                                    'class' => 'text-danger edit mx-1', 'data-toggle' => 'tooltip', 'title' => 'Log',
                                ]).' '.Html::a('<i class="ti ti-file-database fs-7" data-toggle="tooltip" title="Log"></i>',
                                ['log', 'ID' => $model->ID], [
                                    'class' => 'text-warning edit mx-1', 'data-toggle' => 'tooltip', 'title' => 'Log',
                                    // Tooltip for the 'Log' action
                                ]).'</div>';
                    }, 'contentOptions' => ['class' => 'col-1'],
                ],

            ], 'pager' => [
                'class' => LinkPager::class,
                'options' => ['class' => 'pagination mt-3 justify-content-right pagination-lg'],
            ], 'layout' => "{items}\n{pager}\n",
        ]); ?>
	</div>

