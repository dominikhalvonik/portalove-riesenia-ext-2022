<?php
include_once "header.php";
$db = $GLOBALS['db'];

if(isset($_POST['submit'])) {
    $login = $db->login($_POST['username'], $_POST['password']);

    if($login) {
        $_SESSION['is_admin'] = true;
        header("Location: main.php");
    } else {
        header("Location: main.php");
    }
} else {
    header("Location: main.php");
}