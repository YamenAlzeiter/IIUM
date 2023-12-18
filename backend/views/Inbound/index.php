<?php

use common\models\Status;
use yii\bootstrap5\LinkPager;
use yii\grid\GridView;
use yii\helpers\Html;
use yii\data\ActiveDataProvider;
use common\models\Inbound;

// Import your model class here

/** @var yii\web\View $this */
/** @var yii\data\ActiveDataProvider $dataProvider */
$this->title = 'Inbound';
require Yii::getAlias('@common').'/Helpers/helper.php';

?>

<div class = "accordion-item mb-2">

    <?= Html::button('<i class="ti ti-filter"></i>Filter', [
        'class' => ' collapsed fs-4 fw-semibold shadow-none btn btn-outline-dark', 'type' => 'button',
        'data-bs-toggle' => 'collapse', 'data-bs-target' => '#flush-collapsefour', 'aria-expanded' => 'false',
        'aria-controls' => 'flush-collapsefour', 'id' => 'toggle-filters-btn'
    ]) ?>

	<div id = "flush-collapsefour" class = "accordion-collapse collapse"
	     aria-labelledby = "flush-headingfour"
	     data-bs-parent = "#accordionFlushExample">
		<div class = "accordion-body fw-normal">
            <?= $this->render('_filters', ['searchModel' => $searchModel]); ?>
		</div>
	</div>
</div>

<div class = "table-responsive rounded-2 mb-4">
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'tableOptions' => ['class' => 'table border text-nowrap customize-table mb-0 text-center'], 'summary' => '',
        // Show the current page and total pages
        'columns' => [
            [
                'attribute' => 'updated_at', 'contentOptions' => ['class' => 'col-1'], // Set the width for this column
                'format' => ['date', 'php:Y-m-d'], // Format the date part only
            ], [
                'attribute' => 'Name', 'contentOptions' => ['class' => 'col-2 text-truncate'],
            ], [
                'attribute' => 'Country_of_origin', 'contentOptions' => ['class' => 'col-2'],
                // Apply Bootstrap grid class
            ], [
                'attribute' => 'Academic_home_university', 'contentOptions' => ['class' => 'col-2'],
                // Apply Bootstrap grid class
            ], [
                'attribute' => 'Academic_lvl_edu', 'contentOptions' => ['class' => 'col-2'],
                // Apply Bootstrap grid class
            ], [
                'label' => 'Status', 'format' => 'raw', 'value' => function ($model) {
                    $statusModel = Status::findOne(['ID' => $model->Status]);
                    $statusMeaning = $statusModel ? $statusModel->description : '';

                    $class = '';

                    if (in_array($model->Status, [2, 12, 22, 32, 42])) {
                        $class = 'badge bg-danger-subtle text-danger fw-semibold fs-3';
                    } elseif ($model->Status == 61) {
                        $class = 'badge bg-success-subtle text-success fw-semibold fs-3';
                    } else {
                        $class = 'badge bg-warning-subtle text-warning fw-semibold fs-3';
                    }

                    return '<div class="'.$class.'">'.$statusMeaning.'</div>';
                }, 'contentOptions' => ['class' => 'col-1'],
            ], [
                'label' => 'Actions',
                'format' => 'raw',
                'value' => function ($model) {
                    return '<div class="">' .
                        Html::a('<i class="ti ti-eye fs-7" data-toggle="tooltip" title="View"></i>', ['view', 'ID' => $model->ID], [
                            'class' => 'text-info edit update-button mx-1',
                            'data-toggle' => 'tooltip',
                            'title' => 'View', // Tooltip for the 'View' action
                        ]) . ' ' .
                        Html::a('<i class="ti ti-circle-check fs-7" data-toggle="tooltip" title="Action"></i>', ['action', 'ID' => $model->ID], [
                            'class' => 'text-danger edit mx-1',
                            'data-toggle' => 'tooltip',
                            'data-placement'=>"top",
                            'title' => 'Action', // Tooltip for the 'Action' action
                        ]) . ' ' .
                        Html::a('<i class="ti ti-file-database fs-7" data-toggle="tooltip" title="Log"></i>', ['log', 'ID' => $model->ID], [
                            'class' => 'text-dark edit mx-1',
                            'data-toggle' => 'tooltip',
                            'title' => 'Log', // Tooltip for the 'Log' action
                        ]) .
                        '</div>';
                },
                'contentOptions' => ['class' => 'col-1'],
            ],

        ], 'pager' => [
            'class' => LinkPager::class,
            'options' => ['class' => 'pagination mt-3 justify-content-right pagination-lg'],
        ], 'layout' => "{pager}\n{items}\n",
    ]); ?>
</div>


