<?php

use yii\bootstrap5\Html;
use dosamigos\ckeditor\CKEditor;
require Yii::getAlias('@common').'/Helpers/helper.php';


$this->title = 'Dashboard';
?>




<div class="row">
    <div class="col-lg-3">
        <div class = "card rounded-2 overflow-hidden hover-img">
            <div class = "card-body">
                <h4 class="text-center fw-semibold text-dark">Total</h4>
                <p class="value text-center fw-bolder fs-8 " akhi="<?=getCount('TotalI')?>">0</p>
            </div>
        </div>
    </div>
    <div class="col-lg-3">
        <div class = "card rounded-2 overflow-hidden hover-img bg-light-green">
            <div class = "card-body">
                <h4 class="text-center fw-semibold text-success-style2">Accepted</h4>
                <p class="value text-center fw-bolder fs-8 text-success-style2" akhi="<?=getCount('AcceptedI')?>">0</p>
            </div>
        </div>
    </div>
    <div class="col-lg-3">
        <div class = "card bg-light-danger rounded-2 overflow-hidden hover-img">
            <div class = "card-body">
                <h4 class="text-center fw-semibold text-danger">Rejected</h4>
                <p class="value text-center fw-bolder fs-8 text-danger" akhi="<?=getCount('RejectedI')?>">0</p>
            </div>
        </div>
    </div>
    <div class="col-lg-3">
        <div class = "card bg-light-autom rounded-2 overflow-hidden hover-img">
            <div class = "card-body">
                <h4 class="text-center fw-semibold text-warning">In Process</h4>
                <p class="value text-center fw-bolder fs-8 text-warning" akhi="<?=getCount('ProcessI')?>">0</p>
            </div>
        </div>
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

