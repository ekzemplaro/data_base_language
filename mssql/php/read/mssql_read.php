#! /usr/bin/php
<?php
/*
	mssql_read.php

					Oct/02/2013

*/
// --------------------------------------------------------------------
print "*** 開始 ***\n";
ini_set('display_errors', 1);

$server = 'host_mssql:1433';
$user = 'sa';
$password = 'scott_tiger';

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

	while($row = mssql_fetch_array($result))
		{
		echo $row["id"] . "\t";
		$name = mb_convert_encoding ($row["name"],"UTF-8","SJIS");
		echo $name ."\t";
		echo $row["population"] . "\t";
		echo $row["date_mod"] . "\n";
		}
	}

mssql_close();

print "*** 終了 ***\n";
// --------------------------------------------------------------------
?>
