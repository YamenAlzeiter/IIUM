<?php

use dosamigos\tinymce\TinyMce;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

$this->title = 'Approval';

/** @var common\models\Outbound $model */
require Yii::getAlias('@common').'/Helpers/helper.php';
?>
<div class = "container">
    <div class = "d-flex flex-column">
        <div class = "card shadow-none border bg-light-subtle">
            <div class = "card-body">
                <div class = "d-flex justify-content-between">
                    <div class = "d-flex align-items-center header-info gap-1 mb-3">
                        <i class = "ti ti-user-circle text-dark"></i>
                        <strong>
                            <h4 class = "fw-semibold m-0">Personal Info</h4>
                        </strong>
                    </div>
                    <div class = "d-flex gap-2">
                        <?= Html::a('<button class="btn btn-warning p-3 rounded-circle d-flex align-items-center justify-content-center customizer-btn"><i class="ti ti-eye fs-5"></i></button>',
                            ['view-full', 'ID' => $model->ID, 'token' => $model->Token],) ?>
                        <a href = "javascript:void(0)" class = "btn btn-outline-dark d-flex align-items-center px-3"
                           id = "add-notes">
                            <!--		                <i class="ti ti-file me-0 me-md-1 fs-4"></i>-->
                            <span class = "d-none d-md-block font-weight-medium fs-3">Approval/Rejection</span>
                        </a>

                    </div>
                </div>
                <div class = "row">
                    <div class = "col-md-6">
                        <p class = "mb-2 fw-light mb-1"><strong>Name: </strong> <?= $model->Name ?></p>
                        <p class = "mb-2 fw-light mb-1"><strong>Matric Number: </strong> <?= $model->Matric_Number ?>
                        </p>
                        <p class = "mb-2 fw-light mb-1"><strong>Citizenship: </strong> <?= $model->Citizenship ?></p>
                        <p class = "mb-2 fw-light mb-1">
                            <strong>Gender: </strong> <?= getGenderMeaning($model->Gender) ?>
                        </p>
                        <p class = "mb-2 fw-light mb-1"><strong>Postcode: </strong> <?= $model->Postcode ?></p>
                        <p class = "mb-2 fw-light mb-1"><strong>State: </strong> <?= $model->State ?></p>
                        <p class = "mb-2 fw-light mb-1"><strong>Country: </strong> <?= $model->Country ?></p>
                    </div>
                    <div class = "col-md-6">
                        <p class = "mb-2 fw-light mb-1"><strong>Date of Birth: </strong> <?= $model->Date_of_Birth ?>
                        </p>
                        <p class = "mb-2 fw-light mb-1"><strong>Passport
                                                                Number: </strong> <?= $model->Passport_Number ?>
                        </p>
                        <p class = "mb-2 fw-light mb-1"><strong>Passport
                                                                Expiration: </strong> <?= $model->Passport_Expiration ?>
                        </p>
                        <p class = "mb-2 fw-light mb-1"><strong>Mobile Number:</strong> <?= $model->Mobile_Number ?></p>
                        <p class = "mb-2 fw-light mb-1"><strong>Mailing
                                                                Address: </strong> <?= $model->Mailing_Address ?>
                        </p>
                        <p class = "mb-2 fw-light mb-1"><strong>Mailing state: </strong> <?= $model->Mailing_State ?>
                        </p>
                        <p class = "mb-2 fw-light mb-1"><strong>Mailing
                                                                Country: </strong> <?= $model->Mailing_Country ?>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class = "card shadow-none border ">
            <div class = "card-body">
                <div class = "d-flex align-items-center header-info gap-1 mb-3">
                    <i class = "ti ti-books text-dark"></i>
                    <?php if ($model->Academic_lvl_edu !== 'PG') : ?>
                        <strong>
                            <h4 class = "fw-semibold m-0">Course Information</h4>
                        </strong>
                    <?php else: ?>
                        <strong>
                            <h4 class = "fw-semibold m-0">Research Information</h4>
                        </strong>
                    <?php endif; ?>
                </div>
                <?php if ($model->Academic_lvl_edu !== 'PG') : ?>
                    <div class = "row">
                        <div class = "col-md-6 border-end">
                            <h4 class = "font-monospace text-center mb-4">Courses offered by the Host University</h4>
                            <table class = "table table-hover table-light">
                                <!-- Table headers -->
                                <thead>
                                <tr>
                                    <th style = "width: 30%" class = "text-center font-monospace">Course Code</th>
                                    <th style = "width: 40%" class = "text-center font-monospace">Course Name</th>
                                    <th style = "width: 30%" class = "text-center font-monospace">Credit Hours</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php foreach ($courses as $course) : ?>
                                    <tr>
                                        <td class = "text-center py-2 px-1"><?= $course->course_code ?></td>
                                        <td class = "text-center py-2 px-1"><?= $course->course_name ?></td>
                                        <td class = "text-center py-2 px-1"><?= $course->credit_hours ?></td>
                                    </tr>
                                <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                        <div class = "col-md-6">
                            <h4 class = "font-monospace text-center mb-4">IIUM Courses</h4>
                            <table class = "table table-hover table-light">
                                <!-- Table headers -->
                                <thead>
                                <tr>
                                    <th style = "width: 30%" class = "text-center font-monospace">Course Code</th>
                                    <th style = "width: 40%" class = "text-center font-monospace">Course Name</th>
                                    <th style = "width: 30%" class = "text-center font-monospace">Credit Hours</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php foreach ($iiumcourses as $iiumcourse) : ?>
                                    <tr>
                                        <td class = "text-center py-2 px-1"><?= $iiumcourse->course_code ?></td>
                                        <td class = "text-center py-2 px-1"><?= $iiumcourse->course_name ?></td>
                                        <td class = "text-center py-2 px-1"><?= $iiumcourse->credit_hours ?></td>
                                    </tr>
                                <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div>
                    </div>
                <?php else: ?>
                    <div>
                        <p class = "mb-2 fw-light mb-1 text-dark"><strong>Academic Research:</strong> <?= $model->Research ?></p>
                    </div>
                <?php endif; ?>
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
        <div class = "mt-3 px-4 d-flex flex-row gap-2">
        </div>
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
                                <div class = "d-flex flex-row align-items-center gap-3">
                                    <p class = "text-start fs-4 mb-3 fw-semibold">I hereby confirm that this student has gone through the rightful university selection procedures and recommend that the student is qualified to participate in the student exchange program stated in the application.</p>

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
                                    ], 'class' => 'form'
                                ]) ?>
                                <?= Html::hiddenInput('status', 31, ['id' => 'status-input-reject']); ?>

                                <div class = "conditional-form-elements" style = "display: none;">
                                    <?= Html::submitButton('Save', ['class' => 'btn btn-success mt-3']) ?>
                                </div>
                                <?php ActiveForm::end() ?>

                                <?php ActiveForm::begin([
                                    'action' => [
                                        'reject', 'ID' => $model->ID, 'token' => $model->Token
                                    ], 'class' => 'form'
                                ]) ?>
                                <?= Html::hiddenInput('status', 32, ['id' => 'status-input-reject']); ?>
                                <div class = "conditional-form-elements-reject" style = "display: none;">
                                    <div class="form-floating">
                                        <textarea class="form-control" name="reason" placeholder="Leave a comment here" id="floatingTextarea"></textarea>
                                    </div>
                                    <?= Html::submitButton('Submit', ['class' => 'btn btn-success mt-3']) ?>
                                </div>
                                <?php ActiveForm::end() ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
