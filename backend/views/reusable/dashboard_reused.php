<?php

use common\models\Status;
use yii\bootstrap5\LinkPager;
use yii\grid\GridView;
use yii\helpers\Html;
/** @var yii\data\ActiveDataProvider $dataProvider */
?>

<div class = "row">
    <div class = "col-lg-3">
        <div class = "card rounded-2 overflow-hidden hover-img">
            <div class = "card-body">
                <h4 class = "text-center fw-semibold text-dark">Total</h4>
                <p class = "value text-center fw-bolder fs-8" akhi = "<?= getCount('Total'.$inbound, $year) ?>">0</p>

            </div>
        </div>
    </div>
    <div class = "col-lg-3">
        <a href = "">
            <div class = "card rounded-2 overflow-hidden hover-img bg-light-green">

                <div class = "card-body">
                    <h4 class = "text-center fw-semibold text-success-style2">Accepted</h4>
                    <p class = "value text-center fw-bolder fs-8 text-success-style2"
                       akhi = "<?= getCount('Accepted'.$inbound, $year) ?>">0</p>
                </div>
            </div>
        </a>
    </div>
    <div class = "col-lg-3">
        <a href = "">
            <div class = "card bg-light-danger rounded-2 overflow-hidden hover-img">
                <div class = "card-body">
                    <h4 class = "text-center fw-semibold text-danger">Rejected</h4>
                    <p class = "value text-center fw-bolder fs-8 text-danger"
                       akhi = "<?= getCount('Rejected'.$inbound, $year) ?>">0</p>
                </div>
            </div>
        </a>
    </div>
    <div class = "col-lg-3">
        <a href = "">
            <div class = "card bg-light-autom rounded-2 overflow-hidden hover-img">
                <div class = "card-body">
                    <h4 class = "text-center fw-semibold text-warning">In Process</h4>
                    <p class = "value text-center fw-bolder fs-8 text-warning"
                       akhi = "<?= getCount('Process'.$inbound, $year) ?>">0</p>
                </div>
            </div>
        </a>
    </div>
</div>
<div class = "row">
    <div class = "col-lg-4  d-flex flex-column">
        <div class = "card flex-fill">
            <div class = "card-body">
                <h5 class = "card-title fw-semibold">Male/ Female</h5>
                <div id = "chart-pie-donut"></div>
            </div>
        </div>
    </div>
    <div class = "col-lg-8 d-flex align-items-strech">
        <div class = "card w-100">
            <div class = "card-body">
                <div class = "d-sm-flex d-block align-items-center justify-content-between mb-7">
                    <div class = "mb-3 mb-sm-0">
                        <h5 class = "card-title fw-semibold">Latest Update</h5>
                    </div>

                </div>
                <div class = "table-responsive">
                    <?= GridView::widget([
                        'dataProvider' => $dataProvider,
                        'tableOptions' => ['class' => 'table text-nowrap customize-table mb-0 text-center'],
                        'summary' => '', 'columns' => [

                            [
                                'attribute' => 'Citizenship', 'contentOptions' => ['class' => 'col-1'],
                            ], [
                                'attribute' => 'Name', 'contentOptions' => ['class' => 'col-1'],
                            ], [
                                'label' => 'Status', 'attribute' => 'Status', 'format' => 'raw',
                                'value' => function ($model) {
                                    $statusModel = Status::findOne(['ID' => $model->Status]);
                                    $statusMeaning = $statusModel ? $statusModel->status : '';
                                    $rejectionReason = null;
                                    $class = statusHelper($model->Status);


                                    if ($model->Status == 12) {
                                        $rejectionReason = ' <i class="cursor-pointer ti ti-info-circle fs-5 " 
                                    data-bs-toggle="tooltip"
                                     data-bs-placement="bottom"
                                      data-bs-html="true" 
                                      title="'.htmlspecialchars($model->Note_hod).'"></i>';
                                    } elseif ($model->Status == 32) {
                                        $rejectionReason = ' <i class="cursor-pointer ti ti-info-circle fs-5 " 
                                    data-bs-toggle="tooltip"
                                     data-bs-placement="bottom"
                                      data-bs-html="true" 
                                      title="'.htmlspecialchars($model->Note_dean).'"></i>';
                                    }

                                    return '<div class="d-inline-flex align-items-center gap-1 text-center wrap '.$class[0].'"><p class="mb-0 '.$class[1].'"></p><p class="mb-0">'.$statusMeaning.'</p>'.$rejectionReason.'</div>';
                                }, 'contentOptions' => ['class' => 'col-1'],
                            ], [
                                'label' => 'Actions', 'format' => 'raw', 'value' => function ($model) use ($isInbound) {
                                    return '<div class="">' . Html::a(
                                            '<i class="ti ti-eye fs-7" data-toggle="tooltip" title="View"></i>',
                                            [$isInbound . '/view', 'ID' => $model->ID],[
                                                'class' => 'text-dark edit update-button mx-1',
                                                'data-toggle' => 'tooltip', 'title' => 'View',
                                                // Tooltip for the 'View' action
                                            ]).' '.Html::a('<i class="ti ti-circle-check fs-7" data-toggle="tooltip" title="Action"></i>',
                                            [$isInbound .'/action', 'ID' => $model->ID], [
                                                'class' => 'text-primary edit mx-1', 'data-toggle' => 'tooltip',
                                                'data-placement' => "top", 'title' => 'Action',
                                                // Tooltip for the 'Action' action
                                            ]).'</div>';
                                }, 'contentOptions' => ['class' => 'col-1'],
                            ],
                        ], 'pager' => [
                            'class' => LinkPager::class,
                            'options' => ['class' => 'pagination justify-content-end mt-2'],
                            // Align pager to the right
                        ], 'layout' => "{items}\n{pager}",
                    ]) ?>
                </div>
            </div>
        </div>
    </div>
