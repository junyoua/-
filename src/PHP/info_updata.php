<?php
include_once("./connect.php");
$name = $_GET['text'];
$mail = $_GET['mail'];
$value = $_GET['sex'];
$radio = $_GET['state'];
$textarea = $_GET['textarea'];
$user_IP = ($_SERVER["HTTP_VIA"]) ? $_SERVER["HTTP_X_FORWARDED_FOR"] : $_SERVER["REMOTE_ADDR"];
$user_IP = ($user_IP) ? $user_IP : $_SERVER["REMOTE_ADDR"];
if($value=='male'){
    $sex='男';
}else{
    $sex='女';
}
if($radio==1){
    $state='在学校';
}else if($radio==2){
    $state='求职中';
}else{
    $state='已工作';
}
$str = "UPDATE `user` SET `gender`='$sex',`introduction`='$textarea',`state`='$state',`mail`='$mail',`ip`='$user_IP' WHERE `username`='$name';";
$num = $dbh->exec($str);
echo $num;
$dbh = null;

