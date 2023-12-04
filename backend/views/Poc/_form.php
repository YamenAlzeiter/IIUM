<?php

use common\models\Kcdio;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var common\models\Poc $model */
/** @var yii\widgets\ActiveForm $form */
?>
<div class = "header d-flex align-items-center mb-4">
	<i class = "ti ti-user-plus text-dark me-2"></i>
	<h1 class = "text-start m-0">Add a New Record</h1>
</div>
<?php $form = ActiveForm::begin(); ?>

<div class = "form__div_small">
    <?= $form->field($model, 'name', [
        'template' => '
          <input type="text" class="form__input form-control" id="validationCustomName" name="Poc[name]" maxlength="255" placeholder=" " value = "' . $model->name . '"  required>
          <label for="validationCustomName" class="form__label_small">Name</label>
          {error}
      ',
    ])->textInput(['maxlength' => true]) ?>
</div>
<div class = "row align-items-center">
	<div class = "col-md-4">

		<div class = "form__div_small">
            <?= $form->field($model, 'email', [
                'template' => '
               <input type="email" class="form__input form-control" id="validationEmail" name="Poc[email]"  maxlength="255" placeholder=" " value = "' . $model->email . '"   required>
               <label for="validationEmail" class="form__label_small">Email</label>
               {error}
               ',
            ])->textInput(['maxlength' => true]) ?>
		</div>

	</div>
	<div class = "col-md-4">

		<div class = "form__div_small">
            <?= $form->field($model, 'email_cc', [
                'template' => '
               <input type="email" class="form__input form-control" id="validationEmailCC" name="Poc[email_cc]"  maxlength="255" placeholder=" " value = "' . $model->email_cc . '"  required>
               <label for="validationEmailCC" class="form__label_small">Email CC</label>
               {error}
               ',
            ])->textInput(['maxlength' => true]) ?>
		</div>

	</div>
	<div class = "col-md-4">

		<div class = "form__div_small">
            <?= $form->field($model, 'phone_number', [
                'template' => '
               <input type="text" class="form__input form-control" id="validationPhoneNumber" name="Poc[phone_number]"  maxlength="255" placeholder=" " value = "' . $model->phone_number . '"  required>
               <label for="validationPhoneNumber" class="form__label_small">Phone Number</label>
               {error}
               ',
            ])->textInput(['maxlength' => true]) ?>
		</div>

	</div>
</div>
<div class = "row align-items-center">
	<div class = "col-md-6">
		<div class = "row-md-6 mb-2">
			<div class = "form__div_small">
                <?= $form->field($modelKedio, 'kcdio', [
                    'template' => '
               {input}<i class="ti ti-chevron-down dropdown-icon"></i>
               {error} 		
               ',
                ])->dropDownList(ArrayHelper::map(Kcdio::find()->all(), 'kcdio', 'kcdio'), [
                    'prompt' => 'Select KCDIO', 'class' => 'form__input form-control', 'id' => 'validationKCDIO',
                    'name' => 'Poc[KCDIO]', 'required' => true,
                ]) ?>
			</div>
		</div>
	</div>
	<div class = "col-md-6">
		<div class = "row-md-6 mb-2">
			<div class = "form__div_small">
                <?= $form->field($model, 'kulliah', [
                    'template' => '
               <input type="text" class="form__input form-control" id="validationKulliah" name="Poc[kulliah]"  maxlength="255" placeholder=" " value = "' . $model->kulliah . '" required>
               <label for="validationKulliah" class="form__label_small">Kulliyah</label>
               {error}
               ',
                ])->textInput(['maxlength' => true]) ?>
			</div>
		</div>
	</div>
</div>
<div class = "form-group">
    <?= Html::submitButton('<i class="ti ti-plus"></i> Save', ['class' => 'btn btn-outline-dark px-4 py-2', 'name' => 'save-button']) ?>

</div>
<?php ActiveForm::end(); ?>

