#! /usr/bin/php
<?php
/*
	maria_delete.php

					Jan/19/2017

*/
// --------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "sql_display.php";
include "sql_manipulate.php";
include "mysql_utf8.php";

// --------------------------------------------------------------------
$host = 'localhost';
$user = 'scott';
$password = 'tiger';
$dsn = 'mysql:dbname=city;host=' . $host;

fputs (STDERR,"*** 開始 ***\n");

$id_in = $argv[1];

echo $id_in . "\n";

$dbcon = new PDO ($dsn, $user,$password);

mysql_utf8_proc ($dbcon);

sql_delete_proc ($dbcon,$id_in);

$dbcon = null;

fputs (STDERR,"*** 終了 ***\n");
// --------------------------------------------------------------------
?>	
