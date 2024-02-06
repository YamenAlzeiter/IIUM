<?php

use yii\bootstrap5\ActiveForm;
use yii\grid\GridView;
use yii\helpers\Html;
use yii\helpers\Url;

/** @var yii\web\View $this */
/** @var yii\data\ActiveDataProvider $dataProvider */
/** @var backend\models\UserAdmin $model */


?>
<div class = "user-admin-index">

    <div class = "card w-100 mt-4">
        <div class = "card-body">.
            <div class = "d-flex flex-row mb-4">
                <a href = "javascript:void(0)" class = "btn btn-outline-dark d-flex align-items-center px-3" id = "add-user">
                    <i class = "ti ti-file me-0 me-md-1 fs-4"></i>
                    <span class = "d-none d-md-block font-weight-medium fs-3">Create New Record</span>
                </a>
            </div>
            <?= GridView::widget([
                'dataProvider' => $dataProvider,
                'tableOptions' => ['class' => 'table text-nowrap mb-0 align-middle table-hover'], 'summary' => '',
                'columns' => [
                    'username', 'matric_number',

                    [
                        'label' => 'Actions', 'contentOptions' => ['class' => 'action-column color-primary col-1'],
                        'headerOptions' => ['class' => 'text-dark'], 'format' => 'raw', 'value' => function ($model) {
                        $updateButton = Html::a('<i class="ti ti-pencil-minus fs-7"></i>', 'javascript:void(0)', [
                            'class' => 'text-info edit updateuser-button mx-1', 'data-id' => $model->id,
                            'data-toggle' => 'modal', 'data-target' => '#formpoc', 'title' => 'View/ Update',
                            // Tooltip for the 'View' action
                        ]);

                        $deleteButton = Html::a('<i class="ti ti-trash fs-7" data-toggle="tooltip" title="Log"></i>',
                            ['delete', 'id' => $model->id], [
                                'class' => 'text-danger edit mx-1 delete-record',
                                // Add a class to identify the delete action
                                'data' => [
                                    'action' => Url::to(['delete', 'id' => $model->id]),
                                    // Add the action URL to data attributes
                                ], 'disabled' => $model->id === 1 ? true : false, // Disable the button for ID 1
                            ]);
                        if ($model->id === 1) {
                            return $updateButton;
                        } else {
                            return $updateButton.' '.$deleteButton;
                        }
                    },
                    ],
                ],
            ]); ?>

        </div>
    </div>

    <!-- Modal Add notes -->
    <div class = "modal fade" id = "formpoc" tabindex = "-1" role = "dialog" aria-labelledby = "formpoc"
         aria-hidden = "true">
        <div class = "modal-dialog  modal-dialog-centered" role = "document">
            <div class = "modal-content">
                <div class = "modal-header">
                    <h6 id = "formpoc-header" class = "text-dark mb-0"></h6>

                    <button type = "button" class = "btn-close btn-close-dark" data-bs-dismiss = "modal"
                            aria-label = "Close"></button>
                </div>
                <div class = "modal-body">
                    <div class = "form-box">
                        <div class = "form-content">
                            <?php $form = ActiveForm::begin(['options' => ['id' => 'myForm']]); ?>

                            <div class = "mb-3">
                                <?= $form->field($model, 'username')->textInput([
                                    'maxlength' => true, 'class' => 'form__input form-control',
                                    'placeholder' => 'Username', 'required' => true
                                ])->label(false) ?>
                            </div>

                            <div class = "row align-items-center">
                                <div class = "col-md-6 mb-3">
                                    <?= $form->field($model, 'matric_number')->textInput([
                                        'maxlength' => true, 'class' => 'form__input form-control',
                                        'placeholder' => 'Matric Number', 'required' => true
                                    ])->label(false) ?>
                                </div>
                                <div class = "col-md-6 mb-3">
                                    <?= $form->field($model, 'email')->textInput([
                                        'maxlength' => true, 'class' => 'form__input form-control',
                                        'placeholder' => 'email', 'required' => true
                                    ])->label(false) ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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

