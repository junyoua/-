<?php
include_once("./connect.php");

// 图片
$file = $_FILES['file'];
if($file['type']=='image/jpeg'||$file['type']=='image/png'||$file['type']=='image/gif'){
if (is_uploaded_file($file['tmp_name'])) {
    if (move_uploaded_file($file['tmp_name'], 'touxiang/' . $file['name']));
    $img = $file['name'];
} else {
    $img = '';
}
}
