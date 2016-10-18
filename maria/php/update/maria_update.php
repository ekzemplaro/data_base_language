#! /usr/bin/php
<?php
/*
	maria_update.php

					Oct/18/2016

*/
// --------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "sql_display.php";
include "sql_manipulate.php";
include "mysql_utf8.php";

// --------------------------------------------------------------------
$dsn = 'mysql:dbname=city;host=localhost';
$user = 'scott';
$password = 'tiger';

fputs (STDERR,"*** 開始 ***\n");

$id_in = $argv[1];
$population_in = intval ($argv[2]);

echo $id_in . "\t" . $population_in . "\n";

$dbcon = new PDO ($dsn, $user,$password);

mysql_utf8_proc ($dbcon);

sql_update_proc ($dbcon,$id_in,$population_in);

$dbcon = null;

fputs (STDERR,"*** 終了 ***\n");
// --------------------------------------------------------------------
?>	
