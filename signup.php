<?php
$page_title = "signup";

include('includes/header.php');
?>

<div class="main">Sign Up</div>

<form action="adduser.php" method="post" style="max-width: 700px; margin: 0 auto;">
    <table class="form-table" style="width: 100%; border-collapse: collapse;">
        <tr>
            <td>User Name:</td>
            <td><input name="username" name="username" type="text" required style="width: 100%;" /></td>
        </tr>
        <tr>
            <td>User Email:</td>
            <td><input type="email" name="email" required style="width: 100%;" /></td>
        </tr>
        <tr>
            <td>Password:</td>
            <td><input type="text" name="password" required style="width: 100%;" /></td>
        </tr>
        <tr>
            <td>Displayed Name:</td>
            <td><input type="text" name="display_name" required style="width: 100%;" /></td>
        </tr>
        <tr>
            <td>Location:</td>
            <td><input type="text" name="location" required style="width: 100%;" /></td>
        </tr>
    </table>
    <div style="text-align: center;" />
    <input type="submit" name="Submit" id="Submit" value="Create Account">
    </div>
</form>


<?php
include('includes/footer.php');
