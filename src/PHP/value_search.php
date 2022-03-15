<?php
include_once("./connect.php");
$str = "SELECT distinct `value`,`num` FROM `wish`  order by `num` desc;";
$num = $dbh->query($str);
$rows = $num->fetchAll();
$rowCount = count($rows);
echo json_encode($rows);
$dbh = null;