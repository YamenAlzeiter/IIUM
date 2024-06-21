<?php

/** @var View $this */

/** @var string $content */

use backend\assets\AppAsset;
use common\components\Sidebar;
use common\widgets\Alert;
use yii\bootstrap5\Breadcrumbs;
use yii\bootstrap5\Html;
use yii\bootstrap5\Nav;
use yii\bootstrap5\NavBar;
use yii\web\JqueryAsset;
use yii\web\View;


AppAsset::register($this);
?>
<?php $this->beginPage() ?>
    <!DOCTYPE html>
    <html lang = "<?= Yii::$app->language ?>" class = "h-100">

    <head>
        <meta charset = "<?= Yii::$app->charset ?>">

        <script src = "https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src = "https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script src = "https://cdn.jsdelivr.net/npm/apexcharts"></script>


        <!-- FAVICONS ICON -->
        <link rel="shortcut icon" type="image/png" href="https://style.iium.edu.my/images/iium/iium-logo.png">
        <!-- Style css -->
        <link href="https://style.iium.edu.my/css/style.css" rel="stylesheet">
        <link href="https://style.iium.edu.my/css/iium.css" rel="stylesheet">
        <!-- FONTS -->
        <link href="https://fonts.googleapis.com/css2?family=Material+Icons" rel="stylesheet">
        <!-- BOOTSTRAP SELECT -->
        <link href="https://style.iium.edu.my/vendor/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">

        <meta name = "viewport" content = "width=device-width, initial-scale=1, shrink-to-fit=no">
        <?php $this->registerCsrfMetaTags() ?>
        <title><?= Html::encode($this->title) ?></title>
        <?php $this->head() ?>
    </head>
    <body>
    <?php $this->beginBody() ?>
    <div class="background-image"></div>
    <!-- Preloader start -->
    <div id="preloader">
        <div class="lds-ripple">
            <div></div>
            <div></div>
        </div>
    </div>
    <!-- Preloader end -->
    <!-- Main wrapper start -->
    <div id="main-wrapper">
        <!-- Navigation Header start -->

        <div class="nav-header">
            <a href='<?= Yii::$app->homeUrl ?>' class="brand-logo">
                <img src="https://style.iium.edu.my/images/iium/iium-logo-v2.png" class="user_img"
                     style="max-width: 75%" alt=""/>
            </a>
            <div class="nav-control">
                <div class="hamburger">
                    <span class="line"></span>
                    <span class="line"></span>
                    <span class="line"></span>
                </div>
            </div>
        </div>

        <div class="header">
            <div class="header-content">
                <?php NavBar::begin([
                    'renderInnerContainer' => false,
                    'options' => [
                        'class' => 'navbar navbar-expand',
                    ],
                ]);



                echo Nav::widget([
                    'options' => ['class' => 'navbar navbar-expand'],

                ]);

                if (Yii::$app->user->isGuest) {
                    echo Html::tag('div',
                        Html::a('Login', ['/site/login'], ['class' => 'btn btn-link text-white login text-decoration-none']),
                        ['class' => 'd-flex']);
                } else {
                    echo Html::beginForm(['/site/logout'], 'post', ['class' => ''])
                        . Html::submitButton('Logout', ['class' => 'btn text-white btn-link logout text-decoration-none'])
                        . Html::endForm();
                }

                NavBar::end();
                ?>
            </div>
        </div>
                <!--calling the sidebar layout on to be rendered on main layout-->
                <?php

                // Build the menu items array
                $menuItems = [
                    ['title' => 'Home'],
                    ['url' => 'agreement/index', 'icon' => 'https://style.iium.edu.my/images/iconly/light/Category.svg', 'optionTitle' => 'Agreements'],
                ];


                if (Yii::$app->user->identity->id == 1) {
                    $menuItems[] = ['title' => 'Admin'];
                    $menuItems[] = ['url' => 'setting', 'icon' => 'https://style.iium.edu.my/images/iconly/light/Setting.svg', 'optionTitle' => 'Setting v1'];
                    $menuItems[] =
                        [
                            'icon' => 'https://style.iium.edu.my/images/iconly/light/Setting.svg',
                            'optionTitle' => 'Settings v2',
                            'items' => [
                                ['url' => 'setting/poc', 'optionTitle' => 'Person in Charge'],
                                ['url' => 'setting/email-template', 'optionTitle' => 'Email Template'],
                                ['url' => 'setting/kcdio', 'optionTitle' => 'K/C/D/I/O'],
                                ['url' => 'setting/status', 'optionTitle' => 'Status'],
                                ['url' => 'setting/others', 'optionTitle' => 'Others'],
                            ]
                        ];
                }

                // Render the Sidebar widget with the menu items
                echo Sidebar::widget([
                    'items' => $menuItems
                ]);

                ?>
        <div class="content-body">
            <!-- Breadcrumb start -->
            <div class="page-titles">
                <ol class="breadcrumb">
                    <li>
                        <h5 class="bc-title">
                            <?= Html::encode($this->title) ?>
                        </h5>
                    </li>

                </ol>
            </div>
            <div class="container-lg my-3 p-3 rounded-3 bg-white shadow">
                <?= $content ?>
            </div>
        </div>
        <!-- End of Page Content -->
    </div>


    <script>
        setTimeout(function () {
            $('.alert').fadeOut('slow');
        }, 2500);
    </script>
    <?php $this->endBody() ?>
    <?php
    // Bottom of the view file, before closing body tag
    $this->registerJsFile('https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js',
        ['depends' => [JqueryAsset::class]]);
    $this->registerJs(<<<JS
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    var tooltipList = tooltipTriggerList.map(function(tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });
JS
    );
    ?>
<!--    <script src="https://style.iium.edu.my/vendor/global/global.min.js"></script>-->
    <script src="https://style.iium.edu.my/js/custom.js"></script>
    <script src="https://style.iium.edu.my/js/deznav-init.js"></script>
    </body>
    </html>
<?php $this->endPage();
