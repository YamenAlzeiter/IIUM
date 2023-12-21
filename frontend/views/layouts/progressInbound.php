<?php

/** @var \yii\web\View $this */
/** @var string $content */

use common\widgets\Alert;
use frontend\assets\AppAsset;
use yii\bootstrap5\Breadcrumbs;
use yii\bootstrap5\Html;
use yii\bootstrap5\Nav;
use yii\bootstrap5\NavBar;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>" class="h-100">
<head>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

	<meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <?php $this->registerCsrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body class="d-flex flex-column h-100">
<?php $this->beginBody() ?>



<main role="main" class="flex-shrink-0">
    <div class="container">
     
	    <ul class="form-stepper form-stepper-horizontal text-center mx-auto mt-5 pl-0">
		    <!-- Step 1: Personal Information -->
		    <li class="form-stepper-active text-center form-stepper-list" step="1">
			    <a class="mx-2">
            <span class="form-stepper-circle">
                <span>1</span>
            </span>
				    <div class="label">Personal Information</div>
			    </a>
		    </li>
		    <!-- Step 2: Emergency Contact -->
		    <li class="form-stepper-unfinished text-center form-stepper-list" step="2">
			    <a class="mx-2">
            <span class="form-stepper-circle text-muted">
                <span>2</span>
            </span>
				    <div class="label text-muted">Emergency Contact</div>
			    </a>
		    </li>
		    <!-- Step 3: Academic Background -->
		    <li class="form-stepper-unfinished text-center form-stepper-list" step="3">
			    <a class="mx-2">
            <span class="form-stepper-circle text-muted">
                <span>3</span>
            </span>
				    <div class="label text-muted">Academic Background</div>
			    </a>
		    </li>
		    <!-- Step 4: Mobility Information -->
		    <li class="form-stepper-unfinished text-center form-stepper-list" step="4">
			    <a class="mx-2">
            <span class="form-stepper-circle text-muted">
                <span>4</span>
            </span>
				    <div class="label text-muted">Proposed Study at IIUM</div>
			    </a>
		    </li>
		    <!-- Step 5: Course Info -->
		    <li class="form-stepper-unfinished text-center form-stepper-list" step="5">
			    <a class="mx-2">
            <span class="form-stepper-circle text-muted">
                <span>5</span>
            </span>
				    <div class="label text-muted">Accommodation & Financial</div>
			    </a>
		    </li>
		    <!-- Step 6: Declaration -->
		    <li class="form-stepper-unfinished text-center form-stepper-list" step="6">
			    <a class="mx-2">
            <span class="form-stepper-circle text-muted">
                <span>6</span>
            </span>
				    <div class="label text-muted">Approval From Home University</div>
			    </a>
		    </li>
		    <!-- Step 7: Declaration -->
		    <li class="form-stepper-unfinished text-center form-stepper-list" step="7">
			    <a class="mx-2">
            <span class="form-stepper-circle text-muted">
                <span>7</span>
            </span>
				    <div class="label text-muted">Application Cheklist</div>
			    </a>
		    </li>
	    </ul>

        <?= Alert::widget() ?>
        <?= $content ?>
    </div>
</main>


<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage();

