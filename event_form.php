<?php
$page_title = "Create or Edit Event";
include ('includes/header.php');
include ('database.php');

if (!isset($_SESSION['user_id'])) {
    // Redirect to login or show guest view
    echo "No current user found, please log in to edit an event.";
    exit();
}

$isEditing = false;
$event = [
    'title' => '',
    'description' => '',
    'location' => '',
    'start_time' => '',
    'end_time' => '',
    'category_id' => ''
];

if (isset($_GET['eventId']) && is_numeric($_GET['eventId'])) {
    $eventId = intval($_GET['eventId']);
    $isEditing = true;

    $sql = "SELECT * FROM events WHERE event_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $eventId);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result && ($row = $result->fetch_assoc())) {
        if ($_SESSION['user_id'] == $row['host_id']) {
            $event = $row;
        } else {
            echo "<p>You do not have permission to view this event.</p>";
            include('includes/footer.php');
            exit;
        }
    } else {
        echo "<p>Event not found.</p>";
        include('includes/footer.php');
        exit;
    }

    $stmt->close();
}

// Get categories
$categories = [];
$cat_result = $conn->query("SELECT category_id, name FROM categories");
while ($row = $cat_result->fetch_assoc()) {
    $categories[] = $row;
}
?>

<p class="main" style="text-align:center;"><?= $isEditing ? 'Edit Event' : 'Create Event' ?></p>

<form method="post" action="save_event.php" style="max-width: 700px; margin: 0 auto;">
    <?php if ($isEditing): ?>
        <input type="hidden" name="event_id" value="<?= htmlspecialchars($event['event_id']) ?>">
    <?php endif; ?>

    <table class="form-table" style="width: 100%; border-collapse: collapse;">
        <tr>
            <td><label for="title">Title:</label></td>
            <td><input type="text" name="title" id="title"  style="width: 100%;" value="<?= htmlspecialchars($event['title']) ?>"></td>
        </tr>
        <tr>
            <td><label for="description">Description:</label></td>
            <td><textarea name="description" id="description"  rows="4" style="width: 100%; resize: vertical;"><?= htmlspecialchars($event['description']) ?></textarea></td>
        </tr>
        <tr>
            <td><label for="location">Location:</label></td>
            <td><input type="text" name="location" id="location"  style="width: 100%;" value="<?= htmlspecialchars($event['location']) ?>"></td>
        </tr>
        <tr>
            <td><label for="start_time">Start Time:</label></td>
            <td><input type="datetime-local" name="start_time" id="start_time"  style="width: 100%;" value="<?= $event['start_time'] ? date('Y-m-d\TH:i', strtotime($event['start_time'])) : '' ?>"></td>
        </tr>
        <tr>
            <td><label for="end_time">End Time:</label></td>
            <td><input type="datetime-local" name="end_time" id="end_time"  style="width: 100%;" value="<?= $event['end_time'] ? date('Y-m-d\TH:i', strtotime($event['end_time'])) : '' ?>"></td>
        </tr>
        <tr>
            <td><label for="category_id">Category:</label></td>
            <td>
                <select name="category_id" id="category_id"  style="width: 100%;">
                    <option value="">Select a category</option>
                    <?php foreach ($categories as $cat): ?>
                        <option value="<?= $cat['category_id'] ?>" <?= ($event['category_id'] == $cat['category_id']) ? 'selected' : '' ?>>
                            <?= htmlspecialchars($cat['name']) ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </td>
        </tr>
    </table>

    <inline>
    <div style="text-align: center;">
        <button type="submit">
            <?= $isEditing ? 'Update Event' : 'Create Event' ?>
        </button>
    </div>
  </form>
<?php if ($isEditing): ?>

    <form method="post" action="save_event.php" onsubmit="confirm('Are you sure you want to delete this event?');" style="text-align: center; display: inline;">
      
      <div style="text-align: display: inline; center; ">
        <input type="hidden" name="event_id" value="<?= htmlspecialchars($event['event_id']) ?>">
        <input type="hidden" name="action" value="delete">
        <button type="submit" style="display: inline; background-color: #d9534f; border-color: #d9534f;">Delete Event</button>
      </div>
    </form>
  </inline>
<?php endif; ?>

<?php include ('includes/footer.php'); ?>
