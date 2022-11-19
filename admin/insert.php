<?php
include_once "header.php";
$db = $GLOBALS['db'];

if(isset($_POST['submit'])) {
    $insertMenuItem = $db->insertMenuItem($_POST['display_name'], $_POST['sys_name'], $_POST['path']);

    if($insertMenuItem) {
        header("Location: menu.php");
    } else {
        echo "ERROR!!!";
    }
} else {
    ?>
    <form action="" method="post">
        Display name: <br>
        <input name="display_name" type="text" placeholder="Menu display name"><br>
        Sys name:<br>
        <input name="sys_name" type="text" placeholder="Menu system name"><br>
        Path:<br>
        <input name="path" type="text" placeholder="Menu URL"><br>
        <input type="submit" name="submit" value="Insert"><br>
    </form>
    <?php
}
?>




