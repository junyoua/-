<?php
include_once("./connect.php");
$rid=$_GET['rid'];
$str="SELECT a.id,a.rid, a.name,a.content,a.time,b.img,b.gender,b.introduction,b.mail FROM comment a INNER JOIN user b ON a.name = b.username WHERE a.rid='$rid' ORDER BY a.id DESC;";
$num=$dbh ->query($str);
$numcount=$num->fetchAll();
echo  json_encode($numcount);
$dbh = null;