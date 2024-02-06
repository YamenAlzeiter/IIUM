<?php

use common\models\Outbound;
use common\models\Status;
use yii\bootstrap5\Html;
use yii\bootstrap5\LinkPager;
use yii\grid\GridView;
use yii\helpers\Url;


$this->title = 'Dashboard';
$year = Yii::$app->request->get('year');
$distinctYears = Outbound::find()->select(['EXTRACT(YEAR FROM created_at) as year'])->distinct()->orderBy(['year' => SORT_DESC])->asArray()->column();
?>


<div class = "d-flex flex-row justify-content-between align-items-center mb-3">
    <h1 class = "fw-semibold">Dashboard: Outbound</h1>
    <div class = "text-end dropdown">
        <a href = "/site/out-backup" class = "btn btn-excel btn-lg mx-2" data-bs-toggle = "tooltip"
           data-bs-placement = "left"
           data-bs-html = "true" title = "backup all outbound records in database to your device as excel file"><i
                class = "ti ti-database-export me-2"></i>Backup</a>

        <button class = "btn btn-light btn-lg dropdown-toggle mb-0 fw-semibold" type = "button"
                id = "dropdownMenuButton1"
                data-bs-toggle = "dropdown" aria-expanded = "false">
            <i class = "ti ti-calendar"></i> Year <?= $year ?>
        </button>
        <ul class = "dropdown-menu" aria-labelledby = "dropdownMenuButton1">

            <?php foreach ($distinctYears as $option): ?>
                <li>
                    <?= Html::a('Year '.$option, '/site/outbound-dashboard?year='.$option,
                        ['class' => 'dropdown-item']) ?>
                </li>
            <?php endforeach; ?>

        </ul>
    </div>
</div>

<?=

/**
 * Renders the reusable dashboard component.
 *
 * @param  string  $year  The year for which the dashboard is rendered.
 * @param  array  $months  The array of months for the dashboard.
 * @param  array  $counts  The counts for the dashboard.
 * @param  int  $maleCount  The count of male entries.
 * @param  int  $femaleCount  The count of female entries.
 * @param  string  $inbound  The type of inbound data.
 *
 * @return string The rendered dashboard component.
 */

$this->render('/reusable/dashboard_reused', [
    'year' => $year, 'months' => $months, 'counts' => $counts, 'maleCount' => $maleCount, 'femaleCount' => $femaleCount,
    'inbound' => "", 'dataProvider' => $dataProvider//null for outbound
]) ?>
