<?php
$page_title = "User Profile";

include('includes/header.php');

$user_id = null;
// session_start();
if (!isset($_GET['userId']) && is_numeric($_GET['userId'])) {
    echo "Invalid user ID.";
    exit();
}
$user_id = intval($_GET['userId']);

$sql = "
  SELECT 
    username, 
    email, 
    display_name, 
    location, 
    created_at,
    user_id
  FROM users 
  WHERE user_id = $user_id
";
$result = $conn->query($sql);

if ($result && $result->num_rows > 0) {
    $user = $result->fetch_assoc();
} else {
    echo "User not found.";
    exit();
}
?>

<h1>User Profile</h1>
<p><strong>Username:</strong> <?php echo htmlspecialchars($user['username']); ?></p>
<p><strong>Email:</strong> <?php echo htmlspecialchars($user['email']); ?></p>
<p><strong>Displayed Name:</strong> <?php echo htmlspecialchars($user['display_name']); ?></p>
<p><strong>Location:</strong> <?php echo htmlspecialchars($user['location']); ?></p>
<p><strong>Account Created At:</strong> <?php echo htmlspecialchars($user['created_at']); ?></p>

<?php
if (isset($_SESSION['user_id']) && $_SESSION['user_id'] == $user['user_id']) {
    echo '<div style="margin-top: 20px;">
        <form action="edit_user.php" method="get" style="display: inline;">
            <button type="submit" class="btn btn-primary">Edit User</button>
        </form>

        <form action="logout.php" method="post" style="display: inline;">
            <button type="submit" class="btn btn-danger">Logout</button>
        </form>
    </div>';
}
?>

</div>
<?php
include('includes/footer.php');
