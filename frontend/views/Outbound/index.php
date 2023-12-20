<?php

use common\models\Ob010;
use common\models\Status;
use common\models\Ststus;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/** @var yii\web\View $this */
/** @var yii\data\ActiveDataProvider $dataProvider */


?>
<div class = "ob010-index">


    <?php if ($dataProvider->totalCount === 0): ?>
		<div class = "alert alert-warning d-flex justify-content-center align-items-center gap-1">
			<p class = "text-capitalize alert m-0 p-0">No records found yet</p>
			<p class = "text-capitalize alert m-0 p-0">
				<strong><?php echo Html::a('Create One', ['create'], ['class' => ' m-0 p-0 alert']); ?></strong>
			</p>

		</div>


    <?php else: ?>
        <?= GridView::widget([
            'dataProvider' => $dataProvider,
            'tableOptions' => ['class' => 'table text-nowrap mb-0 align-middle table-hover'], 'summary' => '',
            // Show the current page and total pages
            'columns' => [
                ['class' => 'yii\grid\SerialColumn'],


                'Name', 'Matric_Number', [
                    'label' => 'Status', 'headerOptions' => ['class' => 'col-2'], 'attribute' => 'Status',
                    'format' => 'raw', 'value' => function ($model) {
                        $statusModel = Status::findOne(['ID' => $model->Status]);
                        $statusMeaning = $statusModel ? $statusModel->description : '';

                        $class = '';

                        // Determine badge class based on the Status value
                        if (in_array($model->Status, [2, 12, 22, 32, 42])) {
                            $class = 'badge bg-danger px-3 py-2 rounded-3 fw-semibold';
                        } elseif ($model->Status == 61) {
                            $class = 'badge bg-success px-3 py-2 rounded-3 fw-semibold';
                        } else {
                            $class = 'badge bg-warning px-3 py-2 rounded-3 fw-semibold';
                        }

                        return '<div class="'.$class.'">'.$statusMeaning.'</div>';
                    }, 'contentOptions' => ['class' => 'col-2'], // Set the width for this column
                ], [
                    'label' => 'Actions', 'contentOptions' => ['class' => 'col-2'], // Set the width for this column
                    'headerOptions' => ['class' => 'text-primary'], 'format' => 'raw', 'value' => function ($model) {
                        $actions = Html::a('View', ['view', 'ID' => $model->ID], ['class' => 'btn btn-dark me-2']);

                        if ($model->Status === null || $model->Status === 3) {
                            $actions .= Html::a('Update', ['update', 'ID' => $model->ID],
                                ['class' => 'btn btn-secondary']);
                        }
                        if ($model->Status === 41) {
                            // Add the "Upload" button when the status is 51
                            $actions .= Html::a('Upload', ['upload', 'ID' => $model->ID],
                                ['class' => 'btn btn-success']);
                        }

                        return $actions;
                    },
                ],
            ],
        ]); ?>
    <?php endif; ?>

</div>
