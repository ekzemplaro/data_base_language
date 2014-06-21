#! /usr/bin/php
<?php
/*
	maria_read.php

					Sep/16/2013

*/
// --------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
include "sql_display.php";
include "mysql_utf8.php";
// --------------------------------------------------------------------
$dsn = 'mysql:dbname=city;host=localhost';
$user = 'scott';
$password = 'tiger';

print "*** 開始 ***\n";

$dbcon = new PDO ($dsn, $user,$password);

mysql_utf8_proc ($dbcon);

disp_lower_proc ($dbcon);

$dbcon = null;

print "*** 終了 ***\n";
// --------------------------------------------------------------------
?>	
