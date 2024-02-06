<?php

use common\models\Inbound;
use common\models\Status;
use yii\bootstrap5\ActiveForm;
use yii\bootstrap5\LinkPager;
use yii\grid\GridView;
use yii\helpers\Html;
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
            <?= $this->render('_filters',
                ['searchModel' => $searchModel, 'year' => Yii::$app->request->get('year')]); ?>
        </div>
        <div class = "d-flex flex-row gap-2">
            <button class = "btn btn-light-danger btn-lg mb-0" id = "fake-delete-btn" style = "display: none;">
                <i class = "ti ti-trash text-danger fs-6"></i>
            </button>
            <div class = "btn-group">
                <button class = "btn btn-light btn-lg dropdown-toggle mb-0 fw-bolder" type = "button"
                        id = "dropdownMenuButton1"
                        data-bs-toggle = "dropdown" aria-expanded = "false">
                    <i class = "ti ti-calendar fw-bolder"></i> Year <?= Yii::$app->request->get('year'); ?>
                </button>
                <ul class = "dropdown-menu dropdown-menu-end dropdown-menu-width"
                    aria-labelledby = "dropdownMenuButton1">
                    <?php foreach ($distinctYears as $option): ?>
                        <li>
                            <?= Html::a(''.$option, Url::to(['index', 'year' => $option]),
                                ['class' => 'dropdown-item']) ?>
                        </li>
                    <?php endforeach; ?>
                </ul>
            </div>
            <div class = "dropdown">
                <button class = "btn btn-excel btn-lg dropdown-toggle mb-0" type = "button" id = "dropdownMenuButton1"
                        data-bs-toggle = "dropdown" aria-expanded = "false">
                    <i class = "ti ti-file-spreadsheet"></i> Download Excel
                </button>
                <ul class = "dropdown-menu dropdown-menu-width" aria-labelledby = "dropdownMenuButton1">

                    <?php foreach ($distinctYears as $option): ?>
                        <li>
                            <?= Html::a('Year '.$option, Url::to(['export-excel', 'year' => $option]),
                                ['class' => 'dropdown-item']) ?>
                        </li>
                    <?php endforeach; ?>

                </ul>
            </div>
        </div>
    </div>


    <div class = "card w-100 mt-4">
        <div class = "card-body">
            <div class="table-responsive">
            <?php ActiveForm::begin(['action' => ['delete-multiple'], 'method' => 'post']) ?>
            <?= GridView::widget([
                'dataProvider' => $dataProvider,
                'tableOptions' => ['class' => 'table text-nowrap customize-table mb-0 text-center'], 'summary' => '',
                // Show the current page and total pages
                'columns' => [
                    Yii::$app->user->can('superAdmin') ? [

                        'class' => 'yii\grid\CheckboxColumn', 'contentOptions' => ['class' => 'col-sm-1'],
                        'headerOptions' => ['id' => 'checkbox-header'] // Add an ID to the checkbox header

                    ] : ['contentOptions' => ['class' => 'col-1 opacity-0']], [
                        'attribute' => 'updated_at', 'contentOptions' => ['class' => 'col-1'],
                        // Set the width for this column

                    ], [
                        'attribute' => 'Name', 'contentOptions' => ['class' => 'col-2 text-truncate'],
                    ], [
                        'attribute' => 'Country_of_origin', 'label' => 'Country of Origin',
                        'content' => function ($model) {
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
                        'label' => 'Status', 'attribute' => 'Status', 'format' => 'raw', 'value' => function ($model) {
                            $statusModel = Status::findOne(['ID' => $model->Status]);
                            $rejectionReason = null;
                            $statusMeaning = $statusModel ? $statusModel->status : '';
                            if ($model->Status == 16) {
                                $rejectionReason = ' <i class="cursor-pointer ti ti-info-circle fs-5 " 
                                    data-bs-toggle="tooltip"
                                     data-bs-placement="bottom"
                                      data-bs-html="true" 
                                      title="'.htmlspecialchars($model->note_kulliyyah).'"></i>';
                            } elseif ($model->Status == 36) {
                                $rejectionReason = ' <i class="cursor-pointer ti ti-info-circle fs-5 " 
                                    data-bs-toggle="tooltip"
                                     data-bs-placement="bottom"
                                      data-bs-html="true" 
                                      title="'.htmlspecialchars($model->note_msd_cps).'"></i>';
                            }
                            $class = statusHelper($model->Status);

                            return '<div class="d-inline-flex align-items-center gap-1 text-center wrap '.$class[0].'"><p class="mb-0 '.$class[1].'"></p><p class="mb-0">'.$statusMeaning.'</p>'.$rejectionReason.'</div>';
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
                                        'data-placement' => "top", 'title' => 'Action',
                                        // Tooltip for the 'Action' action
                                    ]).' '.Html::a('<i class="ti ti-trash fs-7" data-toggle="tooltip" title="Log"></i>',
                                    ['delete', 'ID' => $model->ID], [
                                        'class' => 'text-danger edit mx-1 delete-record',
                                        // Add a class to identify the delete action
                                        'data' => [

                                            'action' => Url::to(['delete', 'ID' => $model->ID]),
                                            // Add the action URL to data attributes
                                        ],
                                    ]).' '.Html::a('<i class="ti ti-file-database fs-7" data-toggle="tooltip" title="Log"></i>',
                                    ['log', 'ID' => $model->ID], [
                                        'class' => 'text-warning edit mx-1', 'data-toggle' => 'tooltip',
                                        'title' => 'Log',
                                        // Tooltip for the 'Log' action
                                    ]).'</div>';
                        }, 'contentOptions' => ['class' => 'col-1'],
                    ],

                ], 'pager' => [
                    'class' => LinkPager::class,
                    'options' => ['class' => 'pagination mt-3 justify-content-right pagination-lg'],
                ], 'layout' => "{items}\n{pager}\n",
            ]); ?>
            <?= Html::submitButton('<i class="ti ti-trash text-danger fs-7"></i>', [
                'class' => 'btn btn-light-danger', 'id' => 'delete-selected-btn', // Add an ID for easier selection
                'style' => 'display: none;', // Hide the button initially
            ]) ?>
            <?php ActiveForm::end() ?>
            </div>
        </div>
    </div>
    <script>
        // jQuery script to toggle visibility of Delete Selected button based on checkbox selection
        $(document).ready(function () {
            // When any checkbox is changed
            $('input[name="selection[]"]').change(function () {
                // If any checkbox is checked, show the Delete Selected button; otherwise, hide it
                if ($('input[name="selection[]"]:checked').length > 0) {
                    $('#fake-delete-btn').show();
                } else {
                    $('#fake-delete-btn').hide();
                }
            });
        });
        $(document).ready(function () {
            // When the fake delete button is clicked
            $('#fake-delete-btn').click(function () {
                // Trigger the click event of the hidden submit button
                $('#delete-selected-btn').click();
            });
        });
    </script>