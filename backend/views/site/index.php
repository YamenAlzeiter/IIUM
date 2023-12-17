<?php

use yii\bootstrap5\Html;
use dosamigos\ckeditor\CKEditor;
require Yii::getAlias('@common').'/Helpers/helper.php';

$count = getCount('Pos');
$this->title = 'Dashboard';
?>
 
 <div>
    <label for="modelSelect">Select a Model:</label>
    <select id="modelSelect">
        <option value="Kcdio">Kcdio</option>
        <option value="Pos">Pos</option>
    </select>
</div>
<div class="value" akhi="<?= $count ?>">0</div>