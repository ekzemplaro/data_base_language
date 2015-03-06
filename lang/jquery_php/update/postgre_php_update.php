<?php
// ------------------------------------------------------------------
//	jquery_php/update/postgre_php_update.php
//
//				Feb/09/2015
// ------------------------------------------------------------------
// $path=$_SERVER["DOCUMENT_ROOT"]."/data_base/common/php_common";
$path="/var/www/data_base/common/php_common";

set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include	"pg_manipulate.php";
include "cgi_manipulate.php";

// ------------------------------------------------------------------
$server = 'localhost';
$dbname = 'city';
$user = 'scott';
$password = 'tiger';

$dbconn = pg_connect_proc ($server,$dbname,$user,$password);

$arry_param = cgi_manipulate ();

$count = 0;

foreach ($arry_param as $val_aa)
	{
	$id = $val_aa['id'];
	$population = $val_aa['population'];

	pg_update_exec_proc ($id,$population);

	$count++;
	}

$out_str = "OK " . $count;

echo $out_str;

pg_close ($dbconn);
// ------------------------------------------------------------------
?>
