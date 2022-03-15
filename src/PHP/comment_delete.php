<?php
include_once("./connect.php");
$id=$_GET['id'];
$rid=$_GET['rid'];
$name=$_GET['name'];
$str="DELETE FROM `comment` WHERE `rid`='$rid' AND `id`='$id' AND `name`='$name';";
$num=$dbh ->exec($str);
echo $num;
$dbh = null;