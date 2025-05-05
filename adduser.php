<?php
$page_title = "adduser";
include('includes/header.php');
include('database.php');

$username = $conn->real_escape_string(trim(filter_input(INPUT_POST, 'username', FILTER_SANITIZE_STRING)));
$email = $conn->real_escape_string(trim(filter_input(INPUT_POST, 'email', FILTER_SANITIZE_EMAIL)));
$password = $conn->real_escape_string(trim(filter_input(INPUT_POST, 'password', FILTER_SANITIZE_STRING)));
$display_name = $conn->real_escape_string(trim(filter_input(INPUT_POST, 'display_name', FILTER_SANITIZE_STRING)));
$location = $conn->real_escape_string(trim(filter_input(INPUT_POST, 'location', FILTER_SANITIZE_STRING)));

$created_at = date('Y-m-d H:i:s');
$sql = "
    INSERT INTO users (username, email, password, display_name, location, created_at)
    VALUES (?, ?, ?, ?, ?, ?)
";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ssssss", $username, $email, $password, $display_name, $location, $created_at);

if ($stmt->execute()) {
    $user_id = $stmt->insert_id;
} else {
    echo "Error creating user: " . $stmt->error;
}


echo "The new user account has been created.";
$stmt->close();
$conn->close();

include 'includes/footer.php';
