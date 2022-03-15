<?php
include_once("./connect.php");
$content = $_GET['content'];
$str = "SELECT `color`,`content`,`id`,`img`,`imgdata`,`name`,`num`,`number`,`time`,`value`,`visit`,`comment` FROM `wish` WHERE `value` LIKE '%$content%';";
$num = $dbh->query($str);
$rows = $num->fetchAll();
$rowCount = count($rows);
$numm=$rows[0]['num']+1;
$str1 = "UPDATE `wish` SET `num`='$numm' where `value`='$content';";
$num1 = $dbh->exec($str1);
if ($rowCount == null) {
    $str = "SELECT `color`,`content`,`id`,`img`,`imgdata`,`name`,`num`,`number`,`time`,`value`,`visit`,`comment`  FROM `wish` WHERE `content` LIKE '%$content%';";
    $num = $dbh->query($str);
    $rows = $num->fetchAll();
}
echo json_encode($rows);
$dbh = null;