#! /usr/bin/php
<?php
/*
	mysql_delete.php

					Jan/06/2011

*/
// --------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "sql_display.php";
include "sql_manipulate.php";
include "mysql_utf8.php";

// --------------------------------------------------------------------
$dsn = 'mysql:dbname=city;host=host_mysql';
$user = 'scott';
$password = 'tiger';

print "*** 開始 ***\n";

$id_in = $argv[1];

print $id_in . "\n";


$dbcon = new PDO ($dsn, $user,$password);

mysql_utf8_proc ($dbcon);

sql_delete_proc ($dbcon,$id_in);

print "--------------------------\n";

disp_lower_proc ($dbcon);

$dbcon = null;

print "*** 終了 ***\n";
// --------------------------------------------------------------------
?>	
