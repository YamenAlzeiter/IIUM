<?php
namespace common\widgets;

use yii\base\Widget;
use yii\helpers\Html;

class DownloadLinkWidget extends Widget
{
    public $model;
    public $attribute;
    public $fileName;
    public $text;

    public function run()
    {
        $creationYearLastTwoDigits = date('y', strtotime($this->model->created_at));
        $starterName = $creationYearLastTwoDigits.'_'.$this->model->ID;
        
            return Html::tag('p', Html::a($this->text, [
                'download', 'id' => $this->model->ID, 'file' => $starterName.'_'.$this->fileName.'.pdf'
            ],[
                'class' => 'download', 'id' => 'download'
            ]), ['class' => 'fw-semibold ']
            );
    }

}