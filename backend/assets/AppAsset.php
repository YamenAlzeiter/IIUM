<?php

namespace backend\assets;

use yii\web\AssetBundle;

/**
 * Main backend application asset bundle.
 */
class AppAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        'css/site.css',
        'css/styles.scss',
        'css/icons/tabler-icons/tabler-icons.css'
    ];
    public $js = [
        'js/app.min.js',
        'js/dashboard.js',
        'js/sidebarmenu.js',
        'js/form_validation.js',
        'js/filter.js',
        'js/notes.js',
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap5\BootstrapAsset',
    ];
}
