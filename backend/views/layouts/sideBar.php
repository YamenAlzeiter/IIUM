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
                    'visible' => Yii::$app->user->can('superAdmin'),
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
                    'template' => '<a href="{url}" class="sidebar-link">{label}</a>',
                    'label' => '<i class="ti ti-user"></i><span class="hide-menu">Person In Charge</span>',
                    'url' => ['/poc/index'],
                    'options' => ['class' => 'sidebar-item'],
                ],
                // Add more sidebar items as needed
            ],
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
