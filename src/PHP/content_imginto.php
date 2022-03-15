<?php
include_once("./connect.php");
$img=$_GET['img'];
$name=$_GET['name'];
$str = "UPDATE `wish` SET `img`='$img' where `name`='$name';";
$num = $dbh->exec($str);
echo $num;
$dbh = null;