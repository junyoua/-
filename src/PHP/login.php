<?php
include_once("./connect.php");
$time = date('Y-m-d H:i:s', time());
$name = $_GET['name'];
$pwd = $_GET['pwd'];
$user_IP = ($_SERVER["HTTP_VIA"]) ? $_SERVER["HTTP_X_FORWARDED_FOR"] : $_SERVER["REMOTE_ADDR"];
$user_IP = ($user_IP) ? $user_IP : $_SERVER["REMOTE_ADDR"];

$str = "SELECT * FROM `user` WHERE `username`='$name' and `password`='$pwd';";
$num = $dbh->query($str);
$numcount = $num->rowCount();
$rows = $num->fetchAll();
$ids = array_column($rows, 'adopt');
$state = $ids[0];
if ($numcount == 1) {
    if ($state == 0) {
        $str = "INSERT INTO `user_ip` Values (null,'$time','$user_IP','$name');";
        $num = $dbh->exec($str);
        echo $num;
    } else {
        echo 3;
    }
} else {
    echo 2;
}
$dbh = null;
