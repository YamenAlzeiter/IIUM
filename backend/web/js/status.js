
// Assuming you have a function to get the status badge class
function getStatusBadgeClass($status)
{
    // Implement your logic to determine the badge class based on the status
    // For example purposes, returning a default class if the status is not recognized
    return $status === 'active' ? 'badge-success' : 'badge-secondary';
}

// Function to get the icon class based on the status
function getStatusIconClass($status)
{
    switch ($status) {
        case 'active':
            return 'ti-check';
        case 'inactive':
            return 'ti-close';
        // Add more cases for other statuses as needed
        default:
            return 'ti-help'; // Default icon class for unrecognized statuses
    }
}


