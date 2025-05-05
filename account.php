<?php
$page_title = "signin";

include('includes/header.php');

// session_start();

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit();
}

// Fetch user data from database
$user_id = $_SESSION['user_id'];

$sql = "
  SELECT 
    username, 
    email, 
    display_name, 
    location, 
    created_at 
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

<div class="container">
    <h1>User Profile</h1>
    <p><strong>Username:</strong> <?php echo htmlspecialchars($user['username']); ?></p>
    <p><strong>Email:</strong> <?php echo htmlspecialchars($user['email']); ?></p>
    <p><strong>Displayed Name:</strong> <?php echo htmlspecialchars($user['display_name']); ?></p>
    <p><strong>Location:</strong> <?php echo htmlspecialchars($user['location']); ?></p>
    <p><strong>Account Created At:</strong> <?php echo htmlspecialchars($user['created_at']); ?></p>

    <div class="buttons" style="margin-top: 20px;">
        <form action="edit_user.php" method="get" style="display: inline;">
            <button type="submit" class="btn btn-primary">Edit User</button>
        </form>

        <form action="logout.php" method="post" style="display: inline;">
            <button type="submit" class="btn btn-danger">Logout</button>
        </form>
    </div>
</div>
<?php
include('includes/footer.php');
