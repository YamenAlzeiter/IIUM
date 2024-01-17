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

		<script src = "https://code.jquery.com/jquery-3.6.4.min.js"></script>
		<meta charset = "<?= Yii::$app->charset ?>">
		<meta name = "viewport" content = "width=device-width, initial-scale=1, shrink-to-fit=no">
        <?php $this->registerCsrfMetaTags() ?>
		<title><?= Html::encode($this->title) ?></title>
        <?php $this->head() ?>
	</head>
	<body>
    <?php $this->beginBody() ?>
    <?php if (!Yii::$app->user->isGuest) : ?>
        <?= Html::beginForm(['/site/logout'], 'post', ['class' => 'd-flex']) ?>
        <?= Html::button('<i class="ti ti-logout fs-7"></i>',
            ['class' => 'btn btn-light logout fs-3', 'type' => 'submit', 'title' => 'Log Out']) ?>
        <?= Html::endForm() ?>
    <?php endif; ?>
	<div id = "main-wrapper">
		<div class = "position-relative overflow-hidden radial-gradient min-vh-100 w-100">
			<div class = "position-relative z-index-5">
				<div class = "row">

					<div class = "d-flex justify-content-center"><?= Alert::widget([
                            'options' => [
                                'class' => 'position-fixed mw-50',
                            ],
                        ]) ?></div>
					<div class = "col-xl-7 col-xxl-8 p-0">
						<div class = "w-auto">
							<a href = "/site/index" class = "brand-logo d-flex align-items-center gap-2">
								<img src = "/images/iiumLogo.svg" alt = "IIUM Logo" class = "iiumlogo">
								<h4 class = "mb-0 fw-semibold">Inbound/ Outbound Application</h4>
							</a>
						</div>
						<div class = "d-none d-xl-flex align-items-center justify-content-center"
						     style = "height: calc(100vh - 80PX);">
							<h1 class = "mb-0 fw-semibold text-capitalize text-success-emphasis">an image should be
							                                                                     here </h1>
						</div>
					</div>
					<div class="col-xl-5 col-xxl-4">

						<div class="authentication-login min-vh-100 bg-body row justify-content-center align-items-center p-4">


							<div class="auth-max-width col-sm-8 col-md-6 col-xl-7 px-4 ">
								<div class = "d-flex gap-1 align-items-center mb-4">
                                    <?= Html::a('<i class="ti ti-arrow-left fs-7"></i>',
                                        Yii::$app->request->referrer) ?>
									<h2 class = "fs-7 fw-bolder"><?= Html::encode($this->title) ?></h2>

								</div>
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
