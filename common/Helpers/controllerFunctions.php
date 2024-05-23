<?php

use yii\web\UploadedFile;


function fileHandler($model, $attribute, $fileNamePrefix)
{

    $file = UploadedFile::getInstance($model, $attribute);
    if ($file) {

        $baseUploadPath = Yii::getAlias('@common/uploads');
        $inputName = preg_replace('/[^a-zA-Z0-9]+/', '_', $file->name);
        $creationYearLastTwoDigits = date('y', strtotime(date('Y-m-d H:i:s')));
        $fileName = $creationYearLastTwoDigits.'_'.$model->ID.'_'.$fileNamePrefix.'.'.$file->extension;
        $filePath = $baseUploadPath.'/'.$model->ID.'/'.$fileName;

        // Create directory if not exists
        if (!file_exists(dirname($filePath))) {
            mkdir(dirname($filePath), 0777, true);
        }

        $file->saveAs($filePath);
        $model->$attribute = $fileName;
    }
}
function courseSavor($attributes, $name, $scenario, $isUG)
{
    $allValid = true; // Flag to track if all attributes are valid
    foreach ($attributes as $index => $attribute) {
        $postData = Yii::$app->request->post($name)[$index];
        if (!empty($postData)) {
            $attribute->attributes = $postData;
            // Set the scenario for the model
            if ($isUG) {
                $attribute->scenario = $scenario;
            }

            if (!$attribute->validate()) {
                // Handle validation errors here
                Yii::$app->session->setFlash('error', 'Validation failed for ' . $name);
                $allValid = false; // Set flag to false if any attribute fails validation
            } elseif (!$attribute->save()) {
                Yii::$app->session->setFlash('error', 'Failed to save ' . $name);
                $allValid = false; // Set flag to false if any attribute fails to save
            }

        }
    }
    return $allValid; // Return whether all attributes are valid and saved successfully
}
