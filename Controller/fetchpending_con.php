<?php
require_once __DIR__ . '/../Model/staff_mod.php';
require_once __DIR__ .'/../Model/db_connection.php';
session_start();
$email = $_SESSION['email'];
$nme = $_SESSION['fullname'];
error_reporting(0); // Disable all error reporting

// Alternatively, if you only want to hide errors but log them
error_reporting(E_ALL); // Report all errors
ini_set('display_errors', '0'); // Hide errors from displaying on the page
ini_set('log_errors', '1'); // Enable error logging
ini_set('error_log', 'error.log'); // Specify the path to the error log file

$staff = new Staff($conn);

// Retrieve the pending item based on the ID from the URL
$pendingItem = null;
$eventName = '';
if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $pendingItems = $staff->getPendingCitizen();

    // Find the specific item with the provided ID
    foreach ($pendingItems as $item) {
        if ($item['id'] == $id) {
            $pendingItem = $item;
            $eventName = $item['event_name'];
            break;
        }
    }
}
$declineReason = isset($pendingItem['reason']) ? ($pendingItem['reason']) : '';
$event_name = isset($pendingItem['event_name']) ? ($pendingItem['event_name']) : '';
$Priest = isset($pendingItem['Priest']) ? ($pendingItem['Priest']) : '';
$Pending = isset($pendingItem['priest_status']) ? ($pendingItem['priest_status']) : '';
$citizend_id = isset($pendingItem['citizend_id']) ? ($pendingItem['citizend_id']) : '';
// Initialize variables common to all events
$date = isset($pendingItem['schedule_date']) ? date(($pendingItem['schedule_date'])) : '';
$startTime = isset($pendingItem['schedule_start_time']) ? date('h:i A', strtotime($pendingItem['schedule_start_time'])) : '';
$endTime = isset($pendingItem['schedule_end_time']) ? date('h:i A', strtotime($pendingItem['schedule_end_time'])) : '';

// Initialize date variables
$dateOfBirth = '';
$pbirth = '';
switch ($eventName) {
    case 'Baptism':
        $dateOfBirth = $pendingItem['c_date_birth'] ?? '';
        break;
    case 'Confirmation':
        $dateOfBirth = $pendingItem['c_date_birth'] ?? '';
        $pbirth = $pendingItem['date_of_baptism'] ?? '';
        break;
    case 'Funeral':
        $dateOfBirth = $pendingItem['date_of_birth'] ?? '';
        $pbirth = $pendingItem['date_of_death'] ?? '';
        break;
    case 'Wedding':
        $dateOfBirth = $pendingItem['groom_dob'] ?? '';
        $pbirth = $pendingItem['bride_dob'] ?? '';
        break;
}

// Convert dates to day, month, and year components
$year = $month = $day = '';
if ($dateOfBirth) {
    list($year, $month, $day) = explode('-', $dateOfBirth);
}
$monthName = $month ? DateTime::createFromFormat('!m', $month)->format('F') : '';

$years = $months = $days = '';
if ($pbirth) {
    list($years, $months, $days) = explode('-', $pbirth);
}
$monthNames = $months ? DateTime::createFromFormat('!m', $months)->format('F') : '';

// Function to clean and split names
function cleanName($name) {
    return trim(preg_replace('/\s+/', ' ', $name)); // Remove extra spaces
}

// Handle names based on the event
$firstname = $middlename = $lastname = '';
$firstnames = $middlenames = $lastnames = '';
$fullname = ''; 
switch ($eventName) {
    case 'Baptism':
        $fullname = cleanName($pendingItem['citizen_name'] ?? '');
        break;
    case 'Confirmation':
        $fullname = cleanName($pendingItem['citizen_name'] ?? '');
        break;
    case 'Funeral':
        $fullname = cleanName($pendingItem['d_fullname'] ?? '');
        break;
    case 'Wedding':
        $groom_name = cleanName($pendingItem['groom_name'] ?? '');
        $bride_name = cleanName($pendingItem['bride_name'] ?? '');
        break;
}

// Split names into first, middle, and last components
$names = explode(' ', $fullname);
if (count($names) >= 3) {
    $firstname = implode(' ', array_slice($names, 0, -2));
    $middlename = $names[count($names) - 2];
    $lastname = $names[count($names) - 1];
} elseif (count($names) === 2) {
    $firstname = $names[0];
    $lastname = $names[1];
} else {
    $firstname = $names[0];
}

// Handle wedding names separately
if ($eventName === 'Wedding') {
    $groomNames = explode(' ', $groom_name);
    $brideNames = explode(' ', $bride_name);

    if (count($groomNames) >= 3) {
        $firstname = implode(' ', array_slice($groomNames, 0, -2));
        $middlename = $groomNames[count($groomNames) - 2];
        $lastname = $groomNames[count($groomNames) - 1];
    } elseif (count($groomNames) === 2) {
        $firstname = $groomNames[0];
        $lastname = $groomNames[1];
    } else {
        $firstname = $groomNames[0];
    }

    if (count($brideNames) >= 3) {
        $firstnames = $brideNames[0];
        $middlenames = $brideNames[1];
        $lastnames = $brideNames[count($brideNames) - 1];
    }  elseif (count($brideNames) === 2) {
        $firstnames = $brideNames[0];
        $lastnames = $brideNames[1];
    } else {
        $firstnames = $brideNames[0];
    }
}
?>