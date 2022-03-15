<?php
include_once("./connect.php");
$id=$_GET['id'];
$name=$_GET['name'];
$number=$_GET['number'];
$str="SELECT `name`, `rid` FROM `good` WHERE `rid`='$id' and `name`='$name';";
$num=$dbh ->query($str);
$rows = $num->fetchAll();
$rowCount = count($rows);

if($rowCount==0){
    $str1="INSERT INTO `good`(`id`, `name`, `rid`) VALUES (null,'$name','$id');";
    $num1=$dbh ->exec($str1);
    $num=$number+1;
    $str2="UPDATE `wish` SET `number`='$num' WHERE `id`='$id';";
    $num2=$dbh ->exec($str2);
   if($num1==1&&$num2==1){
       echo 1;
   }
}else{
    echo 0;
}
$dbh = null;