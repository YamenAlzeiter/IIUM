<?php

use common\models\Kcdio;
use common\models\Poc;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var yii\data\ActiveDataProvider $dataProvider */
/** @var common\models\Poc $model */
/** @var int|null $updateModelId */
$this->title = 'Person In Charge';
?>
<div class = "d-flex flex-row gap-3 mt-2 mb-2 ">
    <?= $this->render('_search', ['searchModel' => $searchModel,  'modelKedio' => $modelKedio,]); ?>
</div>
<div class="table-responsive">
    <?= GridView::widget([
        'tableOptions' => ['class' => 'table search-table align-middle text-nowrap'], 'summary' => '', // Remove the summary text

        'dataProvider' => $dataProvider,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn', 'headerOptions' => ['class' => 'text-dark']],

            'KCDIO',
            'name',
            'email:email',
            [
                'label' => 'Actions',
                'contentOptions' => ['class' => 'action-column color-primary'],
                'headerOptions' => ['class' => 'text-dark'],
                'format' => 'raw',
                'value' => function ($model) {
                    $updateButton = Html::a('<i class="ti ti-pencil-minus fs-7"></i>', 'javascript:void(0)', [
                        'class' => 'text-dark-emphasis edit update-button mx-1',
                        'data-id' => $model->id,
                        'data-toggle' => 'modal',
                        'title' => 'View', // Tooltip for the 'View' action
                        'data-target' => '#formpoc',
                    ]);
                    $deleteButton = Html::a('<i class="ti ti-trash fs-7"></i>', ['delete', 'id' => $model->id], [
                        'class' => 'text-danger edit mx-1',
                        'data-toggle' => 'tooltip',
                        'title' => 'Delete', // Tooltip for the 'View' action
                        'data' => [
                            'confirm' => 'Are you sure you want to delete this item?',
                            'method' => 'post',
                        ],
                    ]);

                    return $updateButton . ' ' . $deleteButton;
                },
            ],
        ],
    ]); ?>
</div>

<div class="mt-3 px-4 d-flex flex-row gap-2">
	<a href="javascript:void(0)" class="btn btn-outline-dark d-flex align-items-center px-3" id="add-pos">
		<i class="ti ti-file me-0 me-md-1 fs-4"></i>
		<span class="d-none d-md-block font-weight-medium fs-3">Create New Record</span>
	</a>
</div>
<!-- Modal Add notes -->
<div class="modal fade" id="formpoc" tabindex="-1" role="dialog" aria-labelledby="formpoc" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content border-0">
			<div class="modal-header">
				<h6 id="formpoc-header" class="text-dark mb-0"></h6>

				<button type="button" class="btn-close btn-close-dark" data-bs-dismiss="modal"
				        aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="form-box">
					<div class="form-content">
                        <?php $form = ActiveForm::begin(['options' => ['id' => 'myForm']]); ?>


						<div class="row align-items-center">

							<div class="col-md-6 mb-3">
                                <?= $form->field($model, 'name')->textInput(['maxlength' => true, 'class' => 'form__input form-control', 'placeholder' => 'Name'])->label(false) ?>
							</div>
							<div class="col-md-6 mb-3">
                                <?= $form->field($model, 'email')->textInput(['maxlength' => true, 'class' => 'form__input form-control', 'placeholder' => 'Email'])->label(false) ?>
							</div>

						</div>

						<div class="row align-items-center">
							<div class="col-md-6 mb-3">
                                <?= $form->field($model, 'name_cc1')->textInput(['maxlength' => true, 'class' => 'form__input form-control', 'placeholder' => 'Email'])->label(false) ?>
							</div>
							<div class="col-md-6 mb-3">
                                <?= $form->field($model, 'email_cc')->textInput(['maxlength' => true, 'class' => 'form__input form-control', 'placeholder' => 'Email CC'])->label(false) ?>
							</div>
						</div>

						<div class="row align-items-center">
							<div class="col-md-6 mb-3">
                                <?= $form->field($model, 'name_cc2')->textInput(['maxlength' => true, 'class' => 'form__input form-control', 'placeholder' => 'Email'])->label(false) ?>
							</div>
							<div class="col-md-6 mb-3">
                                <?= $form->field($model, 'email_cc_additional')->textInput(['maxlength' => true, 'class' => 'form__input form-control', 'placeholder' => 'Email CC'])->label(false) ?>
							</div>
						</div>
						<div class="row align-items-center mb-3">
                            <?= $form->field($modelKedio,
                                'kcdio')->dropDownList(ArrayHelper::map(Kcdio::find()->all(), 'kcdio', 'kcdio'),
                                [
                                    'prompt' => 'Select KCDIO', 'class' => 'form__input form-control',
                                    'id' => 'validationKCDIO', 'name' => 'Poc[KCDIO]', 'required' => true,
                                ])->label(false) ?>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<div class="form-group">
                    <?= Html::submitButton('',['class' => 'btn btn-outline-dark px-4 py-2', 'name' => 'save-button', 'id'=>'submit-button'])?>
				</div>
			</div>
            <?php ActiveForm::end(); ?>
		</div>
	</div>
</div>