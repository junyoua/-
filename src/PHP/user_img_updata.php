<?php
include_once("./connect.php");
$img=$_GET['img'];
$name=$_GET['name'];
$str = "UPDATE `user` SET `img`='$img' where `username`='$name';";
$num = $dbh->exec($str);
echo $num;
$dbh = null;