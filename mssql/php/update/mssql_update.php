#! /usr/bin/php
<?php
/*
	mssql_update.php

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
$population_in = $argv[2];

print $id_in . "\t" . $population_in . "\n";

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
	$selected = mssql_select_db ("city", $link)
		or die ("Couldn’t open database databasename\n");
	echo "connected to databasename\n";
   
	mssql_update_proc ($id_in,$population_in);
	}

mssql_close();

print "*** 終了 ***\n";
// --------------------------------------------------------------------
?>
