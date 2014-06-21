<?php
// ---------------------------------------------------------------------
//	mssql_php_create.php
//
//					Oct/29/2013
//
// ---------------------------------------------------------------------
// $path=$_SERVER["DOCUMENT_ROOT"]."/data_base/common/php_common";
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "text_manipulate.php";
include "mssql_manipulate.php";

//
// ---------------------------------------------------------------------
function data_prepare_proc ()
{
$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,'t1071','前橋',57400,'2002-8-5');
$dict_aa = dict_append_proc ($dict_aa,'t1072','高崎',81300,'2002-4-22');
$dict_aa = dict_append_proc ($dict_aa,'t1073','桐生',24600,'2002-9-9');
$dict_aa = dict_append_proc ($dict_aa,'t1074','沼田',38900,'2002-11-12');
$dict_aa = dict_append_proc ($dict_aa,'t1075','伊勢崎',79500,'2002-7-21');
$dict_aa = dict_append_proc ($dict_aa,'t1076','水上',31900,'2002-6-9');
$dict_aa = dict_append_proc ($dict_aa,'t1077','太田',85400,'2002-4-1');
$dict_aa = dict_append_proc ($dict_aa,'t1078','安中',21300,'2002-3-12');
$dict_aa = dict_append_proc ($dict_aa,'t1079','みどり',75800,'2002-1-18');

	return	$dict_aa;
}
// ---------------------------------------------------------------------
$dict_aa = data_prepare_proc ();

$server = 'host_mssql:1433';
$user = 'sa';
$password = 'scott_tiger';

$link = mssql_connect ($server,$user,$password);

$selected = mssql_select_db ("city")
		or die ("Couldn’t open database databasename\n");

mssql_drop_table_proc ($dbcon);
mssql_create_table_proc ($dbcon);

dict_to_mssql_proc ($dict_aa,$dbcon);

mssql_close();

echo "*** OK ***";
// ---------------------------------------------------------------------
?>	
