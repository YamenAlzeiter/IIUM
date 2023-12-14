<?php
function getStatusMeaning($status)
{
    //to do change into table
    switch ($status) {
//        base application status
        case 10:
            return 'IP New application';

//        initial status (IO)
        case 1:
            return 'Accepted (Initial)';
        case 2:
            return 'Rejected';
        case 3:
            return 'Not Complete Documents';

//         after HOD status
        case 11:
            return 'Accepted from HOD';
        case 12:
            return 'Rejected from HOD';

//         status IO second
        case 21:
            return 'Accept HOD Acceptance';
        case 22:
            return 'Reject HOD Acceptance';

//         after dean status
        case 31:
            return 'Accepted from Dean side';
        case 32:
            return 'Rejected from Dean side';

//         status IO third (last)
        case 41:
            return 'Accepted';
        case 42:
            return 'Reject Dean Acceptance';
            
        default:
            return 'Unknown Status';
    }
}
function getStatusFrom($status)
{
    //to do change into table
    switch ($status) {
//        base application status
        case 10:
        case 51:
        case 55:
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
            return 'International Office';



        case 1: return 'HOD';
        case 5: return 'Kulliyyah';

        case 21: return 'Dean';
        case 25: return 'AMAD/CPS';

        case 2:
        case 3:
        case 6:
        case 7:
        case 41:
        case 61:
            return 'Student';

        default:
            return 'Unknown Status';
    }
}

function getAnswer($choice){
if ($choice !== null){
    switch ($choice){
        case 0:
            return 'No';

        case 1:
            return 'Yes';

        default:
            return 'Not Selected';
    }
}
else
    return 'Not Selected';
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
function getStatusBadgeClass($status)
{
    if ($status == 2 || $status == 12 || $status == 22 || $status == 32 || $status == 42) {
        return 'bg-danger';
    } elseif ($status == 61) {
        return 'bg-success';
    } else {
        return 'bg-warning';
    }
}
function getStatusIconClass($status){
    if ($status == 2 || $status == 12 || $status == 22 || $status == 32 || $status == 42) {
        return 'text-danger';
    } elseif ($status == 61) {
        return 'text-success';
    } else {
        return 'text-warning';
    }
}