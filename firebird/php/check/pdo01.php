<?php
$dsn = "firebird:host=localhost; dbname=/var/tmp/firebird/aaa.fdb";
$user = "SYSDBA";
$pass = "hello9";

$db = new PDO($dsn, $user, $pass);
//$db->setAttribute(PDO::ATTR_CURSOR, PDO::CURSOR_FWDONLY);
$sql = 'SELECT id,name,population,date_mod FROM cities ';

$stmt = $db->query($sql);
$stmt->setFetchMode(PDO::FETCH_ASSOC);
var_dump($stmt->fetchAll());
?>
