<?php
// Include database connection
include 'database.php';

// Start the session
session_start();

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit();
}

$user_id = $_SESSION['user_id'];

// If the form is submitted
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Get submitted form data
    $user_name = trim($_POST['user_name']);
    $user_email = trim($_POST['user_email']);
    $password = trim($_POST['password']);
    $display_name = trim($_POST['display_name']);
    $location = trim($_POST['location']);

    // Validate fields (you can add more validation if needed)
    if (empty($user_name) || empty($user_email) || empty($display_name)) {
        $error = "Username, Email, and Display Name are required.";
    } else {
        // If password is provided, hash it
        if (!empty($password)) {
            $hashed_password = password_hash($password, PASSWORD_DEFAULT);
            $stmt = $pdo->prepare('UPDATE users SET user_name = :user_name, user_email = :user_email, password = :password, display_name = :display_name, location = :location WHERE id = :id');
            $stmt->execute([
                'user_name' => $user_name,
                'user_email' => $user_email,
                'password' => $hashed_password,
                'display_name' => $display_name,
                'location' => $location,
                'id' => $user_id
            ]);
        } else {
            // Update without changing the password
            $stmt = $pdo->prepare('UPDATE users SET user_name = :user_name, user_email = :user_email, display_name = :display_name, location = :location WHERE id = :id');
            $stmt->execute([
                'user_name' => $user_name,
                'user_email' => $user_email,
                'display_name' => $display_name,
                'location' => $location,
                'id' => $user_id
            ]);
        }

        // Redirect back to profile page after update
        header('Location: user_profile.php');
        exit();
    }
}

// Fetch current user data
$stmt = $pdo->prepare('SELECT user_name, user_email, display_name, location FROM users WHERE id = :id');
$stmt->execute(['id' => $user_id]);
$user = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$user) {
    echo "User not found.";
    exit();
}

// Include header
include 'includes/header.php';
?>

<div class="container">
    <h1>Edit Profile</h1>

    <?php if (isset($error)): ?>
        <div class="alert alert-danger"><?php echo htmlspecialchars($error); ?></div>
    <?php endif; ?>

    <form method="post" action="edituser.php">
        <div class="form-group">
            <label for="user_name">Username:</label>
            <input type="text" id="user_name" name="user_name" class="form-control" value="<?php echo htmlspecialchars($user['user_name']); ?>" required>
        </div>

        <div class="form-group">
            <label for="user_email">Email:</label>
            <input type="email" id="user_email" name="user_email" class="form-control" value="<?php echo htmlspecialchars($user['user_email']); ?>" required>
        </div>

        <div class="form-group">
            <label for="password">New Password (leave blank to keep current password):</label>
            <input type="password" id="password" name="password" class="form-control">
        </div>

        <div class="form-group">
            <label for="display_name">Display Name:</label>
            <input type="text" id="display_name" name="display_name" class="form-control" value="<?php echo htmlspecialchars($user['display_name']); ?>" required>
        </div>

        <div class="form-group">
            <label for="location">Location:</label>
            <input type="text" id="location" name="location" class="form-control" value="<?php echo htmlspecialchars($user['location']); ?>">
        </div>

        <button type="submit" class="btn btn-success" style="margin-top: 15px;">Save Changes</button>
        <a href="user.php" class="btn btn-secondary" style="margin-top: 15px;">Cancel</a>
    </form>
</div>

<?php
// Include footer
include 'includes/footer.php';
?>
