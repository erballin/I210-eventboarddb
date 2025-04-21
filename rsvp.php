<?php
session_start();
require_once 'database.php';

if (!isset($_SESSION['user_id'])) {
    die("You must be logged in.");
}

$userId = $_SESSION['user_id'];

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['eventId'], $_POST['action'])) {
    $eventId = intval($_POST['eventId']);
    $action = $_POST['action'];

    if ($action === 'add') {
        $stmt = $conn->prepare("INSERT INTO rsvp (event_id, user_id, response)
                                VALUES (?, ?, 'yes')
                                ON DUPLICATE KEY UPDATE response = 'yes'");
        $stmt->bind_param("ii", $eventId, $userId);
        $stmt->execute();
        $stmt->close();
    } elseif ($action === 'remove') {
        $stmt = $conn->prepare("DELETE FROM rsvp WHERE event_id = ? AND user_id = ?");
        $stmt->bind_param("ii", $eventId, $userId);
        $stmt->execute();
        $stmt->close();
    }

    // Redirect back to the event page
    header("Location: event.php?eventId=$eventId");
    exit;
}
?>
