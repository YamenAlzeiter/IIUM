<?php

use yii\grid\GridView;
use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var yii\data\ActiveDataProvider $dataProvider */


?>
<div class = "user-admin-index">


    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'tableOptions' => ['class' => 'table text-nowrap mb-0 align-middle table-hover'], 'summary' => '',
        'columns' => [
            'id', 'username', 'matric_number',

            [
                'label' => 'Actions',
                'contentOptions' => ['class' => 'col-2'], // Set the width for this column
                'headerOptions' => ['class' => 'text-primary'],
                'format' => 'raw',
                'value' => function ($model) {
                    $userId = $model->id;
                    $isUserOne = ($userId === 1);

                    $viewButton = Html::a('View', ['view', 'id' => $model->id], ['class' => 'btn btn-info']);

                    if ($isUserOne) {
                        return $viewButton;
                    }

                    $deleteButton = Html::a('Delete', ['delete', 'id' => $model->id], [
                        'class' => 'btn btn-danger',
                        'data' => [
                            'confirm' => 'Are you sure you want to delete this item?',
                            'method' => 'post',
                        ],
                    ]);

                    return $viewButton . ' ' . $deleteButton;
                },
            ],
        ],
    ]); ?>
	<p>
        <?= Html::a('Create New Admin', ['create'], ['class' => 'btn btn-outline-dark mt-3 px-4']) ?>
	</p>

</div>
