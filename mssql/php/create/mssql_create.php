#! /usr/bin/php
<?php
/*
	mssql_create.php

					Oct/29/2013

*/
// --------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "text_manipulate.php";
include "mssql_manipulate.php";
// --------------------------------------------------------------------
function data_prepare_proc ()
{
$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,'t1071','前橋',52614,'2002-9-9');
$dict_aa = dict_append_proc ($dict_aa,'t1072','高崎',96183,'2002-8-15');
$dict_aa = dict_append_proc ($dict_aa,'t1073','桐生',81592,'2002-1-21');
$dict_aa = dict_append_proc ($dict_aa,'t1074','沼田',58479,'2002-11-19');
$dict_aa = dict_append_proc ($dict_aa,'t1075','伊勢崎',72845,'2002-7-24');
$dict_aa = dict_append_proc ($dict_aa,'t1076','水上',26319,'2002-6-2');
$dict_aa = dict_append_proc ($dict_aa,'t1077','太田',82754,'2002-4-9');
$dict_aa = dict_append_proc ($dict_aa,'t1078','安中',57213,'2002-3-14');
$dict_aa = dict_append_proc ($dict_aa,'t1079','みどり',74598,'2002-7-12');

	return	$dict_aa;
}

// --------------------------------------------------------------------
print "*** 開始 ***\n";

$dict_aa = data_prepare_proc ();

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

	mssql_drop_table_proc ();
	mssql_create_table_proc ();
	dict_to_mssql_proc ($dict_aa); 
	}

mssql_close();

print "*** 終了 ***\n";
// --------------------------------------------------------------------
?>
