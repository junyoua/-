<?php
include_once("../connect.php");
$str="SELECT  `id`,`name`,`content` FROM `wish` WHERE `show`='0';";
$num=$dbh ->query($str);
$rows = $num->fetchAll();
echo json_encode($rows);
$dbh = null;