<?php
// ------------------------------------------------------------------
//	jquery_php/update/mssql_php_update.php
//
//				Oct/29/2013
// ------------------------------------------------------------------
//$path=$_SERVER["DOCUMENT_ROOT"]."/data_base/common/php_common";
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

if ($link)
{
$selected = mssql_select_db ("city", $link)
		or die ("Couldn’t open database databasename\n");

foreach ($arry_param as $val_aa)
	{
	$id = $val_aa['id'];
	$population = $val_aa['population'];

	mssql_update_proc ($id,$population);

	$count++;
	}
}

mssql_close();

$out_str = "OK " . $count;

echo $out_str;

// ------------------------------------------------------------------
?>
