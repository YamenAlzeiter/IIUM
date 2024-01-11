<?php

use common\models\Kcdio;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var backend\views\poc\pocSearch $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="poc-search">


    <?php $form = ActiveForm::begin(['action' => ['index'], 'method' => 'get']); ?>
	<div class = "d-flex flex-row gap-3 align-items-center">

        <?= $form->field($searchModel, 'name') ?>

        <?= $form->field($searchModel, 'email') ?>

        <?= $form->field($searchModel, 'KCDIO')->dropDownList(
            ArrayHelper::map(\common\models\Kcdio::find()->all(), 'kcdio', 'kcdio'),
            [
                'prompt' => 'ALL',
            ])->label('KCDIO') ?>


<!--        --><?php //= $form->field($searchModel, 'Status')->dropDownList(ArrayHelper::map($statusModel, 'ID', 'status'),
//            ['prompt' => 'All', 'class' => 'form-select']) ?>
        <?= Html::submitButton('Search', ['class' => 'collapsed fs-3 fw-semibold shadow-none btn btn-dark align-self-end']) ?>

	</div>
    <?php ActiveForm::end(); ?>





</div>
