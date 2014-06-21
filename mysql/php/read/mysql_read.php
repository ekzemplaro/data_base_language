#! /usr/bin/php
<?php
/*
	mysql_read.php

					Jan/31/2011

*/
// --------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
include "sql_display.php";
include "mysql_utf8.php";
// --------------------------------------------------------------------
$dsn = 'mysql:dbname=city;host=host_mysql';
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
