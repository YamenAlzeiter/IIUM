<?php

use common\models\Inbound;
use common\models\Ststus;
use yii\bootstrap5\LinkPager;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/** @var yii\web\View $this */
/** @var backend\views\Inbound\inboundSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

?>



	<div class="table-responsive"> <!-- Wrap your GridView in a responsive container -->
        <?= GridView::widget([
            'dataProvider' => $dataProvider,
            'tableOptions' => ['class' => 'table text-nowrap mb-0 align-middle table-hover'],
            'summary' => '', // Show the current page and total pages
            'columns' => [
//                ['class' => 'yii\grid\SerialColumn', 'headerOptions' => ['class' => 'text-primary']],
                [
                    'attribute' => 'updated_at',
                    'contentOptions' => ['class' => 'col-1'], // Set the width for this column
                    'format' => ['date', 'php:Y-m-d'], // Format the date part only
                ],
                [
                    'attribute' => 'Name',
                    'contentOptions' => ['class' => 'col-2 text-truncate'],
                ],
                [
                    'attribute' => 'Country_of_origin',
                    'contentOptions' => ['class' => 'col-2'], // Apply Bootstrap grid class
                ],
                [
                    'attribute' => 'Academic_home_university',
                    'contentOptions' => ['class' => 'col-2'], // Apply Bootstrap grid class
                ],
                [
                    'attribute' => 'Academic_lvl_edu',
                    'contentOptions' => ['class' => 'col-2'], // Apply Bootstrap grid class
                ],
                [
                    'label' => 'Status',
                    'headerOptions' => ['class' => 'col-2'],
                    'attribute' => 'Status',
                    'format' => 'raw',
                    'value' => function ($model) {
                        $statusModel = Ststus::findOne(['ID' => $model->Status]);
                        $statusMeaning = $statusModel ? $statusModel->Description : '';

                        $class = '';

                        // Determine badge class based on the Status value
                        if (in_array($model->Status, [2, 12, 22, 32, 42])) {
                            $class = 'badge bg-danger px-3 py-2 rounded-3 fw-semibold';
                        } elseif ($model->Status == 61) {
                            $class = 'badge bg-success px-3 py-2 rounded-3 fw-semibold';
                        } else {
                            $class = 'badge bg-warning px-3 py-2 rounded-3 fw-semibold';
                        }

                        return '<div class="' . $class . '">' . $statusMeaning . '</div>';
                    },
                    'contentOptions' => ['class' => 'col-2'], // Set the width for this column
                ],
                [
                    'label' => 'Actions',
                    'contentOptions' => ['class' => 'col-2'], // Set the width for this column
                    'headerOptions' => ['class' => 'text-primary'],
                    'format' => 'raw',
                    'value' => function ($model) {
                        return Html::a('View', ['view', 'ID' => $model->ID], ['class' => 'btn btn-info']) . ' ' . Html::a('Action', ['action', 'ID' => $model->ID], ['class' => 'btn btn-dark']);
                    },
                ],
            ],
            'pager' => [
                'class' => LinkPager::class,
                'options' => ['class' => 'pagination mt-3 justify-content-right pagination-lg'],
            ],
            'layout' => "{pager}\n{items}\n",
        ]);
        ?>



	</div>

	<div class="form-group">
		<p class='text-right'>
            <?= Html::a('Search', ['search'], ['class' => 'btn btn-outline-warning mt-3 px-4']) ?>
		</p>
	</div>






