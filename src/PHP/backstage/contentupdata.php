<?php
include_once("../connect.php");
$id = $_GET['id'];
$value = $_GET['label'];
$name = $_GET['name'];
$content = $_GET['content'];
$time = date('Y-m-d H:i:s', time());
$img = $_GET['img'];
$imgdata = $_GET['imgdata'];
$number = $_GET['number'];
$num = $_GET['num'];
$visit = $_GET['visit'];
$comment = $_GET['comment'];
$color = $_GET['color'];
$show = $_GET['show'];
$user_IP = ($_SERVER["HTTP_VIA"]) ? $_SERVER["HTTP_X_FORWARDED_FOR"] : $_SERVER["REMOTE_ADDR"];
$user_IP = ($user_IP) ? $user_IP : $_SERVER["REMOTE_ADDR"];
$str = "UPDATE `wish` SET `name`='$name',`img`='$img',`value`='$value',`content`='$content',`time`='$time',`color`='$color',`imgdata`='$imgdata',`ip`='$user_IP',`number`='$number',`num`='$num',`visit`='$visit',`comment`='$comment',`show`='$show' WHERE `id`='$id';";
$num = $dbh->exec($str);
echo $num;
$dbh = null;