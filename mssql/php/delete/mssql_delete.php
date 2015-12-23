#! /usr/bin/php
<?php
/*
	mssql_delete.php

					Nov/18/2015

*/
// --------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "mssql_manipulate.php";
// --------------------------------------------------------------------
print "*** 開始 ***\n";
$id_in = $argv[1];

print $id_in . "\n";

ini_set ('display_errors',1);

$server = 'host_mssql\EG';
$user = 'sa';
$password = 'Tiger123';

$link = mssql_connect ($server,$user,$password);

if (!$link)
	{
	die('\n\nSomething went wrong while connecting to MSSQL');
	}
else
	{
//	$selected = mssql_select_db ("city", $link)
	$selected = mssql_select_db ("city")
		or die ("Couldn’t open database databasename\n");
	echo "connected to databasename\n";
   
	mssql_delete_proc ($id_in);

	}

mssql_close();

print "*** 終了 ***\n";
// --------------------------------------------------------------------
?>
