<?php

use common\models\Ststus;
use yii\bootstrap5\ActiveForm;
use yii\bootstrap5\LinkPager;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/** @var yii\web\View $this */
/** @var yii\data\ActiveDataProvider $dataProvider */
$this->title = 'Status';
?>


    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'tableOptions' => ['class' => 'table text-nowrap mb-0 align-middle table-hover'],
        'summary' => '', // Show the current page and total pages
        'columns' => [
            'ID',
            'description',
            [
                'label' => 'Actions',
                'contentOptions' => ['class' => 'action-column color-primary'],
                'headerOptions' => ['class' => 'text-dark'],
                'format' => 'raw',
                'value' => function ($model) {
                    $updateButton = Html::a('<i class="ti ti-eye fs-5"></i>', 'javascript:void(0)', [
                        'class' => 'text-info edit updateStatus-button mx-2',
                        'data-id' => $model->ID,
                        'data-toggle' => 'modal',
                        'data-target' => '#formpoc',
                    ]);


                    return $updateButton;
                },
            ],
        ],
        'pager' => [
            'class' => LinkPager::class,
            'options' => ['class' => 'pagination mt-3 justify-content-right pagination-lg'],
        ],
    ]); ?>



<!-- Modal Add notes -->
<div class = "modal fade" id = "formpoc" tabindex = "-1" role = "dialog" aria-labelledby = "formpoc"
     aria-hidden = "true">
	<div class = "modal-dialog modal-dialog-centered" role = "document">
		<div class = "modal-content border-0">
			<div class = "modal-header bg-dark">
				<h6 id = "formpoc-header" class = "text-white mb-0"></h6>

				<button type = "button" class = "btn-close btn-close-white" data-bs-dismiss = "modal"
				        aria-label = "Close"></button>
			</div>
			<div class = "modal-body">
				<div class = "form-box">
					<div class = "form-content">

                        <?php $form = ActiveForm::begin(['options' => ['id' => 'myForm']]); ?>


                        <?= $form->field($model, 'description')->textInput(['maxlength' => true, 'class' => 'form__input form-control', 'placeholder' => 'description'])->label(false) ?>

						<div class="text-center mt-2">
                            <?= Html::submitButton('Submit', ['class' => 'btn btn-outline-primary']) ?>
						</div>

                        <?php ActiveForm::end(); ?>


					</div>
				</div>
			</div>


		</div>
	</div>
</div>

<!-- Modal Add notes -->
<div class="modal fade" id="formpoc" tabindex="-1" role="dialog" aria-labelledby="formpoc" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content border-0">
			<div class="modal-header bg-dark">
				<h6 id="formpoc-header" class="text-white mb-0"></h6>

				<button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
				        aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="form-box">
					<div class="form-content">

                        <?php $form = ActiveForm::begin(['options' => ['id' => 'myForm']]); ?>

                        <?= $form->field($model, 'description')->textInput(['maxlength' => true]) ?>




					</div>
				</div>
			</div>
			<div class="modal-footer">
				<div class="form-group">
                    <?= Html::submitButton('',['class' => 'btn btn-outline-dark px-4 py-2', 'name' => 'save-button', 'id'=>'formpoc-button'])?>
				</div>
			</div>
            <?php ActiveForm::end(); ?>
		</div>
	</div>
</div>



