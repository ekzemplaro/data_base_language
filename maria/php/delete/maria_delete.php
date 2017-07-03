#! /usr/bin/php
<?php
/*
	maria_delete.php

					Jun/29/2017

*/
// --------------------------------------------------------------------
$path="../../../common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "sql_manipulate.php";

// --------------------------------------------------------------------
$host = 'localhost';
$user = 'scott';
$password = 'tiger123';
$db = 'city';

$dsn = 'mysql:dbname=' . $db . ';host=' . $host . ';charset=utf8';

fputs (STDERR,"*** 開始 ***\n");

$id_in = $argv[1];
echo $id_in . "\n";

try
	{
	$dbcon = new PDO ($dsn, $user,$password);
	sql_delete_proc ($dbcon,$id_in);
	$dbcon = null;
	}
catch  (PDOException $e)
	{
	print('Error:'.$e->getMessage());
	}

fputs (STDERR,"*** 終了 ***\n");
// --------------------------------------------------------------------
?>	
