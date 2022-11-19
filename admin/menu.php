<?php
include_once "header.php";
$db = $GLOBALS['db'];
$menu = $db->getMenu();

echo "<ul>";
foreach ($menu as $menuItem) {
    echo "<li>".$menuItem['name']." <a href='delete.php?id=".$menuItem['id']."'>Delete</a> <a href='update.php?id=".$menuItem['id']."'>Update</a> </li>";
}

echo "</ul>";
?>
<br>
<a href='insert.php'>Insert new menu item</a>
