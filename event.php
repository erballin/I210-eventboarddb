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
            categories.name AS category_name,
            rsvp.user_id
        FROM events
        JOIN users ON events.host_id = users.user_id
        JOIN categories ON events.category_id = categories.category_id
        LEFT JOIN rsvp ON events.event_id = rsvp.event_id
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
        echo "<h3>Category: " . htmlspecialchars($row['category_name']) . "</h3>";
        echo "<h3>Hosted by <a href='user.php?userId=" . htmlspecialchars($row['host_id']) . "'>" . htmlspecialchars($row['username']) . "</a></h3>";
        echo "<p style='margin-bottom: 10px;'>" . nl2br(htmlspecialchars($row['description'])) . "</p>";
        if (isset($_SESSION['user_id'])) {
            if($_SESSION['user_id'] == $row['host_id']) {
                echo '<a class="button secondary" href="event_form.php?eventId=' . htmlspecialchars($row['event_id']) . '">Edit</a>';
            } else {
                $userId = $_SESSION['user_id'];

                // Check if the user already RSVP'd
                $rsvpCheck = $conn->prepare("SELECT 1 FROM rsvp WHERE event_id = ? AND user_id = ?");
                $rsvpCheck->bind_param("ii", $eventId, $userId);
                $rsvpCheck->execute();
                $rsvpCheck->store_result();
                $hasRsvped = $rsvpCheck->num_rows > 0;
                $rsvpCheck->close();

                // Create toggle button
                echo '<form method="POST" action="rsvp.php" style="margin-top: 10px;">';
                echo '<input type="hidden" name="eventId" value="' . htmlspecialchars($row['event_id']) . '">';
                echo '<input type="hidden" name="action" value="' . ($hasRsvped ? 'remove' : 'add') . '">';
                echo '<button type="submit">' . ($hasRsvped ? 'UnRSVP' : 'RSVP') . '</button>';
                echo '</form>';

            }
        } else {
            echo '<a class="button" href="signin.php">Log in to RSVP</a>';
        }
        echo "<h3 style='margin-top: 14px'>Event Attendees:</h3>";
        $rsvpQuery = $conn->prepare("
            SELECT users.user_id, users.username
            FROM rsvp
            JOIN users ON rsvp.user_id = users.user_id
            WHERE rsvp.event_id = ?
        ");
        $rsvpQuery->bind_param("i", $row['event_id']);
        $rsvpQuery->execute();
        $rsvpResult = $rsvpQuery->get_result();
        echo "<ul style='list-style: none'>";
        if ($rsvpResult->num_rows > 0) {
            while ($rsvpRow = $rsvpResult->fetch_assoc()) {
                echo "<li><a href='user.php?userId=" . htmlspecialchars($rsvpRow['user_id']) . "'>" . 
                    htmlspecialchars($rsvpRow['username']) . "</a></li>";
            }
        } else {
            echo "<li>No one has RSVP’d yet.</li>";
        }
        echo "</ul>";
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
