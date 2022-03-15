<?php
header("Access-Control-Allow-Origin:*");
header("Access-Control-Allow-Credentials: true");
header("Content-type: text/html;charset=utf-8");
header("Access-Control-Allow-Methods:GET, POST, OPTIONS, DELETE");
header("Access-Control-Allow-Headers:DNT,X-Mx-ReqToken,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type, Accept-Language, Origin, Accept-Encoding");
function noc(){
    $url="localhost";
    $user="root";
    $password ="123456";
    $dbdata="php_wish";
    $dbms="mysql";
    $dsn="$dbms:host=$url;dbname=$dbdata";
    try{
        $dbh=new PDO($dsn,$user,$password);
        $dbh ->query("set php_wish utf8");

    }catch(PDOException $e){
        die("错误");
        exit;
    }
    return $dbh;
}
$dbh=noc();
?>