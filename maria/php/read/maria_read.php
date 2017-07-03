#! /usr/bin/php
<?php
/*
	maria_read.php

					Jun/29/2017

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

try
	{
	$dbcon = new PDO ($dsn, $user,$password);
	disp_lower_proc ($dbcon);
	$dbcon = null;
	}
catch  (PDOException $e)
	{
	print('Error:'.$e->getMessage());
	}

fputs (STDERR,"*** 終了 ***\n");
// --------------------------------------------------------------------
?>	
