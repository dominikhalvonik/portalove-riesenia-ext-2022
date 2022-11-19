<?php
include_once "header.php";

if(isset($_SESSION['is_admin'])) {
?>

<ul>
    <li><a href="main.php">Home</a></li>
    <li><a href="menu.php">Edit menu items</a></li>
    <li><a href="http://localhost/portalove-riesenia-2022-ext">Return to web</a></li>
</ul>

<?php
} else {
    ?>
    <form action="login.php" method="post">
        Username:<br>
        <input type="text" name="username" placeholder="Username"><br>
        Password:<br>
        <input type="password" name="password"><br>
        <input type="submit" name="submit" value="Login">
    </form>
    <?php
}
?>
