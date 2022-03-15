<?php
include_once("../connect.php");
$id=$_GET['id'];
$str= "UPDATE `wish` SET `show`='1' WHERE `id`='$id';";
$num = $dbh->exec($str);
echo $num;
$dbh = null;