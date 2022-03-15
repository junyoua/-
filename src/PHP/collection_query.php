<?php
include_once("./connect.php");
$name=$_GET['name'];
$str="SELECT a.id,a.img,a.name,a.content,a.value,a.time,a.color,a.imgdata,a.number,a.comment,b.rid,b.time FROM wish a INNER JOIN collection b ON a.id = b.rid WHERE b.name='$name'  ORDER BY b.id DESC;";
$num=$dbh ->query($str);
$rows = $num->fetchAll();
$rowCount = count($rows);
echo json_encode($rows);
$dbh = null;