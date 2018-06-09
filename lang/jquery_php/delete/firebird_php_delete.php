<?php
// ------------------------------------------------------------------
//	firebird_php_delete.php
//
//				Jun/08/2012
// ------------------------------------------------------------------
// $path=$_SERVER["DOCUMENT_ROOT"]."/data_base/common/php_common";
$path="/var/www/data_base/common/php_common";

set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include	"firebird_row_update.php";
include "cgi_manipulate.php";

// ------------------------------------------------------------------
define("DBNAME","localhost:/var/tmp/firebird/cities.fdb");
define("DBUSER","sysdba");
define("DBPASS","tiger");

$dbh = ibase_connect(DBNAME,DBUSER,DBPASS,"UTF-8");

$arry_param = cgi_manipulate ();

foreach ($arry_param as $id)
	{
	firebird_row_delete_proc ($dbh,$id);

	$count++;
	}

$out_str .= "OK " . $count;

echo $out_str;

// ------------------------------------------------------------------
?>
