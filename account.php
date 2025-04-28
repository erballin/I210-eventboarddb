<?php
$page_title = "account";

include ('includes/header.php');

session_start();

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit();
}

// Fetch user data from database
$user_id = $_SESSION['user_id'];

$stmt = $pdo->prepare('SELECT user_name, user_email, display_name, location, created_at FROM users WHERE id = :id');
$stmt->execute(['id' => $user_id]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$user) {
    echo "User not found.";
    exit();
}
?>

    <div class="container">
        <h1>User Profile</h1>
        <p><strong>Username:</strong> <?php echo htmlspecialchars($user['user_name']); ?></p>
        <p><strong>Email:</strong> <?php echo htmlspecialchars($user['user_email']); ?></p>
        <p><strong>Displayed Name:</strong> <?php echo htmlspecialchars($user['display_name']); ?></p>
        <p><strong>Location:</strong> <?php echo htmlspecialchars($user['location']); ?></p>
        <p><strong>Account Created At:</strong> <?php echo htmlspecialchars($user['created_at']); ?></p>

        <div class="buttons" style="margin-top: 20px;">
            <form action="edituser.php" method="get" style="display: inline;">
                <button type="submit" class="btn btn-primary">Edit User</button>
            </form>

            <form action="logout.php" method="post" style="display: inline;">
                <button type="submit" class="btn btn-danger">Logout</button>
            </form>
        </div>
    </div>
<?php
include ('includes/footer.php');