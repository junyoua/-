<?php
include_once("./connect.php");
$id = $_GET['id'];
$value = $_GET['label'];
$name = $_GET['name'];
$content = $_GET['content'];
$time = date('Y-m-d H:i:s', time());
$img = $_GET['img'];
$color = $_GET['color'];
$user_IP = ($_SERVER["HTTP_VIA"]) ? $_SERVER["HTTP_X_FORWARDED_FOR"] : $_SERVER["REMOTE_ADDR"];
$user_IP = ($user_IP) ? $user_IP : $_SERVER["REMOTE_ADDR"];
$str = "UPDATE `wish` SET `name`='$name',`value`='$value',`content`='$content',`time`='$time',`color`='$color',`imgdata`='$img',`ip`='$user_IP',`show`='0' WHERE `id`='$id';";
$num = $dbh->exec($str);
echo $num;
$dbh = null;