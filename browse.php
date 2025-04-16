<?php
$page_title = "Browse";

include ('includes/header.php');
?>

<?php include 'database.php'; ?>


<div class="main">Browse Events</div>

<p>Stay caught up to date with the latest events.</p>
<div class="inputBar">
  <input type="text" placeholder="Title">
  <select name="Category" id="categorySelect" aria-placeholder="Category">
    <option value="none" selected>Category</option>
    <?php 
    // Query to get all category names
      $sql = "SELECT name AS category_name FROM categories";
      $result = $conn->query($sql);

      // Check for query errors
      if (!$result) {
          die("Error retrieving categories: " . $conn->error);
      }

      // Populate category options
      while ($row = $result->fetch_assoc()) {
          echo '<option value="' . htmlspecialchars($row['category_name']) . '">' . htmlspecialchars($row['category_name']) . '</option>';
      }
    ?>
    <option value="Gaming">Gaming</option>
  </select>
</div>

<div class="eventBoard">
  <?php
  // Query to get all events
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
    ";
  $result = $conn->query($sql);

  // Check for query errors
  if (!$result) {
      die("Error retrieving events: " . $conn->error);
  }

  
  // Loop through and display events
  while ($row = $result->fetch_assoc()) {
    $startDate=strtotime($row['start_time']);
    $endDate=strtotime($row['end_time']);
    echo "<div class='event'>";
    echo '<h1><a href="event.php?eventId=' . htmlspecialchars($row['event_id']) . '">' . htmlspecialchars($row['title']) . '</a></h1>';
    echo '<h2>Location: ' . htmlspecialchars($row['location']) . '</h2>';
    if (date('Y-m-d', $startDate) === date('Y-m-d', $endDate)) {
        echo '<h2>Time: ' .  date('m/d h:iA', $startDate) . ' - ' .  date('h:iA', $endDate) . '</h2>';
    } else {
        echo '<h2>Time: ' .  date('m/d h:iA', $startDate) . ' - ' .  date('m/d h:iA', $endDate) . '</h2>';
    }
    echo '<h3>Hosted by <a href="user.php?userId=' . htmlspecialchars($row['host_id']) . '">'.htmlspecialchars($row['username']).'</a></h3>';
    echo "<p>".htmlspecialchars($row['description'])."</p>";
    echo "<h5>Category: ". htmlspecialchars($row['category_name']) ."</h5>";
    echo "</div>";
  }

        $conn->close();
  ?>
</div>

<?php
include ('includes/footer.php');