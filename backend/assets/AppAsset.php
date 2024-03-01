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
        'js/counter.js',
        'js/insertButtons.js',
        'js/notes.js',
        'js/sidebarmenu.js',
        'js/sweet-alert.js',
        'js/actionManipulationView.js',
        'js/form-logic.js',
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap5\BootstrapAsset',
    ];
    public $images = [
        'images\iiumLogo.png',
    ];
}
