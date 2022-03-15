<?php
include_once("./connect.php");
$str="SELECT `id`,`img`,`name`,`content`,`value`,`time`,`color`,`imgdata`,`number`,`visit`,`comment`,`show` FROM `wish` WHERE `show`='1' order by 1 desc;";
$num=$dbh ->query($str);
$rows = $num->fetchAll();
$rowCount = count($rows);
echo json_encode($rows);
$dbh = null;