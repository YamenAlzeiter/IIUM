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
        <script src = "https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <link rel="shortcut icon" type="image/png" href="https://style.iium.edu.my/images/iium/iium-logo.png">
		<meta charset="<?= Yii::$app->charset ?>">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <?php $this->registerCsrfMetaTags() ?>
		<title><?= Html::encode($this->title) ?></title>
        <?php $this->head() ?>
	</head>
	<body class="d-flex flex-column h-100">
    <?php $this->beginBody() ?>

	<header>
        <?php
        NavBar::begin([
            'options' => [
                'class' => 'navbar navbar-expand-md bg-white fixed-top mb-3 shadow-sm', // Update class here
            ],
        ]);
        echo Html::a(
            '<div class="brand-logo d-flex align-items-center gap-2">' .
            Html::img('/images/iiumLogo.svg', ['alt' => 'IIUM Logo', 'class' => 'iiumlogo']) .
            '<h4 class="mb-0 fw-semibold">Inbound/ Outbound Application</h4>' .
            '</div>',
            Yii::$app->homeUrl, // Update brand URL here
            ['class' => 'navbar-brand'] // Add class to the brand link
        );

        echo Nav::widget([
            'options' => ['class' => 'navbar-nav me-auto mb-2 mb-md-0'],
        ]);
        if (Yii::$app->user->isGuest) {
            echo Html::tag(
                    'div',
                    Html::a('Login', ['/site/login'], ['class' => ['btn btn-light login text-decoration-none me-2']]),
                    ['class' => ['d-flex']]
                ) . Html::tag(
                    'div',
                    Html::a('Sign up', ['/site/signup'], ['class' => ['btn btn-outline-dark text-decoration-none']]),
                    ['class' => ['d-flex']]
                );

        } else {
            echo Html::beginForm(['/site/logout'], 'post', ['class' => 'd-flex'])
                . Html::button(
                    '<i class="ti ti-logout fs-7"></i>',
                    ['class' => 'btn btn-light logout fs-3', 'type' => 'submit', 'title' => 'Log Out']
                )
                . Html::endForm();
        }
        NavBar::end();
        ?>
	</header>

	<main role="main" class="flex-shrink-0">
		<div class="container p-100">
            <?= Breadcrumbs::widget([
                'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
            ]) ?>
            <?= Alert::widget() ?>
            <?= $content ?>
		</div>
	</main>
    <script>
        setTimeout(function () {
            $('.alert').fadeOut('slow');
        }, 2500);
    </script>
    <?php $this->endBody() ?>
	</body>
	</html>
<?php $this->endPage();