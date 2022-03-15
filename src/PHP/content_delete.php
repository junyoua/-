<?php
include_once("./connect.php");
$id=$_GET['id'];
$str="DELETE FROM `wish` WHERE `id`=$id;";
$num=$dbh ->exec($str);
echo $num;
$dbh = null;