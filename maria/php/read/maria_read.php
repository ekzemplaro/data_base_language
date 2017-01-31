#! /usr/bin/php
<?php
/*
	maria_read.php

					Jan/27/2017

*/
// --------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
include "sql_display.php";
// --------------------------------------------------------------------
$host = 'localhost';
$user = 'scott';
$password = 'tiger';
$db = 'city';

$dsn = 'mysql:dbname=' . $db . ';host=' . $host;

fputs (STDERR,"*** 開始 ***\n");

$dbcon = new PDO ($dsn, $user,$password);

disp_lower_proc ($dbcon);

$dbcon = null;

fputs (STDERR,"*** 終了 ***\n");
// --------------------------------------------------------------------
?>	
