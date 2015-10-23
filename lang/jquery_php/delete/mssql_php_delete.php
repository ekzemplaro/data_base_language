<?php
// ------------------------------------------------------------------
//	mssql_php_delete.php
//
//				Oct/29/2013
// ------------------------------------------------------------------
// $path=$_SERVER["DOCUMENT_ROOT"]."/data_base/common/php_common";
$path="/var/www/data_base/common/php_common";

set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include	"mssql_manipulate.php";
include "cgi_manipulate.php";

// ------------------------------------------------------------------

$server = 'host_mssql:1433';
$user = 'sa';
$password = 'scott_tiger';

$link = mssql_connect ($server,$user,$password);

$arry_param = cgi_manipulate ();

$count = 0;

$out_str = "";

if ($link)
	{
	$selected = mssql_select_db ("city")
		or die ("Couldn’t open database databasename\n");

	foreach ($arry_param as $id)
		{
		mssql_delete_proc ($id);

		$count++;
		}

	$out_str = "OK " . $count;
	}
else
	{
	$out_str = "NG ***";
	}

echo $out_str;

// ------------------------------------------------------------------
?>
