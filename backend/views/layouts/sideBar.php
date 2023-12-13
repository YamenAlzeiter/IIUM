<div>
	<div class="brand-logo d-flex align-items-center justify-content-between">
		<h1>IIUM LOGO</h1>
		<div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
			<i class="ti ti-x fs-8"></i>
		</div>
	</div>

	<nav class = "sidebar-nav scroll-sidebar" data-simplebar = "">

        <?php

        use yii\bootstrap5\Html;
        use yii\widgets\Menu;

        echo Menu::widget([
            'options' => ['id' => 'sidebarnav'], 'encodeLabels' => false, 'items' => [
                [
                    'label' => '<i class="ti ti-dots nav-small-cap-icon fs-4"></i><span class="hide-menu">Home</span>',
                    'options' => ['class' => 'nav-small-cap'],
                    'template' => '{label}', // Use a custom template to display the label without the link
                ],
                [
                    'template' => '<a href="{url}" class="sidebar-link">{label}</a>',
                    'label' => '<i class="ti ti-layout-dashboard"></i><span class="hide-menu">Dashboard</span>',
                    'url' => ['/site/index'],
                    'options' => ['class' => 'sidebar-item'],
                ], [
                    'template' => '<a href="{url}" class="sidebar-link">{label}</a>',
                    'label' => '<i class="ti ti-outbound"></i><span class="hide-menu">Outbound</span>',
                    'url' => ['/outbound/index'],
                    'options' => ['class' => 'sidebar-item'],
                ], [
                    'template' => '<a href="{url}" class="sidebar-link">{label}</a>',
                    'label' => '<i class="ti ti-arrows-exchange"></i><span class="hide-menu">Inbound</span>',
                    'url' => ['/inbound/index'],
                    'options' => ['class' => 'sidebar-item'],
                ],
                [
                    'label' => '<i class="ti ti-dots nav-small-cap-icon fs-4"></i><span class="hide-menu">Admin</span>',
                    'options' => ['class' => 'nav-small-cap'],
                    'template' => '{label}', // Use a custom template to display the label without the link
                ],
                [
                    'template' => '<a href="{url}" class="sidebar-link">{label}</a>',
                    'label' => '<i class="ti ti-user"></i><span class="hide-menu">Person In Charge</span>',
                    'url' => ['/poc/index'],
                    'options' => ['class' => 'sidebar-item'],
                ],
                [
                    'template' => '<a href="{url}" class="sidebar-link" >{label}</a>',
                    'label' => '<i class="ti ti-status-change"></i><span class="hide-menu">Status</span>',
                    'visible' => Yii::$app->user->can('superAdmin'),
                    'url' => ['/status/index'],
                    'options' => ['class' => 'sidebar-item'],
                ],
                [
                    'template' => '<a href="javascript:void(0)" class="sidebar-link has-arrow"  aria-expanded="false">{label}</a>',
                    'label' => '<i class="ti ti-mail-forward"></i><span class="hide-menu">Email Template</span>',
                    'visible' => Yii::$app->user->can('superAdmin'),
                    'options' => ['class' => 'sidebar-item'],
                    'items' => [
                        [
                            'template' => '<a href="{url}" class="sidebar-link" >{label}</a>',
                            'label' => '<div class="round-16 d-flex align-items-center justify-content-center"><i class="ti ti-circle"></i></div><span class="hide-menu">Email to Higher</span>',
                            'url' => '/email-tamplate/view?id=1',
                            'options' => ['class' => 'sidebar-item'],
                        ],
                        [
                            'template' => '<a href="{url}" class="sidebar-link" >{label}</a>',
                            'label' => '<div class="round-16 d-flex align-items-center justify-content-center"><i class="ti ti-circle"></i></div><span class="hide-menu">Email to Higher (Redirect)</span>',
                            'url' => '/email-tamplate/view?id=2',
                            'options' => ['class' => 'sidebar-item'],
                        ],
                        [
                            'template' => '<a href="{url}" class="sidebar-link" >{label}</a>',
                            'label' => '<div class="round-16 d-flex align-items-center justify-content-center"><i class="ti ti-circle"></i></div><span class="hide-menu">Application not Complete</span>',
                            'url' => '/email-tamplate/view?id=3',
                            'options' => ['class' => 'sidebar-item'],
                        ],
                        [
                            'template' => '<a href="{url}" class="sidebar-link" >{label}</a>',
                            'label' => '<div class="round-16 d-flex align-items-center justify-content-center"><i class="ti ti-circle"></i></div><span class="hide-menu">Application Rejected</span>',
                            'url' => '/email-tamplate/view?id=4',
                            'options' => ['class' => 'sidebar-item'],
                        ],
                        [
                            'template' => '<a href="{url}" class="sidebar-link" >{label}</a>',
                            'label' => '<div class="round-16 d-flex align-items-center justify-content-center"><i class="ti ti-circle"></i></div><span class="hide-menu">Upload Before Leave</span>',
                            'url' => '/email-tamplate/view?id=5',
                            'options' => ['class' => 'sidebar-item'],
                        ],
                        [
                            'template' => '<a href="{url}" class="sidebar-link" >{label}</a>',
                            'label' => '<div class="round-16 d-flex align-items-center justify-content-center"><i class="ti ti-circle"></i></div><span class="hide-menu">Accept</span>',
                            'url' => '/email-tamplate/view?id=6',
                            'options' => ['class' => 'sidebar-item'],
                        ],
                        [
                            'template' => '<a href="{url}" class="sidebar-link" >{label}</a>',
                            'label' => '<div class="round-16 d-flex align-items-center justify-content-center"><i class="ti ti-circle"></i></div><span class="hide-menu">Upload Files Before Comeback</span>',
                            'url' => '/email-tamplate/view?id=7 ',
                            'options' => ['class' => 'sidebar-item'],
                        ],
                    ],
                ],
                [
                    'template' => '<a href="{url}" class="sidebar-link" >{label}</a>',
                    'label' => '<i class="ti ti-user-plus"></i><span class="hide-menu">Create New Staff</span>',
                    'visible' => Yii::$app->user->can('superAdmin'),
                    'url' => ['/user/index'],
                    'options' => ['class' => 'sidebar-item'],
                ],

            ],
            'submenuTemplate' => "<ul class='collapse first-level' aria-expanded = 'false'>{items}</ul>",
        ]);
        ?>

        <?= Html::beginForm(['/site/logout'], 'post', ['class' => 'd-flex']) ?>
        <?= Html::button(
            '<i class="ti ti-logout"></i><span class="hide-menu">Logout</span>',
            ['class' => 'btn btn-link logout text-decoration-none', 'type' => 'submit']
        ) ?>
        <?= Html::endForm() ?>


	</nav>




</div>
