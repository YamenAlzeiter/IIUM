<div>
	<div class = "mt-4 brand-logo d-flex align-items-center gap-2">
		<img src="/images/iiumLogo.png" alt="IIUM Logo" class="w-25 h-25">
		<h4 class="mb-0 fw-semibold">IO Dashboard</h4>

	</div>

	<nav class = "sidebar-nav scroll-sidebar" data-simplebar = "">

        <?php

        use yii\bootstrap5\Html;
        use yii\widgets\Menu;

        echo Menu::widget([
            'options' => ['id' => 'sidebarnav'], 'encodeLabels' => false, 'items' => [
                [
                    'label' => '<i class="ti ti-dots nav-small-cap-icon fs-4"></i><span class="hide-menu">Home</span>',
                    'options' => ['class' => 'nav-small-cap'], 'template' => '{label}',
                    // Use a custom template to display the label without the link
                ], [
                    'template' => '<a href="javascript:void(0)" class="sidebar-link has-arrow"  aria-expanded="false">{label}</a>',
                    'label' => '<i class="ti ti-layout-dashboard"></i><span class="hide-menu">Dashboard</span>',
                    'options' => ['class' => 'sidebar-item'],
                    'items' => [
                        [
                            'template' => '<a href="{url}" class="sidebar-link" >{label}</a>',
                            'label' => '<div class="round-16 d-flex align-items-center justify-content-center"><i class="ti ti-circle"></i></div><span class="hide-menu">Outbound Dashboard</span>',
                            'url' => '/site/outbound-dashboard', 'options' => ['class' => 'sidebar-item'],
                        ],
                       [
                            'template' => '<a href="{url}" class="sidebar-link" >{label}</a>',
                            'label' => '<div class="round-16 d-flex align-items-center justify-content-center"><i class="ti ti-circle"></i></div><span class="hide-menu">Inbound Dashboard</span>',
                            'url' => '/site/inbound-dashboard', 'options' => ['class' => 'sidebar-item'],
                        ],

                    ],
                ], [
                    'template' => '<a href="{url}" class="sidebar-link">{label}</a>',
                    'label' => '<i class="ti ti-outbound"></i><span class="hide-menu">Outbound</span>',
                    'url' => ['/outbound/index'], 'options' => ['class' => 'sidebar-item'],
                ], [
                    'template' => '<a href="{url}" class="sidebar-link">{label}</a>',
                    'label' => '<i class="ti ti-arrows-exchange"></i><span class="hide-menu">Inbound</span>',
                    'url' => ['/inbound/index'], 'options' => ['class' => 'sidebar-item'],
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
                    'visible' => Yii::$app->user->can('superAdmin'), 'url' => ['/status/index'],
                    'options' => ['class' => 'sidebar-item'],
                ], [
                    'template' => '<a href="javascript:void(0)" class="sidebar-link has-arrow"  aria-expanded="false">{label}</a>',
                    'label' => '<i class="ti ti-mail-forward"></i><span class="hide-menu">Email Template</span>',
                    'visible' => Yii::$app->user->can('superAdmin'), 'options' => ['class' => 'sidebar-item'],
                    'items' => [
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
                        ],
                        [
                            'template' => '<a href="{url}" class="sidebar-link" >{label}</a>',
                            'label' => '<div class="round-16 d-flex align-items-center justify-content-center"><i class="ti ti-circle"></i></div><span class="hide-menu text-wrap">Upload documents before leaving Malaysia</span>',
                            'url' => '/email-tamplate/view?id=8 ', 'options' => ['class' => 'sidebar-item'],
                        ],
                        [
                            'template' => '<a href="{url}" class="sidebar-link" >{label}</a>',
                            'label' => '<div class="round-16 d-flex align-items-center justify-content-center"><i class="ti ti-circle"></i></div><span class="hide-menu text-wrap">Upload documents before return back to Malaysia</span>',
                            'url' => '/email-tamplate/view?id=9 ', 'options' => ['class' => 'sidebar-item'],
                        ],[
                            'template' => '<a href="{url}" class="sidebar-link" >{label}</a>',
                            'label' => '<div class="round-16 d-flex align-items-center justify-content-center"><i class="ti ti-circle"></i></div><span class="hide-menu text-wrap">Congrats!</span>',
                            'url' => '/email-tamplate/view?id=10 ', 'options' => ['class' => 'sidebar-item'],
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
<div class="d-flex gap-lg-6 align-items-center mb-4">
    <?= Html::beginForm(['/site/logout'], 'post', ['class' => 'd-flex']) ?>
    <?= Html::button(
        '<i class="ti ti-logout fs-7"></i>',
        ['class' => 'btn btn-light logout fs-3', 'type' => 'submit', 'title' => 'Log Out']
    ) ?>
    <?= Html::endForm() ?>
	<p class="mb-0 border-2 border-dark fw-semibold">Hello <?= Yii::$app->user->identity->username?></p>
</div>



	</nav>


</div>
