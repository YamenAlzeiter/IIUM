<?php



use yii\helpers\Html;
use yii\widgets\ActiveForm;


?>
<h3>OB-212S</h3>
<div>
    <h6 class="text-uppercase fw-bold">approval and recommendation from kulliyyah</h6>
    <p>I hereby confirm that this student has gone through the rightful university selection procedures and recommend
        that the student is qualified to participate in the student exchange program stated in the application.</p>
</div>




    <div class="form-check form-check-inline mb-3">
        <label class="form-check-label" for="inlineRadio1">Accept</label>
        <input class="form-check-input" type="radio" name="status" id="inlineRadio1" value="11"/>
    </div>

    <div class="form-check form-check-inline mb-3">
        <label class="form-check-label" for="inlineRadio2">Reject</label>
        <input class="form-check-input" type="radio" name="status" id="inlineRadio2" value="12"/>
    </div>

<?php ActiveForm::begin(['action' => ['approve', 'ID' => $model->ID, 'token'=>$model->token], 'class' => 'form']) ?>
<?= Html::hiddenInput('status', 11, ['id' => 'status-input-reject']); ?>

<div class = "conditional-form-elements" style = "display: none;">
    <?= Html::submitButton('Save', ['class' => 'btn btn-success mt-3']) ?>
</div>
<?php ActiveForm::end() ?>

<?php ActiveForm::begin(['action' => ['reject', 'ID' => $model->ID, 'token'=>$model->token], 'class' => 'form']) ?>
<?= Html::hiddenInput('status', 12, ['id' => 'status-input-reject']); ?>

<div class = "conditional-form-elements-reject" style = "display: none;">
	<div class = "form-group">
            <textarea type = "text" class = "form-control" id = "reasonComplete" name = "reason"
                      placeholder = "Reason for rejection"></textarea>
	</div>
    <?= Html::submitButton('Submit', ['class' => 'btn btn-success mt-3']) ?>
</div>
<?php ActiveForm::end() ?>


<?php
$this->registerJs("
        $(document).ready(function() {
            $('#inlineRadio1').on('change', function() {
            
                if (this.checked) {          
                    $('.conditional-form-elements').show();
                    $('.conditional-form-elements-reject').hide();
                       $('.conditional-form-elements-incomplete').hide();
                }
            });
           $('#inlineRadio2').on('change', function() {
                if (this.checked) {
                    $('.conditional-form-elements-reject').show();
                    $('.conditional-form-elements').hide();
                    $('.conditional-form-elements-incomplete').hide();
                }
            });                     
        });
    ");
?>
