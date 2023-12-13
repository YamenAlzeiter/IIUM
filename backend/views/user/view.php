<?php
use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\web\YiiAsset;

YiiAsset::register($this);
?>

	<div class="user-admin-view">
        <?php
        echo DetailView::widget([
            'model' => $model,
            'attributes' => [
                'username',
                'matric_number',
                'email:email',
            ],
            'options' => ['class' => 'table text-nowrap mb-0 align-middle table-hover'], // Bootstrap table styling
        ]);
        ?>
	</div>

<?php
$userId = $model->id;
$isUserOne = ($userId === 1);

if ($isUserOne) {
    echo '<p class="alert alert-warning mt-4">cannot be deleted or edited.</p>';
} else {
    echo '<div class="btn-group mt-4" role="group" aria-label="Actions">';

    echo Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']);

    echo Html::a('Delete', ['delete', 'id' => $model->id], [
        'class' => 'btn btn-danger',
        'data' => [
            'confirm' => 'Are you sure you want to delete this item?',
            'method' => 'post',
        ]]);

    echo '</div>';
}
