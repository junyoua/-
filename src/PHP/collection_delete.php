<?php
include_once("./connect.php");
$rid=$_GET['rid'];
$name=$_GET['name'];
$str="DELETE FROM `collection` WHERE `rid`='$rid' and `name`='$name';";
$num=$dbh ->exec($str);
echo $num;
$dbh = null;