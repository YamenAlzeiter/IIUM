<?php

use common\models\Ststus;
use yii\bootstrap5\ActiveForm;
use yii\bootstrap5\LinkPager;
use yii\grid\GridView;
use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var yii\data\ActiveDataProvider $dataProvider */
$this->title = 'Status';
?>

        <div class="table-responsive">
        <?= GridView::widget([
            'dataProvider' => $dataProvider,
            'tableOptions' => ['class' => 'table text-nowrap mb-0 align-middle table-hover'], 'summary' => '',
            // Show the current page and total pages
            'columns' => [
                'ID', 'status', 'description', [
                    'label' => 'Actions', 'contentOptions' => ['class' => 'action-column color-primary'],
                    'headerOptions' => ['class' => 'text-dark'], 'format' => 'raw', 'value' => function ($model) {
                        $updateButton = Html::a('<i class="ti ti-pencil-minus fs-7"></i>', 'javascript:void(0)', [
                            'class' => 'text-info edit updateStatus-button', 'data-id' => $model->ID,
                            'data-toggle' => 'modal', 'data-target' => '#formpoc', 'title' => 'View and Update',
                            // Tooltip for the 'View' action
                        ]);


                        return $updateButton;
                    },
                ],
            ], 'pager' => [
                'class' => LinkPager::class,
                'options' => ['class' => 'pagination mt-3 justify-content-right pagination-lg'],
            ],
        ]); ?>
        </div>


<!-- Modal Add notes -->
<div class = "modal fade" id = "formpoc" tabindex = "-1" role = "dialog" aria-labelledby = "formpoc"
     aria-hidden = "true">
    <div class = "modal-dialog modal-dialog-centered" role = "document">
        <div class = "modal-content border-0">
            <div class = "modal-header">
                <h6 id = "formpoc-header" class = "text-dark mb-0"></h6>
                <button type = "button" class = "btn-close btn-close-dark" data-bs-dismiss = "modal"
                        aria-label = "Close"></button>
            </div>
            <div class = "modal-body">
                <div class = "form-box">
                    <div class = "form-content">
                        <?php $form = ActiveForm::begin(['options' => ['id' => 'myForm']]); ?>
                        <?= $form->field($model, 'status')->textInput([
                            'maxlength' => true, 'class' => 'form__input form-control', 'placeholder' => 'Status'
                        ])->label(false) ?>
                        <div class = "modal-footer">
                            <div class = "form-group">
                                <?= Html::submitButton('', [
                                    'class' => 'btn btn-outline-dark px-4 py-2', 'name' => 'save-button',
                                    'id' => 'submit-button'
                                ]) ?>
                            </div>
                        </div>
                        <?php ActiveForm::end(); ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

