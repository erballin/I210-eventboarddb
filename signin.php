<?php
$page_title = "signin";

include ('includes/header.php');
include ('database.php')
?>
<?php
session_start();

$login_error = "";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $user_input = trim($_POST["username_or_email"]);
    $password = trim($_POST["password"]);

    $stmt = $conn->prepare("SELECT user_name, user_email, password FROM users WHERE user_name = ? OR user_email = ?");
    $stmt->bind_param("ss", $user_input, $user_input);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($user = $result->fetch_assoc()) {
        if (password_verify($password, $user['password'])) {
            $_SESSION["user"] = $user["user_name"];
            header("Location: dashboard.php");
            exit();
        } else {
            $login_error = "Invalid password.";
        }
    } else {
        $login_error = "No user found with that username or email.";
    }

    $stmt->close();
}

$conn->close();
?>
?>
<div class="main">Sign In</div>
<?php if ($login_error): ?>
    <p style="color: red;"><?php echo $login_error; ?></p>
<?php endif; ?>
<form method="POST" action="">
    <table>
        <tr>
            <td><label for="username_or_email">Username or Email:</label></td>
            <td><input type="text" name="username_or_email" id="username_or_email" required></td>
        </tr>
        <tr>
            <td><label for="password">Password:</label></td>
            <td><input type="password" name="password" id="password" required></td>
        </tr>
    </table>
    <button type="submit">Login</button>
</form>

<p>Don't have an account? <a href="signup.php"><button type="button">Sign Up</button></a></p>

<?php 
    include ('includes/footer.php');
