<?php

namespace frontend\assets;

use yii\web\AssetBundle;

/**
 * Main frontend application asset bundle.
 */
class AppAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        'css/site.css',
        'css/styles.css',
        'css/icons/tabler-icons/tabler-icons.css'
    ];
    public $js = [
        'js/form-wizard.js',
        'js/region.js',
        'js/notes.js',
        'js/password-toggler.js',
        'js/form-logic.js'
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap5\BootstrapAsset',
    ];
}
