<?php
include_once("./connect.php");
$text=$_GET['text'];
$str="SELECT * FROM `user` WHERE `username`='$text';";
$num=$dbh ->query($str);
$numcount=$num->rowCount();
print_r($numcount);
$dbh = null;