</div>

<div class = "row">
    <div class = "col-lg-7">
        <div class = "row">
            <div class = "col-lg-12 col-md-6">
                <div class = "card w-100">
                    <div class = "card-body">
                        <h5 class = "card-title fw-semibold">Student Registered</h5>
                        <div id = "chart-line-gradient"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class = "col-lg-5">
        <div class = "row">
            <div class = "col-lg-12 col-md-6">
                <div class = "card">
                    <div class = "card-body">
                        <h5 class = "card-title fw-semibold">Approval/Rejection</h5>
                        <div id = "chart-stacked-bar"></div>
                    </div>
                </div>
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
        min: 0,
        max: Math.max(...counts) + 10, // Calculate the maximum value correctly
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

    
    
   var maleCount = $maleCount;
var femaleCount = $femaleCount;

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
    }, {
        breakpoint: 768,
        options: {
            chart: {
                width: 300,
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
    
    
var approvalData = ".json_encode($approvalCount).";
var rejectionData = ".json_encode($rejectionCount).";

var maxApproval = Math.max(...approvalData);
var maxRejection = Math.max(...rejectionData);
var maxTotal = Math.max(maxApproval, maxRejection);

var options_gradient = {
    series: [{
        name: 'Approved',
        data: approvalData,
    }, {
        name: 'Rejected',
        data: rejectionData,
    }],
    chart: {
        fontFamily: '\"Nunito Sans\", sans-serif',
        height: 350,
        type: 'bar',
        stacked: true,
        toolbar: {
            show: true,
            offsetX: -10,
            offsetY: 20
        },
    },
    plotOptions: {
        bar: {
            horizontal: false,
            columnWidth: '75%',
            borderRadius: [6],
            borderRadiusApplication: 'end',
            borderRadiusWhenStacked: 'all',
        },
    },
    colors: ['#40916c', '#fa896b'],
    markers: {
        size: 4,
        colors: ['var(--bs-warning)'],
        strokeColors: '#fff',
        strokeWidth: 2,
        hover: {
            size: 7,
        },
    },
    grid: {
        borderColor: 'transparent',
    },
    xaxis: {
        type: 'category',
        categories: months,
    },
    yaxis: {
        min: 0,
        max: maxTotal + 5,
        tickAmount: 13,
        forceNiceScale: true,
    },
    tooltip: {
        theme: 'light',
    },
};

var chart_stacked_bar = new ApexCharts(
    document.querySelector('#chart-stacked-bar'),
    options_gradient
);
chart_stacked_bar.render(); 
");
?>
