<?php


/** @var View $this */

/** @var string $content */

use common\widgets\Alert;
use frontend\assets\AppAsset;
use yii\bootstrap5\Breadcrumbs;
use yii\bootstrap5\Html;
use yii\bootstrap5\Nav;
use yii\bootstrap5\NavBar;
use yii\web\View;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
	<!DOCTYPE html>
	<html lang = "<?= Yii::$app->language ?>" class = "h-100">

	<head>
        <link rel="shortcut icon" type="image/png" href="https://style.iium.edu.my/images/iium/iium-logo.png">
		<script src = "https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script src = "https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
		<meta charset = "<?= Yii::$app->charset ?>">
		<meta name = "viewport" content = "width=device-width, initial-scale=1, shrink-to-fit=no">
        <?php $this->registerCsrfMetaTags() ?>
		<title><?= Html::encode($this->title) ?></title>
        <?php $this->head() ?>
	</head>
	<body class = "d-flex flex-column h-100">
    <?php $this->beginBody() ?>

	<div id = "main-wrapper">
		<div class = "position-relative overflow-hidden radial-gradient min-vh-100 w-100">
			<div class = "position-relative z-index-5">
				<div class = "row">
					<div class = "col-xl-5 col-xxl-3">
                        <div class="position-absolute back">
                            <?= Html::a('<i class="ti ti-chevron-left fs-8 fw-bolder" ></i>', Yii::$app->request->referrer) ?>
                        </div>
						<!--						<div class = "d-xl-flex align-items-center justify-content-center"-->
						<ul class = "d-none d-xl-flex form-stepper form-stepper-horizontal text-center mb-0 vh-100 justify-content-center gap-5">
							<!-- Step 1: Personal Information -->
							<li class = " text-center form-stepper-list" step = "1" id="step-1-title">
								<a class = "mx-2">
									<div class = "label">Personal Information</div>
								</a>
							</li>
							<!-- Step 2: Emergency Contact -->
							<li class = "form-stepper-unfinished text-center form-stepper-list" step = "2">
								<a class = "mx-2">
									<div class = "label text-muted">Emergency Contact</div>
								</a>
							</li>
							<!-- Step 3: Academic Background -->
							<li class = "form-stepper-unfinished text-center form-stepper-list" step = "3">
								<a class = "mx-2">
									<div class = "label text-muted">Academic Background</div>
								</a>
							</li>
							<!-- Step 4: Mobility Information -->
							<li class = "form-stepper-unfinished text-center form-stepper-list" step = "4">
								<a class = "mx-2">
									<div class = "label text-muted">Mobility Information</div>
								</a>
							</li>
							<!-- Step 5: Course Info -->
							<li class = "form-stepper-unfinished text-center form-stepper-list" step = "5">
								<a class = "mx-2">
									<div class = "label text-muted">Course Info</div>
								</a>
							</li>
							<!-- Step 6: Declaration -->
							<li class = "form-stepper-unfinished text-center form-stepper-list" step = "6">
								<a class = "mx-2">
									<div class = "label text-muted">Declaration</div>
								</a>
							</li>
						</ul>
					</div>

					<div class = "col-xl-7 col-xxl-9">
						<div class = "min-vh-100 bg-body px-4 align-items-center row justify-content-center">
							<div class = "col-xxl-10">
                                <?= $content ?>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    <?php $this->endBody() ?>
	</body>

	</html>
<?php $this->endPage();