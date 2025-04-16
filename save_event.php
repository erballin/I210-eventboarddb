<?php
include('database.php');

if (!isset($_SESSION['user_id'])) {
    // Redirect to login or show guest view
    echo "NO CURRENT USER LOGGED IN...";
    exit();
}

// Handle deletion first
if (isset($_POST['action']) && $_POST['action'] === 'delete' && isset($_POST['event_id'])) {
    $event_id = intval($_POST['event_id']);

    $stmt = $conn->prepare("DELETE FROM events WHERE event_id = ?");
    $stmt->bind_param("i", $event_id);

    if ($stmt->execute()) {
        header("Location: index.php");
        exit;
    } else {
        echo "Error deleting event: " . $stmt->error;
    }

    $stmt->close();
    $conn->close();
    exit;
}

// Get form data
$title = $_POST['title'] ?? '';
$description = $_POST['description'] ?? '';
$location = $_POST['location'] ?? '';
$start_time = $_POST['start_time'] ?? '';
$end_time = $_POST['end_time'] ?? '';
$category_id = isset($_POST['category_id']) && is_numeric($_POST['category_id']) ? intval($_POST['category_id']) : 0;

$event_id = $_POST['event_id'] ?? '';
$host_id = $_SESSION['user_id'];

if (!empty($event_id)) {
    // Editing
    $event_id = intval($event_id);
    $sql = "
        UPDATE events SET
            title = ?, description = ?, location = ?, start_time = ?, end_time = ?, category_id = ?
        WHERE event_id = ?
    ";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssssssi", $title, $description, $location, $start_time, $end_time, $category_id, $event_id);
} else {
    // Creating
    $sql = "
        INSERT INTO events (title, description, location, start_time, end_time, host_id, category_id)
        VALUES (?, ?, ?, ?, ?, ?, ?)
    ";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssssssi", $title, $description, $location, $start_time, $end_time, $host_id, $category_id);
}

// Execute insert or update
if ($stmt->execute()) {
    if (empty($event_id)) {
        // Just created, get the new ID
        $event_id = $stmt->insert_id;
    }

    header("Location: event.php?eventId=" . $event_id);
    exit;
} else {
    echo "Error saving event: " . $stmt->error;
}

$stmt->close();
$conn->close();
