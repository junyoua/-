<?php
include_once("./connect.php");
$id=$_GET['id'];
$name=$_GET['name'];
$number=$_GET['number'];
$str="DELETE FROM `good` WHERE `rid`='$id' and `name`='$name';";
$num=$dbh ->exec($str);
if($num==1){
    if($number>0){
        $num=$number-1;
    }
    $str1="UPDATE `wish` SET `number`='$num' WHERE `id`='$id';";
    $num1=$dbh ->exec($str1);
    echo $num1;
}

$dbh = null;