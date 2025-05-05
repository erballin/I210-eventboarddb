<?php
include('database.php')
?>
<?php
session_start();
?>
<!DOCTYPE HTML>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link type="text/css" rel="stylesheet" href="www/css/styles.css" />
    <title><?php echo $page_title; ?></title>
</head>

<body>
    <nav>
        <p><a href="index.php">Event Board</a></p>
        <div class="links">
            <a href="index.php">Home</a> |
            <a href="browse.php">Browse</a> |
            <?php
            if (!isset($_SESSION['user_id'])) {
                echo "<a href='signin.php'>Sign In</a>";
            } else {
                echo '<a href="event_form.php">Create Event</a> |';
                echo "<a href='user.php?userId=" . $_SESSION['user_id'] . "'>" . $_SESSION['username'] . "</a>";
            }
            ?>
        </div>
    </nav>
    <div class="wrapper">