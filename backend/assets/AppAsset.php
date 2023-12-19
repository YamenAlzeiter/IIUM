<?php

namespace backend\assets;

use yii\web\AssetBundle;

/**
 * Main backend application asset bundle.
 */
class AppAsset extends AssetBundle
{
    public $css = [
        'css/site.css',
        'css/styles.css', // Compiled from styles.scss
        'css/icons/tabler-icons/tabler-icons.css'
    ];

// Adjust the JS file paths
    public $js = [
        'js/app.min.js',
        'js/dashboard.js',
        'js/sidebarmenu.js',
        'js/form_validation.js',
        'js/filter.js',
        'js/notes.js',
        'js/insertButtons.js',
        'js/counter.js',
        'js/charts.js',
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap5\BootstrapAsset',
    ];
}
