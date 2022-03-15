<?php
include_once("../connect.php");
$str="SELECT * FROM `feedback`ORDER BY `id` DESC;";
$num=$dbh ->query($str);
$rows = $num->fetchAll();
echo json_encode($rows);
$dbh = null;