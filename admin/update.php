<?php
include_once "header.php";
$db = $GLOBALS['db'];

if(isset($_POST['submit'])) {
    $updateMenuItem = $db->updateMenuItem($_POST['display_name'], $_POST['sys_name'], $_POST['path'], $_POST['id']);

    if($updateMenuItem) {
        header("Location: menu.php");
    } else {
        echo "ERROR!!!";
    }
} else {
    if(isset($_GET['id'])) {
        $menuItem = $db->getMenuItem($_GET['id']);
        ?>
        <form action="" method="post">
            Display name: <br>
            <input name="display_name" type="text" value="<?php echo $menuItem['display_name'] ?>"><br>
            Sys name:<br>
            <input name="sys_name" type="text" value="<?php echo $menuItem['sys_name'] ?>"><br>
            Path:<br>
            <input name="path" type="text" value="<?php echo $menuItem['path'] ?>"><br>
            <input name="id" type="hidden" value="<?php echo $menuItem['id'] ?>">
            <input type="submit" name="submit" value="Update"><br>
        </form>
        <?php
    } else {
        header("Location: menu.php");
    }
}
?>




