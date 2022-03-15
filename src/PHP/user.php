<?php
include_once("./connect.php");
$name=$_GET['name'];
$password=$_GET['password'];
$time=date('Y-m-d H:i:s', time());
$user_IP = ($_SERVER["HTTP_VIA"]) ? $_SERVER["HTTP_X_FORWARDED_FOR"] : $_SERVER["REMOTE_ADDR"];
$user_IP = ($user_IP) ? $user_IP : $_SERVER["REMOTE_ADDR"];
$str="INSERT INTO `user` Values (null,null,'$name','$password','$time',null,null,null,null,'$user_IP','0');";
$num=$dbh ->exec($str);
echo $num;
$dbh = null;