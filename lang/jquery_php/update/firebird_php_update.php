<?php
// ------------------------------------------------------------------
//	jquery_php/update/firebird_php_update.php
//
//				Oct/29/2013
// ------------------------------------------------------------------
//$path=$_SERVER["DOCUMENT_ROOT"]."/data_base/common/php_common";
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

$count = 0;

foreach ($arry_param as $val_aa)
	{
	$id = $val_aa['id'];
	$population = $val_aa['population'];

	firebird_row_update_proc ($dbh,$id,$population);

	$count++;
	}

$out_str = "OK " . $count;

echo $out_str;

// ------------------------------------------------------------------
?>
