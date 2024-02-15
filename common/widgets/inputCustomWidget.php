<?php

namespace common\widgets;

use yii\base\Widget;

class inputCustomWidget extends Widget
{
    public $label;
    public $id;
    public $value;
    public $name;
    public $inputType;
    public $options = [];
    public $legend;
    public $length;
    public $required;
    public  $minDate;
    public $type;
    public $selectOption;
    public function run()
    {
        switch ($this->inputType){
            case 'input':    return $this->renderInput();
            case 'radio':    return $this->renderRadioButtons();
            case 'dropdown': return $this->renderDropDownMenu();
            default: return $this->renderInput();
        }
    }

    protected function renderInput()
    {
        $currentDateAttribute = $this->minDate ? 'min="' . date('Y-m-d') . '"' : '';
        return <<<HTML
<div class="form__div">
    <input type="{$this->inputType}" class="form__input form-control"
           id="{$this->id}"
           name="{$this->name}"
           maxlength="{$this->length}" placeholder=" " value="{$this->value}" {$this->required} {$currentDateAttribute}>
    <label for="{$this->id}" class="form__label">{$this->label}</label>
</div>
HTML;
    }

    protected function renderRadioButtons()
    {
        $html = '<div class="row-md-6 mb-2">';
        $html .= '<legend class="col-form-label col-sm-3 pt-0">' . $this->legend . '</legend>';

        foreach ($this->options as $option => $label) {
            $checked = ($this->value === $option) ? 'checked' : '';
            $html .= "<div class='form-check form-check-inline'>";
            $html .= "<input id='{$option}' type='radio' name='{$this->name}' value='{$option}' class='form-check-input' {$checked} {$this->required}>";
            $html .= "<label for='{$option}' class='form-check-label'>{$label}</label>";
            $html .= "</div>";
        }

        $html .= '</div>';

        return $html;
    }

    protected function renderDropDownMenu()
    {
      $html = '<div class="form__div">';
      $html .= "<select class='form__input form-control' id = '{$this->id}' name = '{$this->name}' {$this->required}>
                <option>{$this->selectOption}</option>";

      foreach($this->options as $option => $label){
        $selected = ($this->value === $option)? 'selected' : '';
        $html .= "<option value='{$option}' {$selected}>{$label}</option>";
      }
      $html .= "</select>
                <label for = 'Academic_current_year' class = 'form__label'>{$this->label}</label>
                </div>";

      return $html;

    }
}
