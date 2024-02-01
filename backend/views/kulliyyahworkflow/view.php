<?php

use dosamigos\tinymce\TinyMce;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

$this->title = 'Approval';

/** @var common\models\Inbound $model */
require Yii::getAlias('@common').'/Helpers/helper.php';
?>
<div class = "container">
    <div class = "d-flex gap-2 justify-content-end mb-4">
        <?= Html::a('<button class="btn btn-warning p-3 rounded-circle d-flex align-items-center justify-content-center customizer-btn"><i class="ti ti-eye fs-5"></i></button>',
            ['view-full', 'ID' => $model->ID, 'token' => $model->Token],) ?>
        <a href = "javascript:void(0)" class = "btn btn-outline-dark d-flex align-items-center px-3"
           id = "action">
            <!--							                <i class="ti ti-file me-0 me-md-1 fs-4"></i>-->
            <span class = "d-none d-md-block font-weight-medium fs-3">Approval/Rejection</span>
        </a>
    </div>
    <div class = "row">
        <div class = "col-lg-6 d-flex flex-column">
            <div class = "card shadow-none border bg-light-subtle flex-fill">
                <div class = "card-body">
                    <div class = "d-flex justify-content-between">
                        <div class = "d-flex align-items-center header-info gap-1 mb-3">
                            <i class = "ti ti-user-circle text-dark"></i>
                            <strong>
                                <h4 class = "fw-semibold m-0">Personal Info</h4>
                            </strong>
                        </div>
                    </div>
                    <p class = "mb-2"><strong>Name:</strong> <?= $model->Name ?></p>
                    <p class = "mb-2"><strong>Citizenship:</strong> <?= $model->Citizenship ?></p>
                    <p class = "mb-2"><strong>Email Address:</strong> <?= $model->Email_address ?></p>
                    <p class = "mb-2"><strong>Date of Birth:</strong> <?= $model->Date_of_Birth ?></p>
                    <p class = "mb-2"><strong>Gender:</strong> <?= getGenderMeaning($model->Gender) ?></p>
                    <p class = "mb-2"><strong>Passport Number:</strong> <?= getCountry($model->Country_of_origin) ?></p>
                </div>
            </div>
        </div>
        <div class = "col-lg-6 d-flex flex-column">
            <div class = "card shadow-none border bg-light-danger">
                <div class = "card-body">
                    <div class = "d-flex justify-content-between">
                        <div class = "d-flex align-items-center header-info gap-1 mb-3">
                            <i class = "ti ti-school text-dark"></i>
                            <strong>
                                <h4 class = "fw-semibold m-0">Applicant Academic Background</h4>
                            </strong>
                        </div>
                    </div>
                    <p class = "mb-2"><strong>Home University:</strong> <?= $model->Academic_home_university ?></p>
                    <p class = "mb-2"><strong>Name of Programme:</strong> <?= $model->Academic_name_of_programme ?></p>
                    <p class = "mb-2"><strong>Name of Faculty:</strong> <?= $model->Academic_name_of_faculty ?></p>
                    <?php if ($model->Academic_lvl_edu === 'PG'): ?>
                        <p class = "mb-2"><strong>Research Title</strong> <?= $model->Research_title ?></p>
                    <?php endif; ?>
                    <p class = "mb-2"><strong>Level of Education:</strong> <?= getGenderMeaning($model->Gender) ?></p>
                    <p class = "mb-2"><strong>Current Semester:</strong> <?= $model->Academic_current_semester ?></p>
                    <p class = "mb-2"><strong>Current Year:</strong> <?= $model->Academic_current_year ?></p>
                    <p class = "mb-2"><strong>Current Result:</strong> <?= $model->Academic_current_result ?></p>
                </div>
            </div>
        </div>
    </div>
    <div class = "card shadow-none border bg-light-autom">
        <div class = "card-body">
            <div class = "d-flex align-items-center header-info gap-1 mb-3">
                <i class = "ti ti-books text-dark"></i>
                <h4 class = "fw-semibold m-0">Academic Research:</h4>

            </div>
            <p class = "mb-1 text-dark"><?= $model->Research_title ?></p>
        </div>
    </div>
    <!-- Modal Add notes -->
    <div class = "modal fade" id = "foraction" tabindex = "-1" role = "dialog"
         aria-hidden = "true">
        <div class = "modal-dialog modal-dialog-centered" role = "document">
            <div class = "modal-content border-0">
                <div class = "modal-header bg-dark">
                    <h6 id = "action-header" class = "text-white mb-0"></h6>
                    <button type = "button" class = "btn-close btn-close-white" data-bs-dismiss = "modal"
                            aria-label = "Close"></button>
                </div>
                <div class = "modal-body">
                    <div class = "form-box">
                        <div class = "form-content">
                            <div class = "d-flex flex-row align-items-center justify-content-center gap-3">
                                <div>
                                    <input type = "radio" class = "btn-check" name = "status" id = "inlineRadio1"
                                           autocomplete = "off" value = "11">
                                    <label class = "btn btn-outline-success rounded-pill font-medium  mb-2"
                                           for = "inlineRadio1">Accept</label>
                                </div>
                                <div>
                                    <input type = "radio" class = "btn-check" name = "status" id = "inlineRadio2"
                                           autocomplete = "off" value = "12">
                                    <label class = "btn btn-outline-danger rounded-pill font-medium mb-2"
                                           for = "inlineRadio2">Reject</label>
                                </div>
                            </div>

                            <?php ActiveForm::begin([
                                'action' => [
                                    'approve', 'ID' => $model->ID, 'token' => $model->Token
                                ],
                                'class' => 'form'
                            ]) ?>
                            <?= Html::hiddenInput('status', 15, ['id' => 'status-input-reject']); ?>

                            <div class = "conditional-form-elements" style = "display: none;">
                                <?= Html::submitButton('Submit', ['class' => 'btn btn-dark mt-3']) ?>
                            </div>
                            <?php ActiveForm::end() ?>

                            <?php ActiveForm::begin([
                                'action' => [
                                    'reject', 'ID' => $model->ID, 'token' => $model->Token
                                ],
                                'class' => 'form'
                            ]) ?>
                            <?= Html::hiddenInput('status', 16, ['id' => 'status-input-reject']); ?>

                            <div class = "conditional-form-elements-reject" style = "display: none;">
                                <div class = "form-group">
                                    <?php
                                    echo TinyMce::widget([
                                        'name' => 'reason', // Setting a name for the input
                                        'options' => ['rows' => 12],
                                        'language' => 'en',
                                        'clientOptions' => [
                                            'toolbar' => false,
                                        ],
                                        'value' => '', // Set initial value if needed
                                    ]);
                                    ?>
                                </div>
                                <?= Html::submitButton('Submit', ['class' => 'btn btn-dark mt-3 text-end']) ?>
                            </div>
                            <?php ActiveForm::end() ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

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
