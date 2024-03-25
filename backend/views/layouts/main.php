<?php

/** @var View $this */

/** @var string $content */

use backend\assets\AppAsset;
use common\widgets\Alert;
use yii\bootstrap5\Breadcrumbs;
use yii\bootstrap5\Html;
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
        <script src = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src = "https://cdn.jsdelivr.net/npm/apexcharts"></script>
        <script src = "https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
    <div id="preloader">
        <div class="lds-ripple">
            <div></div>
            <div></div>
        </div>
    </div>
        <div class = "page-wrapper" id = "main-wrapper" data-layout = "vertical" data-navbarbg = "skin6"
             data-sidebartype = "full"
             data-sidebar-position = "fixed" data-header-position = "fixed">
            <aside class = "left-sidebar">
                <!--calling the sidebar layout on to be rendered on main layout-->
                <?php echo $this->render('sideBar') ?>
                <div class = "dark-transparent sidebartoggler">hello wrold</div>
            </aside>
            <header class = "app-header">
                <nav class = "navbar navbar-expand-lg navbar-light">
                    <ul class = "navbar-nav">
                        <li class = "nav-item d-block d-xl-none">
                            <a class = "nav-link sidebartoggler nav-icon-hover" id = "headerCollapse"
                               href = "javascript:void(0)">
                                <i class = "ti ti-menu-2"></i>
                            </a>
                        </li>
                    </ul>
                </nav>
            </header>
            <div class = "body-wrapper" id="content-body">
                <main role = "main" class = "flex-shrink-0">
                    <div class = "container ">

                        <?= Breadcrumbs::widget([
                            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
                        ]) ?>
                        <?= Alert::widget() ?>
                        <?= $content ?>
                    </div>
                </main>
            </div>
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
    <scsript src="https://style.iium.edu.my/js/deznav-init.js"></scsript>
    <script src="https://style.iium.edu.my/vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
    </body>
    </html>
<?php $this->endPage();
