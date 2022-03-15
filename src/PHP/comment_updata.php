<?php
include_once("./connect.php");
$id = $_GET['id'];
$comment = $_GET['comment'];
$str = "UPDATE `wish` SET `comment`='$comment' WHERE `id`='$id';";
$num = $dbh->exec($str);
$dbh = null;