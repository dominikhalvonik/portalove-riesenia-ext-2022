<?php
include_once "class/db.php";

use portalove\DB; /*použiť dalšiu triedu pre ďalšie fungovanie*/

$db = new DB("localhost","portalove-riesenia","root","", 3308);
global $menuItems;
$menuItems = $db->getMenu();
?>