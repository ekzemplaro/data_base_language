#! /usr/bin/php
<?php
/*
	maria_read.php

					Apr/25/2017

*/
// --------------------------------------------------------------------
$path="../../../common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
include "sql_display.php";
// --------------------------------------------------------------------
$host = 'localhost';
$user = 'scott';
$password = 'tiger123';
$db = 'city';

$dsn = 'mysql:dbname=' . $db . ';host=' . $host . ';charset=utf8';

fputs (STDERR,"*** 開始 ***\n");

$dbcon = new PDO ($dsn, $user,$password);

disp_lower_proc ($dbcon);

$dbcon = null;

fputs (STDERR,"*** 終了 ***\n");
// --------------------------------------------------------------------
?>	