<div class = "row">
	<div class = "col-lg-3">
		<div class = "card rounded-2 overflow-hidden hover-img">
			<div class = "card-body">
				<div class = "d-flex justify-content-center align-items-center header-info gap-1 mb-3">
					<i class = "ti ti-sum fw-semibold text-dark-emphasis"></i>
					<strong>
						<h4 class = "fw-semibold text-dark-emphasis mb-0">Total</h4>
					</strong>
				</div>
				<p class = "value text-center fw-bolder fs-8 " akhi = "<?= getCount('TotalI') ?>">0</p>

			</div>
		</div>
	</div>
	<div class = "col-lg-3">
		<div class = "card rounded-2 overflow-hidden hover-img bg-light-green">
			<div class = "card-body">

				<div class = "d-flex justify-content-center align-items-center header-info gap-1 mb-3">
					<i class = "ti ti-circle-check text-success-style2"></i>
					<strong>
						<h4 class = "text-center fw-semibold text-success-style2 mb-0">Accepted</h4>
					</strong>
				</div>
				<p class = "value text-center fw-bolder fs-8 text-success-style2" akhi = "<?= getCount('AcceptedI') ?>">
					0</p>
			</div>
		</div>
	</div>
	<div class = "col-lg-3">
		<div class = "card bg-light-danger rounded-2 overflow-hidden hover-img">
			<div class = "card-body">
				<div class = "d-flex justify-content-center align-items-center header-info gap-1 mb-3">
					<i class = "ti ti-ban fw-semibold text-danger"></i>
					<strong>

						<h4 class = "text-center fw-semibold text-danger mb-0">Rejected</h4>
					</strong>
				</div>

				<p class = "value text-center fw-bolder fs-8 text-danger" akhi = "<?= getCount('RejectedI') ?>">0</p>
			</div>
		</div>
	</div>
	<div class = "col-lg-3">
		<div class = "card bg-light-autom rounded-2 overflow-hidden hover-img">
			<div class = "card-body">
				<div class = "d-flex justify-content-center align-items-center header-info gap-1 mb-3">
					<i class = "ti ti-loader-quarter text-warning fw-semibold"></i>
					<strong>
						<h4 class = "text-center fw-semibold text-warning mb-0">In Process</h4>
					</strong>
				</div>

				<p class = "value text-center fw-bolder fs-8 text-warning" akhi = "<?= getCount('ProcessI') ?>">0</p>
			</div>
		</div>
	</div>
</div>

<div class = "row">
	<div class = "col-lg-8">
		<div class = "card flex-fill">
			<div class = "card-body">
				<h4 class = "fw-bolder text-center text-dark-emphasis">number of student registered per month Line Chart</h4>
				<div id = "chart-line-gradient"></div>
			</div>
		</div>
	</div>
	<div class = "col-lg-4 d-flex">
		<div class = "card flex-fill">
			<div class = "card-body">
				<h4 class = "fw-bolder text-center mb-4 text-dark-emphasis">male/ female Donut Pie Chart</h4>
				<div id = "chart-pie-donut"></div>
			</div>
		</div>
	</div>
</div>


<?php
$this->registerJs("
    var months = ".$months.";
    var counts = ".$counts.";

    var options_gradient = {
        series: [{
            name: 'Records',
            data: counts,
        }],
        chart: {
            fontFamily: '\"Nunito Sans\", sans-serif',
            height: 350,
            type: 'line',
            toolbar: {
                show: false,
            },
        },
        stroke: {
            width: 7,
            curve: 'smooth',
        },
        xaxis: {
            type: 'categories',
            categories: months,
  
        },
        grid: {
            borderColor: 'transparent',
        },
        colors: ['#ffd68a'],
        fill: {
            type: 'gradient',
            gradient: {
                shade: 'dark',
                gradientToColors: ['var(--bs-danger)'],
                shadeIntensity: 1,
                type: 'horizontal',
                opacityFrom: 1,
                opacityTo: 1,
                stops: [0, 100, 100, 100],
            },
        },
        markers: {
            size: 4,
            colors: ['var(--bs-warning)'],
            strokeColors: '#fff',
            strokeWidth: 2,
            hover: {
                size: 7,
            },
        },
        yaxis: {
            min: Math.min(0),
            max: Math.max(20),
             tickAmount: 11,
            forceNiceScale: true, 
        },
        tooltip: {
            theme: 'dark',
        },
    };

    var chart_line_gradient = new ApexCharts(
        document.querySelector('#chart-line-gradient'),
        options_gradient
    );
    chart_line_gradient.render();
    
    
     var maleCount = ".$maleCount.";
    var femaleCount = ".$femaleCount.";

    var options_donut = {
      series: [maleCount, femaleCount],
    labels: ['Male', 'Female'],
        chart: {
            fontFamily: '\"Nunito Sans\", sans-serif',
            type: 'donut',
            width: 385,
        },
        colors: ['#2a9d8f', '#e76f51'],
        responsive: [{
            breakpoint: 480,
            options: {
                chart: {
                    width: 200,
                },
                legend: {
                    show: false,
                    position: 'bottom',
                },
            },
        }],
       legend: {
        position: 'bottom',
        labels: {
            colors: ['var(--bs-dark)'],
        
        },
    },
    };

    var chart_pie_donut = new ApexCharts(
        document.querySelector('#chart-pie-donut'),
        options_donut
    );
    chart_pie_donut.render();
");

?>




