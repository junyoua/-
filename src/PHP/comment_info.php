<?php
include_once("./connect.php");
$rid=$_GET['rid'];
$str="SELECT `img`,`name`,`content`,`value`,`time`,`color`,`imgdata`,`number`,`visit`,`comment` FROM `wish` WHERE id='$rid';";
$num=$dbh ->query($str);
$rows = $num->fetchAll();
$rowCount = count($rows);
echo json_encode($rows);
$dbh = null;