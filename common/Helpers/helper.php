<?php

use common\models\Countries;
use common\models\Inbound;
use common\models\Outbound;
use common\models\States;
use yii\bootstrap5\Html;

function getStatusFrom($status)
{
    //to do change into table
    switch ($status) {
            //        base application status
        case 10:
        case 51:
        case 55:
        case 81:
            return 'Student';

            //        initial status (IO)
        case 1:
        case 2:
        case 3:
        case 5:
        case 6:
        case 7:
        case 21:
        case 25:
        case 41:
        case 45:
        case 61:
        case 65:
        case 71:
            return 'International Office';

            //         after HOD status
        case 11:
        case 12:
            return 'HOD';

        case 15:
        case 16:
            return 'Kulliyyah';
            //         after dean status
        case 31:
        case 32:
            return 'Dean';

        case 35:
        case 36:
            return 'AMAD/CPS';
        default:

            return 'Unknown Status';
    }
}
function getStatusTo($status)
{
    //to do change into table
    switch ($status) {
            //        base application status
        case 10:
        case 11:
        case 12:
        case 15:
        case 16:
        case 31:
        case 32:
        case 35:
        case 36:
        case 51:
        case 55:
        case 81:
            return 'International Office';


        case 1:
            return 'HOD';
        case 5:
            return 'Kulliyyah';

        case 21:
            return 'Dean';
        case 25:
            return 'AMAD/CPS';


        case 2:
        case 3:
        case 6:
        case 7:
        case 41:
        case 45:
        case 61:
        case 65:
        case 71:
            return 'Student';

        default:
            return 'Unknown Status';
    }
}
function getAnswer($choice)
{
    if ($choice !== null) {
        switch ($choice) {
            case 0:
                return 'No';

            case 1:
                return 'Yes';

            default:
                return 'Not Selected';
        }
    } else
        return 'Not Selected';
}
function getCredit($choice){
    if($choice!=null){
        switch ($choice){
            case 0: return 'Not Credited';
            case 1: return 'Credited';
            default: return 'Not Selected';
        }
    }
}
function getMobilityType($mobilityId){
    if ($mobilityId !== null){
        switch ($mobilityId){
            case 1: return 'Physical';
            case 2: return 'Virtual';
        }
    }
}
function getGenderMeaning($gender)
{
    switch ($gender) {
        case 'M':
            return 'Male';
        case 'F':
            return 'Female';
        default:
            return 'Not selected';
    }
}



function statusFiliter($status){
    switch ($status){
        case 12: return 1;
        case 32: return 21;
        case 16: return 5;
        default: return $status;
    }
}

function statusHelper($status){
    if (in_array($status, [2, 12, 22, 32, 42, 6, 16, 26, 36, 46])) {
        $class = ['badge bg-danger-subtle text-danger fw-semibold fs-3', 'round-8 text-bg-danger rounded-circle d-inline-block me-1'];
    } elseif (in_array($status, [81, 61, 65])) {
        $class = ['badge bg-success-subtle text-success-style2 fw-semibold fs-3', 'round-8 text-bg-success-style2 rounded-circle d-inline-block me-1'];
    } elseif (in_array($status, [1, 21, 41, 71, 5, 25, 45, 75])) {
        $class = ['badge bg-primary-subtle text-primary fw-semibold fs-3', 'round-8 text-bg-primary rounded-circle d-inline-block'];
    } else {
        $class = ['badge bg-warning-subtle text-warning fw-semibold fs-3', 'round-8 text-bg-warning rounded-circle d-inline-block'];
    }
    return $class;

}

function getCount($countType, $year)
{
    if($year === null){
        $year = date('Y');
    }
    switch ($countType) {
        case 'Total':
            return Outbound::find()->where(['and', ['EXTRACT(YEAR FROM created_at)' => $year], ['not', ['Status' => null]]])->count();
        case 'Accepted':
            return Outbound::find()->where(['and', ['EXTRACT(YEAR FROM created_at)' => $year],['Status' => [61,71,81]]])->count();
        case 'Rejected':
            return Outbound::find()->where(['and', ['EXTRACT(YEAR FROM created_at)' => $year],['Status' => [2, 12, 22, 32, 42, 52, 6, 16, 26, 36, 46, 56]]])->count();
        case 'Process':
            return Outbound::find()->where(['and', ['EXTRACT(YEAR FROM created_at)' => $year],['Status' => [3, 1, 10, 11, 21, 31, 41, 51,61,71]]])->count();
        case 'TotalI':
            return Inbound::find()->where(['and', ['EXTRACT(YEAR FROM created_at)' => $year],['not', ['Status' => null]]])->count();
        case 'AcceptedI':
            return Inbound::find()->where(['and', ['EXTRACT(YEAR FROM created_at)' => $year],['Status' => [65]]])->count();
        case 'RejectedI':
            return Inbound::find()->where(['and', ['EXTRACT(YEAR FROM created_at)' => $year],['Status' => [6, 16, 26, 36, 46, 56]]])->count();
        case 'ProcessI':
            return Inbound::find()->where(['and', ['EXTRACT(YEAR FROM created_at)' => $year],['Status' => [7, 10, 5, 15, 25, 35, 45, 55]]])->count();
        default:
            return 0; // Or handle other cases accordingly
    }
}
function getCountry($countryID){
    if (!empty($countryID) && is_numeric($countryID)) {
        $country = Countries::findOne(['id' => $countryID]);
        return $country ? $country->name : 'Country not found';
    } else {
        return 'Invalid country ID';
    }
}
function getState($stateID){
    if (!empty($stateID) && is_numeric($stateID)) {
        $state = States::findOne(['id' => $stateID]);
        return $state ? $state->name : 'State not found';
    } else {
        return 'Invalid state ID';
    }


}

function renderFileField($form, $model, $attribute, $fileName)
{

    if (!isset($noRecord)) {
        $creationYearLastTwoDigits = date('y', strtotime($model->created_at));

        $fileNameMarker = $creationYearLastTwoDigits . '_' . $model->ID;
    }

    echo $form->field($model, $attribute, ['options' => ['style' => 'margin: 0;']])->fileInput([
        'class' => 'form-control mb-2',
        'required' => isFileRequired($model->$attribute),
    ]);

    if ($model->$attribute !== null) {
        $uploadedFile = Html::a($fileNameMarker . "_" . $fileName . ".pdf", [
            'download',
            'id' => $model->ID,
            'file' => $fileNameMarker . '_' . $fileName . '.pdf'
        ]);
        echo "<p class='fw-lighterg'><span class='fw-bolder'>File Uploaded: </span>" . ($model->$attribute ? $uploadedFile : '') . "</p>";
    }
}