<?php
include_once("./connect.php");
$name = $_GET['name'];
$value = $_GET['label'];
$content = $_GET['content'];
$time = date('Y-m-d H:i:s', time());
$color = $_GET['color'];
$user_IP = ($_SERVER["HTTP_VIA"]) ? $_SERVER["HTTP_X_FORWARDED_FOR"] : $_SERVER["REMOTE_ADDR"];
$user_IP = ($user_IP) ? $user_IP : $_SERVER["REMOTE_ADDR"];
$img=$_GET['img'];

$str = "INSERT INTO `wish` Values (null,null,'$name','$value','$content','$color','$img','0','0','$user_IP','0','0','0','$time');";
$num = $dbh->exec($str);
echo $num;
$dbh = null;