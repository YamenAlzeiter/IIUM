<?php

use common\models\Outbound;
use common\models\Status;
use yii\bootstrap5\ActiveForm;
use yii\bootstrap5\LinkPager;
use yii\grid\GridView;
use yii\helpers\Html;
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

	<div class="d-flex flex-row gap-2">
		<button class="btn btn-light-danger btn-lg mb-0" id="fake-delete-btn" style="display: none;">
			<i class="ti ti-trash text-danger fs-6"></i>
		</button>
		<div>
			<div class = "btn-group">
				<button class = "btn btn-light btn-lg dropdown-toggle mb-0 " type = "button" id = "dropdownMenuButton1"
				        data-bs-toggle = "dropdown" aria-expanded = "false">
					<i class = "ti ti-calendar"></i>
				</button>
				<ul class = "dropdown-menu dropdown-menu-end dropdown-menu-width" aria-labelledby = "dropdownMenuButton1">
                    <?php foreach ($distinctYears as $option): ?>
						<li>
                            <?= Html::a(''.$option, Url::to(['index', 'year' => $option]),
                                ['class' => 'dropdown-item']) ?>
						</li>
                    <?php endforeach; ?>
				</ul>
			</div>
		</div>
		<div class = "btn-group">
			<button class = "btn btn-excel btn-lg dropdown-toggle mb-0 " type = "button" id = "dropdownMenuButton1"
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

<div class = "table-responsive rounded-2 mb-4">
    <?php ActiveForm::begin(['action' => ['delete-multiple'], 'method' => 'post']) ?>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'tableOptions' => ['class' => 'table border text-nowrap customize-table mb-0 text-center'], 'summary' => '',
        'columns' => [

				Yii::$app->user->can('superAdmin') ? [

                    'class' => 'yii\grid\CheckboxColumn', 'contentOptions' => ['class' => 'col-sm-1'],
                    'headerOptions' => ['id' => 'checkbox-header'] // Add an ID to the checkbox header

            ] :['contentOptions' => ['class' => 'col-1 opacity-0']],
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
                    } elseif ($model->Status == 1 || $model->Status == 21 || $model->Status == 41 || $model->Status == 71) {
                        $class = 'badge bg-primary-subtle text-primary fw-semibold fs-3';
                        $classSpan = 'round-8 text-bg-primary rounded-circle d-inline-block me-1';
                    } else {
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
                            ]).' '. Html::a('<i class="ti ti-trash fs-7" data-toggle="tooltip" title="Log"></i>', ['delete', 'ID' => $model->ID], [
                                'class' => 'text-danger edit mx-1 delete-record', // Add a class to identify the delete action
                                'data' => [
                                    'action' => Url::to(['delete', 'ID' => $model->ID]), // Add the action URL to data attributes
                                ],
                            ]).' '.Html::a('<i class="ti ti-file-database fs-7" data-toggle="tooltip" title="Log"></i>',
                            ['log', 'ID' => $model->ID], [
                                'class' => 'text-warning edit mx-1', 'data-toggle' => 'tooltip', 'title' => 'Log',
                                // Tooltip for the 'Log' action
                            ]).'</div>';
                }, 'contentOptions' => ['class' => 'col-1'],
            ],
        ], 'pager' => [
            'class' => LinkPager::class, 'options' => ['class' => 'pagination justify-content-end mt-2'],
            // Align pager to the right
        ], 'layout' => "{items}\n{pager}",
    ]) ?>
    <?= Html::submitButton('<i class="ti ti-trash text-danger fs-7"></i>', [
        'class' => 'btn btn-light-danger', 'id' => 'delete-selected-btn', // Add an ID for easier selection
        'style' => 'display: none;', // Hide the button initially
    ]) ?>
    <?php ActiveForm::end() ?>
</div>

