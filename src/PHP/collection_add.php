<?php
include_once("./connect.php");
$rid=$_GET['rid'];
$name=$_GET['name'];
$str="SELECT * FROM `collection` WHERE `rid`='$rid' and  `name`='$name';";
$num=$dbh ->query($str);
$rows = $num->fetchAll();
$rowCount = count($rows);
if($rowCount==0){
    $time = date('Y-m-d H:i:s', time());
    $str1="INSERT INTO `collection`(`id`, `name`, `rid`) VALUES (null,'$name','$rid','$time');";
    $num1=$dbh ->exec($str1);
    echo $num1;
}else{
    $time = date('Y-m-d H:i:s', time());
    $str2="DELETE FROM `collection` WHERE `rid`='$rid' and  `name`='$name';";
    $num2=$dbh ->exec($str2);
    $str3="INSERT INTO `collection`(`id`, `name`, `rid`) VALUES (null,'$name','$rid','$time');";
    $num3=$dbh ->exec($str3);
    echo $num3;
}

 
$dbh = null;