<?php

use common\models\Status;
use yii\bootstrap5\LinkPager;
use yii\grid\GridView;
use yii\helpers\Html;
use yii\data\ActiveDataProvider;
use common\models\Outbound; // Import your model class here

/** @var yii\web\View $this */
/** @var yii\data\ActiveDataProvider $dataProvider */

require Yii::getAlias('@common') . '/Helpers/helper.php';

?>

			<div class = "accordion-item mb-2">

                <?= Html::button('<i class="ti ti-filter"></i>Filter', [
                    'class' => ' collapsed fs-4 fw-semibold shadow-none btn btn-outline-dark',
                    'type' => 'button',
                    'data-bs-toggle' => 'collapse',
                    'data-bs-target' => '#flush-collapsefour',
                    'aria-expanded' => 'false',
                    'aria-controls' => 'flush-collapsefour',
                    'id' => 'toggle-filters-btn'
                ]) ?>

				<div id = "flush-collapsefour" class = "accordion-collapse collapse"
				     aria-labelledby = "flush-headingfour"
				     data-bs-parent = "#accordionFlushExample">
					<div class = "accordion-body fw-normal">
                        <?= $this->render('_filters', ['searchModel' => $searchModel]); ?>
					</div>
				</div>
			</div>

	<div class="table-responsive rounded-2 mb-4">
        <?= GridView::widget([
            'dataProvider' => $dataProvider,
            'tableOptions' => ['class' => 'table border text-nowrap customize-table mb-0 text-center'],
            'summary' => '', // Show the current page and total pages
            'columns' => [
                [
                    'attribute' => 'created_at',
                    'label' => 'Date',
                    'format' => ['date', 'php:Y-m-d'],
                    'contentOptions' => ['class' => 'col-1'],
                ],
                [
                    'attribute' => 'Matric_Number',
                    'contentOptions' => ['class' => 'col-1'],
                ],
                [
                    'attribute' => 'Name',
                    'contentOptions' => ['class' => 'col-1'],
                ],
                [
                    'attribute' => 'Citizenship',
                    'contentOptions' => ['class' => 'col-1 text-center'],
                ],
                [
                    'label' => 'Status',
                    'format' => 'raw',
                    'value' => function ($model) {
                        $statusModel = Status::findOne(['id' => $model->Status]);
                        $statusMeaning = $statusModel ? $statusModel->description : '';

                        $class = '';

                        if (in_array($model->Status, [2, 12, 22, 32, 42])) {
                            $class = 'badge bg-success-subtle text-success fw-semibold fs-3';
                        } elseif ($model->Status == 61) {
                            $class = 'badge bg-danger-subtle text-danger fw-semibold fs-3';
                        } else {
                            $class = 'badge bg-warning-subtle text-warning fw-semibold fs-3';
                        }

                        return '<div class="' . $class . '">' . $statusMeaning . '</div>';
                    },
                    'contentOptions' => ['class' => 'col-1'],
                ],
                [
                    'label' => 'Actions',
                    'format' => 'raw',
                    'value' => function ($model) {
                        return '<div class="">' . Html::a('View', ['view', 'ID' => $model->ID], ['class' => 'btn btn-info']) . ' ' . Html::a('Action', ['action', 'ID' => $model->ID], ['class' => 'btn btn-dark']) . '</div>';
                    },
                    'contentOptions' => ['class' => 'col-1'],
                ],
            ],
            'pager' => [
                'class' => LinkPager::class,
                'options' => ['class' => 'pagination mt-3 justify-content-right pagination-lg'],
            ],
            'layout' => "{pager}\n{items}\n",
        ]); ?>
	</div>



