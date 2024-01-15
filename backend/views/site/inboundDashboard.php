<?php

use common\models\Inbound;
use yii\bootstrap5\Html;
use yii\helpers\Url;


$this->title = 'Dashboard';

$year = Yii::$app->request->get('year');
$distinctYears = Inbound::find()->select(['EXTRACT(YEAR FROM created_at) as year'])->distinct()->orderBy(['year' => SORT_DESC])->asArray()->column();
?>
<div class="d-flex flex-row justify-content-between align-items-center mb-3">
	<h1 class="fw-semibold">Dashboard: Inbound</h1>
	<div class = "text-end dropdown">
		<a href = "/site/in-backup" class = "btn btn-excel btn-lg mx-2" data-bs-toggle = "tooltip"
		   data-bs-placement = "left"
		   data-bs-html = "true" title = "backup all Inbound records in database to your device as excel file"><i
					class = "ti ti-database-export me-2"></i>Backup</a>
		<button class = "btn btn-light btn-lg dropdown-toggle mb-0 fw-semibold" type = "button" id = "dropdownMenuButton1"
		        data-bs-toggle = "dropdown" aria-expanded = "false">
			<i class = "ti ti-calendar"></i> Year <?= $year?>
		</button>
		<ul class = "dropdown-menu" aria-labelledby = "dropdownMenuButton1">

            <?php foreach ($distinctYears as $option): ?>
				<li>
                    <?= Html::a('Year '.$option,
                        '/site/inbound-dashboard?year=' . $option,
                        ['class' => 'dropdown-item']) ?>
				</li>
            <?php endforeach; ?>

		</ul>
	</div>
</div>




<div class="row">
    <div class="col-lg-3">
        <div class = "card rounded-2 overflow-hidden hover-img">
		        <div class = "card-body">
			        <h4 class="text-center fw-semibold text-dark">Total</h4>
			        <p class="value text-center fw-bolder fs-8 " akhi="<?=getCount('TotalI', $year)?>">0</p>
		        </div>
        </div>
    </div>
    <div class="col-lg-3">
	    <a href = "">
        <div class = "card rounded-2 overflow-hidden hover-img bg-light-green">

            <div class = "card-body">
                <h4 class="text-center fw-semibold text-success-style2">Accepted</h4>
                <p class="value text-center fw-bolder fs-8 text-success-style2" akhi="<?=getCount('AcceptedI', $year)?>">0</p>
            </div>
        </div>
	    </a>
    </div>
    <div class="col-lg-3">
	    <a href = "">
        <div class = "card bg-light-danger rounded-2 overflow-hidden hover-img">
            <div class = "card-body">
                <h4 class="text-center fw-semibold text-danger">Rejected</h4>
                <p class="value text-center fw-bolder fs-8 text-danger" akhi="<?=getCount('RejectedI', $year)?>">0</p>
            </div>
        </div>
	    </a>
    </div>
    <div class="col-lg-3">
	    <a href = "">
        <div class = "card bg-light-autom rounded-2 overflow-hidden hover-img">
            <div class = "card-body">
                <h4 class="text-center fw-semibold text-warning">In Process</h4>
                <p class="value text-center fw-bolder fs-8 text-warning" akhi="<?=getCount('ProcessI', $year)?>">0</p>
            </div>
        </div>
	    </a>
    </div>
</div>
<div class="row">
    <div class="col-lg-8">
        <div class="card flex-fill">
            <div class="card-body">
                <h4 class="fw-bolder text-center">number of student registered per month Line Chart</h4>
                <div id="chart-line-gradient"></div>
            </div>
        </div>
    </div>
    <div class="col-lg-4  d-flex flex-column align-items-center justify-content-center">
        <div class="card flex-fill">
            <div class="card-body">
                <h4 class="fw-bolder text-center mb-4">male/ female Donut Pie Chart</h4>
                <div id="chart-pie-donut"></div>
            </div>
        </div>
    </div>
</div>


<?php
$this->registerJs("
    var months = " . $months . ";
    var counts = " . $counts . ";

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
                show: true,'offsetX': -10, 'offsetY': 20
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
            max: Math.max(15),
             tickAmount: 13,
            forceNiceScale: true, 
        },
        tooltip: {
            theme: 'light',
        },
    };

    var chart_line_gradient = new ApexCharts(
        document.querySelector('#chart-line-gradient'),
        options_gradient
    );
    chart_line_gradient.render();
    
    
     var maleCount = " . $maleCount . ";
    var femaleCount = " . $femaleCount . ";

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
                      selection: {
    enabled: false
  }
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

