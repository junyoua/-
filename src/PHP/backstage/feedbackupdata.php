<?php
include_once("../connect.php");
$id=$_GET['id'];
$name=$_GET['name'];
$content=$_GET['content'];
$time=date('Y-m-d H:i:s', time());
$user_IP = ($_SERVER["HTTP_VIA"]) ? $_SERVER["HTTP_X_FORWARDED_FOR"] : $_SERVER["REMOTE_ADDR"];
$user_IP = ($user_IP) ? $user_IP : $_SERVER["REMOTE_ADDR"];
$str= "UPDATE `feedback` SET `name`='$name',`content`='$content' WHERE `id`='$id';";
$num = $dbh->exec($str);
echo $num;
$dbh = null;