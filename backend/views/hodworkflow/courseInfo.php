<?php

use yii\helpers\Html;
?>
<h3>OB-211S</h3>
<div class = "row">
<?php if (empty($model->Research)) : ?>
	<div class = "col-md-6 border-end">
		<h4 class = "font-monospace text-center mb-4">Courses offered by the Host University</h4>
		<table class = "table  table-hover">
			<!-- Table headers -->
			<thead>
			<tr>
				<th style = "width: 30%" class = "text-center font-monospace">Course Code</th>
				<th style = "width: 50%" class = "text-center font-monospace">Course Name</th>
				<th style = "width: 20%" class = "text-center font-monospace">Credit Hours</th>
			</tr>
			</thead>
			<tbody>
            <?php foreach ($courses as $course) : ?>
				<tr>
					<td class = "text-center py-2 px-1"><?= $course->course_code ?></td>
					<td class = "py-2 px-1"><?= $course->course_name ?></td>
					<td class = "text-center py-2 px-1"><?= $course->credit_hours ?></td>
				</tr>
            <?php endforeach; ?>
			</tbody>
		</table>
	</div>

	<div class = "col-md-6">
		<h4 class = "font-monospace text-center mb-4">IIUM Courses</h4>
		<table class = "table table-hover">
			<!-- Table headers -->
			<thead>
			<tr>
				<th style = "width: 30%" class = "text-center font-monospace">Course Code</th>
				<th style = "width: 50%" class = "text-center font-monospace">Course Name</th>
				<th style = "width: 20%" class = "text-center font-monospace">Credit Hours</th>
			</tr>
			</thead>
			<tbody>
            <?php foreach ($iiumcourses as $iiumcourse) : ?>
				<tr>
					<td class = "text-center py-2 px-1"><?= $iiumcourse->course_code ?></td>
					<td class = "py-2 px-1"><?= $iiumcourse->course_name ?></td>
					<td class = "text-center py-2 px-1"><?= $iiumcourse->credit_hours ?></td>
				</tr>
            <?php endforeach; ?>
			</tbody>
		</table>
	</div>
</div>
<?php endif; ?>
<?php if (!empty($model->Research)) : ?>
	<div class="alert-light alert">
		<p class="alert mb-2 fw-light mb-1"><strong>Academic Research:</strong> <?= $model->Research ?></p>
	</div>
<?php endif; ?>
<div class="d-flex flex-row-reverse gap-2">

    <?= Html::a('Approval', ['hod-approval', 'ID' => $model->ID, 'token' => $model->token], [
        'class' => 'btn  btn-success']) ?>

    <?= \yii\helpers\Html::a('<button type="button" class="btn btn-outline-secondary">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
                                                </svg>back</button>', Yii::$app->request->referrer) ?>

</div>
