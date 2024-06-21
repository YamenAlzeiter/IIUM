<?php

namespace backend\assets;

use yii\web\AssetBundle;

/**
 * Main backend application asset bundle.
 */
class AppAsset extends AssetBundle
{
// Adjust the JS file paths

    public $css = [
        'https://style.iium.edu.my/css/style.css',
        'css/site.css',
        'css/styles.css',
        'css/icons/tabler-icons/tabler-icons.css',
//        'css/test.css',
    ];
    public $js = [
//        'js/app.min.js',
        'js/counter.js',
        'js/insertButtons.js',
        'js/notes.js',
        'js/sidebarmenu.js',
        'js/sweet-alert.js',
        'js/actionManipulationView.js',
        'js/form-logic.js',
        'js/global.js'
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap5\BootstrapAsset',
    ];
    public $images = [
        'images\iiumLogo.png',
    ];
}
