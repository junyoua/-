<?php
include_once("../connect.php");
$str="SELECT * FROM `collection`ORDER BY `id` DESC;";
$num=$dbh ->query($str);
$rows = $num->fetchAll();
echo json_encode($rows);
$dbh = null;