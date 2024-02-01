<?php

use yii\bootstrap5\Html;
use yii\helpers\Url;
use yii\widgets\Menu;

?>
<a href = "">
    <div class = "mt-4 brand-logo d-flex align-items-center gap-2">
        <img src = "/images/iiumLogo.png" alt = "IIUM Logo" class = "w-25 h-25">
        <h4 class = "mb-0 fw-semibold">IO Dashboard</h4>
    </div>
</a>

<nav class = "sidebar-nav scroll-sidebar" data-simplebar = "">
    <!--this layout is only responsible for the sidebar part-->
    <?php
    echo Menu::widget([
        'options' => ['id' => 'sidebarnav'], 'encodeLabels' => false, 'items' => [
            [
                'label' => '<i class="ti ti-dots nav-small-cap-icon fs-4"></i><span class="hide-menu">Home</span>',
                'options' => ['class' => 'nav-small-cap'], 'template' => '{label}',
            ], [

                'template' => '<a href="javascript:void(0)" class="sidebar-link has-arrow"  aria-expanded="false">{label}</a>',
                'label' => '<i class="ti ti-layout-dashboard"></i><span class="hide-menu">Dashboard</span>',
                'options' => ['class' => 'sidebar-item'], 'items' => [
                    [
                        // Template for rendering the menu item as an anchor link with dynamic URL and label
                        // The URL will be replaced with the actual URL value, and the label will be replaced with the provided label text
                        'template' => '<a href="{url}" class="sidebar-link" >{label}</a>',
                        // Label for the menu item, including an icon
                        // The icon is defined using HTML markup
                        'label' => '<div class="round-16 d-flex align-items-center justify-content-center"><i class="ti ti-circle"></i></div><span class="hide-menu">Outbound Dashboard</span>',
                        // URL that the menu item should link to
                        // Clicking on the item will navigate the user to the 'index' action of the 'StatusController'
                        'url' => '/site/outbound-dashboard?year='.date('Y'),
                        // Additional options for the menu item, such as HTML attributes
                        // Assigns the class 'sidebar-item' to the menu item for styling or JavaScript interactions
                        'options' => ['class' => 'sidebar-item'],
                    ], [
                        'template' => '<a href="{url}" class="sidebar-link" >{label}</a>',
                        'label' => '<div class="round-16 d-flex align-items-center justify-content-center"><i class="ti ti-circle"></i></div><span class="hide-menu">Inbound Dashboard</span>',
                        'url' => Url::to(['/site/inbound-dashboard', 'year' => date('Y')]),
                        'options' => ['class' => 'sidebar-item'],
                    ],
                ],
            ], [
                'template' => '<a href="{url}" class="sidebar-link">{label}</a>',
                'label' => '<i class="ti ti-outbound"></i><span class="hide-menu">Outbound</span>',
                'url' => '/outbound/index?year='.date('Y'), 'options' => ['class' => 'sidebar-item'],
            ], [
                'template' => '<a href="{url}" class="sidebar-link">{label}</a>',
                'label' => '<i class="ti ti-arrows-exchange"></i><span class="hide-menu">Inbound</span>',
                'url' => '/inbound/index?year='.date('Y'), 'options' => ['class' => 'sidebar-item'],
            ], [
                'label' => '<i class="ti ti-dots nav-small-cap-icon fs-4"></i><span class="hide-menu">Admin</span>',
                'options' => ['class' => 'nav-small-cap'], 'template' => '{label}',
                // Use a custom template to display the label without the link
            ], [
                'template' => '<a href="{url}" class="sidebar-link">{label}</a>',
                'label' => '<i class="ti ti-user"></i><span class="hide-menu">Person In Charge</span>',
                'url' => ['/poc/index'], 'options' => ['class' => 'sidebar-item'],
            ], [
                'template' => '<a href="{url}" class="sidebar-link" >{label}</a>',
                'label' => '<i class="ti ti-status-change"></i><span class="hide-menu">Status</span>',
                // Visibility condition based on user permissions
                // The menu item will only be visible if the current user has the 'superAdmin' role
                'visible' => Yii::$app->user->can('superAdmin'), 'url' => ['/status/index'],
                'options' => ['class' => 'sidebar-item'],
            ], [
                'template' => '<a href="javascript:void(0)" class="sidebar-link has-arrow"  aria-expanded="false">{label}</a>',
                'label' => '<i class="ti ti-mail-forward"></i><span class="hide-menu">Email Template</span>',
                'visible' => Yii::$app->user->can('superAdmin'), 'options' => ['class' => 'sidebar-item'], 'items' => [
                    [
                        'template' => '<a href="{url}" class="sidebar-link" >{label}</a>',
                        'label' => '<div class="round-16 d-flex align-items-center justify-content-center"><i class="ti ti-circle"></i></div><span class="hide-menu text-wrap">Incomplete Application</span>',
                        'url' => '/email-tamplate/view?id=1', 'options' => ['class' => 'sidebar-item'],
                    ], [
                        'template' => '<a href="{url}" class="sidebar-link" >{label}</a>',
                        'label' => '<div class="round-16 d-flex align-items-center justify-content-center"><i class="ti ti-circle"></i></div><span class="hide-menu text-wrap">Application Rejected</span>',
                        'url' => '/email-tamplate/view?id=2', 'options' => ['class' => 'sidebar-item'],
                    ], [
                        'template' => '<a href="{url}" class="sidebar-link" >{label}</a>',
                        'label' => '<div class="round-16 d-flex align-items-center justify-content-center"><i class="ti ti-circle"></i></div><span class="hide-menu text-wrap">Approval process for Inbound</span>',
                        'url' => '/email-tamplate/view?id=3', 'options' => ['class' => 'sidebar-item'],
                    ], [
                        'template' => '<a href="{url}" class="sidebar-link" >{label}</a>',
                        'label' => '<div class="round-16 d-flex align-items-center justify-content-center"><i class="ti ti-circle"></i></div><span class="hide-menu text-wrap">Issue offer letter to applicant</span>',
                        'url' => '/email-tamplate/view?id=4', 'options' => ['class' => 'sidebar-item'],
                    ], [
                        'template' => '<a href="{url}" class="sidebar-link" >{label}</a>',
                        'label' => '<div class="round-16 d-flex align-items-center justify-content-center"><i class="ti ti-circle"></i></div><span class="hide-menu text-wrap">Upload proof of payment</span>',
                        'url' => '/email-tamplate/view?id=5', 'options' => ['class' => 'sidebar-item'],
                    ], [
                        'template' => '<a href="{url}" class="sidebar-link" >{label}</a>',
                        'label' => '<div class="round-16 d-flex align-items-center justify-content-center"><i class="ti ti-circle"></i></div><span class="hide-menu text-wrap">Matriculate applicant and email Pin No to applicant </span>',
                        'url' => '/email-tamplate/view?id=6', 'options' => ['class' => 'sidebar-item'],
                    ], [
                        'template' => '<a href="{url}" class="sidebar-link" >{label}</a>',
                        'label' => '<div class="round-16 d-flex align-items-center justify-content-center"><i class="ti ti-circle"></i></div><span class="hide-menu text-wrap">Approval process for Outbound</span>',
                        'url' => '/email-tamplate/view?id=7 ', 'options' => ['class' => 'sidebar-item'],
                    ], [
                        'template' => '<a href="{url}" class="sidebar-link" >{label}</a>',
                        'label' => '<div class="round-16 d-flex align-items-center justify-content-center"><i class="ti ti-circle"></i></div><span class="hide-menu text-wrap">Upload documents before leaving Malaysia</span>',
                        'url' => '/email-tamplate/view?id=8 ', 'options' => ['class' => 'sidebar-item'],
                    ], [
                        'template' => '<a href="{url}" class="sidebar-link" >{label}</a>',
                        'label' => '<div class="round-16 d-flex align-items-center justify-content-center"><i class="ti ti-circle"></i></div><span class="hide-menu text-wrap">Upload documents before return back to Malaysia</span>',
                        'url' => '/email-tamplate/view?id=9 ', 'options' => ['class' => 'sidebar-item'],
                    ], [
                        'template' => '<a href="{url}" class="sidebar-link" >{label}</a>',
                        'label' => '<div class="round-16 d-flex align-items-center justify-content-center"><i class="ti ti-circle"></i></div><span class="hide-menu text-wrap">Congrats!</span>',
                        'url' => '/email-tamplate/view?id=10 ', 'options' => ['class' => 'sidebar-item'],
                    ], [
                        'template' => '<a href="{url}" class="sidebar-link" >{label}</a>',
                        'label' => '<div class="round-16 d-flex align-items-center justify-content-center"><i class="ti ti-circle"></i></div><span class="hide-menu text-wrap">Reconsideration</span>',
                        'url' => '/email-tamplate/view?id=11 ', 'options' => ['class' => 'sidebar-item'],
                    ],
                ],
            ], [
                'template' => '<a href="{url}" class="sidebar-link" >{label}</a>',
                'label' => '<i class="ti ti-user-plus"></i><span class="hide-menu">Create New Staff</span>',
                'visible' => Yii::$app->user->can('superAdmin'), 'url' => ['/user/index'],
                'options' => ['class' => 'sidebar-item'],
            ],

        ], 'submenuTemplate' => "<ul class='collapse first-level' aria-expanded = 'false'>{items}</ul>",
    ]);
    ?>
    <div class = "d-flex gap-lg-6 align-items-center mb-4">
        <?= Html::beginForm(['/site/logout'], 'post', ['class' => 'd-flex']) ?>
        <?= Html::button('<i class="ti ti-logout fs-7"></i>',
            ['class' => 'btn btn-light logout fs-3', 'type' => 'submit', 'title' => 'Log Out']) ?>
        <?= Html::endForm() ?>
        <p class = "mb-0 border-2 border-dark fw-semibold">Hello <?= Yii::$app->user->identity->username ?></p>
    </div>
</nav>



