<?php

/** @var yii\web\View $this */
/** @var string $content */

use backend\assets\AppAsset;
use yii\helpers\Html;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>" class="h-100">
<head>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <?php $this->registerCsrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body>
<?php $this->beginBody() ?>


<div class = "page-wrapper" id = "main-wrapper" data-layout = "vertical" data-navbarbg = "skin6"
     data-sidebartype = "full"
     data-sidebar-position = "fixed" data-header-position = "fixed">

        <main role = "main" class = "flex-shrink-0">
                 <div class="p-4">
                     <?= $content ?>
                 </div>
        </main>
</div>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage();
