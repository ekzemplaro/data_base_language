#! /usr/bin/php
<?php
/*
	mssql_read.php

					Nov/18/2015

*/
// --------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "text_manipulate.php";
// --------------------------------------------------------------------
print "*** 開始 ***\n";
ini_set('display_errors', 1);

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
	$selected = mssql_select_db ("city")
		or die ("Couldn’t open database databasename\n");

	echo "connected to databasename\n";
    
	$result = mssql_query ("select * from cities");

	$dict_aa = array ();

	while($row = mssql_fetch_array($result))
		{
		$name = $row["name"];
		$key=$row["id"];
		$dict_unit = array ();
		$dict_unit['name'] = $row["name"];
		$dict_unit['population'] = $row["population"];
		$dict_unit['date_mod'] = $row["date_mod"];
		$dict_aa[$key]= $dict_unit;
		}
	}

mssql_close();

dict_display_proc ($dict_aa);

print "*** 終了 ***\n";
// --------------------------------------------------------------------
?>
