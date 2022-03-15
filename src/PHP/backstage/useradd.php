<?php
include_once("../connect.php");
$name=$_GET['name'];
$password=$_GET['pwd'];
$sex=$_GET['sex'];
$gr=$_GET['gr'];
$label=$_GET['label'];
$email=$_GET['email'];
$state=$_GET['state'];
$tx=$_GET['tx'];
$time=date('Y-m-d H:i:s', time());
$user_IP = ($_SERVER["HTTP_VIA"]) ? $_SERVER["HTTP_X_FORWARDED_FOR"] : $_SERVER["REMOTE_ADDR"];
$user_IP = ($user_IP) ? $user_IP : $_SERVER["REMOTE_ADDR"];
$str="INSERT INTO `user` Values (null,'$tx','$name','$password','$time','$sex','$gr','$label','$email','$user_IP','$state');";
$num=$dbh ->exec($str);
echo $num;
$dbh = null;