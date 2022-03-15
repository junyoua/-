<?php
include_once("../connect.php");
$name = $_GET['name'];
$value = $_GET['label'];
$content = $_GET['content'];
$time = date('Y-m-d H:i:s', time());
$color = $_GET['color'];
$user_IP = ($_SERVER["HTTP_VIA"]) ? $_SERVER["HTTP_X_FORWARDED_FOR"] : $_SERVER["REMOTE_ADDR"];
$user_IP = ($user_IP) ? $user_IP : $_SERVER["REMOTE_ADDR"];
$imgdata=$_GET['imgdata'];
$img=$_GET['img'];
$num=$_GET['num'];
$number=$_GET['number'];
$visit=$_GET['visit'];
$comment=$_GET['comment'];
$show=$_GET['show'];


$str = "INSERT INTO `wish` Values (null,'$img','$name','$value','$content','$color','$img','$number','$num','$user_IP','$visit','$comment','$show','$time');";
$num = $dbh->exec($str);
echo $num;
$dbh = null;