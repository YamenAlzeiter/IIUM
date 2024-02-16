<?php

namespace common\widgets;

use yii\base\Widget;
use yii\helpers\Html;

class tableMakerWidget extends Widget
{
    public $tableId;
    public $tableData;
    public $modelName;

    public function run()
    {
        return $this->renderTable();
    }

    private function renderTable()
    {
        $content = '<table class="table" id="' . $this->tableId . '">';
        $content .= '<thead>';
        $content .= '<tr>';
        $content .= '<th style="width: 30%">Course Code</th>';
        $content .= '<th style="width: 50%">Course Name</th>';
        $content .= '<th style="width: 20%">Credit Hours</th>';
        $content .= '</tr>';
        $content .= '</thead>';
        $content .= '<tbody>';

        for ($i = 0; $i < 7; $i++) {
            $content .= '<tr>';
            $content .= '<td class="py-2 px-1">';
            $content .= Html::hiddenInput("{$this->modelName}[{$i}][id]", isset($this->tableData[$i]['id']) ? $this->tableData[$i]['id'] : '');
            $content .= Html::textInput("{$this->modelName}[{$i}][course_code]", isset($this->tableData[$i]['course_code']) ? $this->tableData[$i]['course_code'] : '', ['class' => 'form-control', 'placeholder' => 'Course Code']);
            $content .= '</td>';
            $content .= '<td class="py-2 px-1">';
            $content .= Html::textInput("{$this->modelName}[{$i}][course_name]", isset($this->tableData[$i]['course_name']) ? $this->tableData[$i]['course_name'] : '', ['class' => 'form-control', 'placeholder' => 'Course Name']);
            $content .= '</td>';
            $content .= '<td class="py-2 px-1">';
            $content .= Html::textInput("{$this->modelName}[{$i}][credit_hours]", isset($this->tableData[$i]['credit_hours']) ? $this->tableData[$i]['credit_hours'] : '', ['class' => 'form-control', 'placeholder' => 'Credit Hours']);
            $content .= '</td>';
            $content .= '</tr>';
        }

        $content .= '</tbody>';
        $content .= '</table>';

        return $content;
    }
}
