<?php
require_once __DIR__ . '/../Model/db_connection.php';
require_once __DIR__ . '/../Model/staff_mod.php';
require_once __DIR__ . '/../Model/google_config_mod.php';

require 'google_auth.php'; // Ensure Google OAuth

try {
    // Create an instance of the Staff class
   

    // Initialize Google Calendar service
    $client = getGoogleClient();
    if ($client->isAccessTokenExpired()) {
        $client->fetchAccessTokenWithRefreshToken($client->getRefreshToken());
        $_SESSION['access_token'] = $client->getAccessToken();
    }

    $client->setAccessToken($_SESSION['access_token']);
    $service = new Google_Service_Calendar($client);

    // Create a new Google Calendar event
    $event = new Google_Service_Calendar_Event([
        'summary' => $cal_fullname,
        'description' => $cal_description,
        'start' => [
            'dateTime' => $cal_date . 'T09:00:00',
            'timeZone' => 'Asia/Manila',
        ],
        'end' => [
            'dateTime' => $cal_date . 'T10:00:00',
            'timeZone' => 'Asia/Manila',
        ],
    ]);

    // Insert the event into Google Calendar
    $calendarId = 'primary';
    $googleEvent = $service->events->insert($calendarId, $event);

    // Display confirmation
    echo "Event successfully added to Google Calendar with ID: " . $googleEvent->getId();
} catch (PDOException $e) {
    echo "Database Error: " . $e->getMessage();
} catch (Exception $e) {
    echo "Google Calendar Error: " . $e->getMessage();
}
?>