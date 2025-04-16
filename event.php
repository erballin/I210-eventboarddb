<?php
$page_title = "Event Details";
include ('includes/header.php');
include ('database.php');
?>

<div class="main">Event Information</div>

<?php
// Check if eventId is in the URL
if (isset($_GET['eventId']) && is_numeric($_GET['eventId'])) {
    $eventId = intval($_GET['eventId']);

    // Prepare and execute query
    $sql = "
        SELECT 
            events.event_id, 
            events.title, 
            events.description, 
            events.location, 
            events.start_time, 
            events.end_time, 
            events.host_id, 
            events.category_id, 
            events.created_at, 
            users.username,
            categories.name AS category_name
            FROM events
            JOIN users ON events.host_id = user_id
            JOIN categories ON events.category_id = categories.category_id
            WHERE events.event_id = ?
    ";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $eventId);
    $stmt->execute();
    $result = $stmt->get_result();

    // Check if event was found
    if ($result && $row = $result->fetch_assoc()) {
        $startDate = strtotime($row['start_time']);
        $endDate = strtotime($row['end_time']);

        echo "<div class='event eventFullSize'>";
        echo "<h1>" . htmlspecialchars($row['title']) . "</h1>";
        echo "<h2>Location: " . htmlspecialchars($row['location']) . "</h2>";
        if (date('Y-m-d', $startDate) === date('Y-m-d', $endDate)) {
            echo '<h2>Time: ' .  date('m/d h:i A', $startDate) . ' - ' .  date('h:i A', $endDate) . '</h2>';
        } else {
            echo '<h2>Time: ' .  date('m/d h:i A', $startDate) . ' - ' .  date('m/d h:i A', $endDate) . '</h2>';
        }
        echo "<h3>Hosted by <a href='user.php?userId=" . htmlspecialchars($row['host_id']) . "'>" . htmlspecialchars($row['username']) . "</a></h3>";
        echo "<p>" . nl2br(htmlspecialchars($row['description'])) . "</p>";
        echo "<h5>Category: " . htmlspecialchars($row['category_name']) . "</h5>";
        echo '<a class="button secondary" href="event_form.php?eventId=' . htmlspecialchars($row['event_id']) . '">Edit</a>';
        echo '<a class="button" href="rsvp.php?eventId=' . htmlspecialchars($row['event_id']) . '">RSVP</a>';
        echo "</div>";
    } else {
        echo "<p>Event not found.</p>";
    }

    $stmt->close();
} else {
    echo "<p>Invalid event ID.</p>";
}

$conn->close();
?>

<?php include ('includes/footer.php'); ?>
