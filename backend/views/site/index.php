<?php

use yii\bootstrap5\Html;
use dosamigos\ckeditor\CKEditor;

$this->title = 'Sales Overview';



echo CKEditor::widget([
    'name' => 'editor',
    'preset' => 'full', // You can use 'basic', 'standard', or 'full'
]);

?>
<!-- Start Basic Bar Chart -->

<!-- End Basic Bar Chart -->