<?php
include_once("./connect.php");
$text=$_GET['text'];
$str="SELECT `id`,`img`,`username`,`password`,`time`,`gender`,`introduction`,`state`,`mail` FROM `user` WHERE `username`='$text';";
$num=$dbh ->query($str);
$numcount=$num->fetchAll();
echo  json_encode($numcount);
$dbh = null;