<?php
include_once("./connect.php");
$id = $_GET['id'];
$num1 = $_GET['num'];
$common=$num1+1;
$str = "UPDATE `wish` SET `visit`='$common' WHERE `id`='$id';";
$num = $dbh->exec($str);
echo $num1;
$dbh = null;