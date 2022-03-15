<?php
include_once("./connect.php");
$name=$_GET['name'];
$str="SELECT `adopt` FROM `user` WHERE `username`='$name';";
$num=$dbh ->query($str);
$rows = $num->fetchAll();
$ids = array_column($rows, 'adopt');
print_r($ids[0]);
$dbh = null;