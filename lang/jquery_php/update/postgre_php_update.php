<?php
// ------------------------------------------------------------------
//	jquery_php/update/postgre_php_update.php
//
//				Oct/29/2013
// ------------------------------------------------------------------
// $path=$_SERVER["DOCUMENT_ROOT"]."/data_base/common/php_common";
$path="/var/www/data_base/common/php_common";

set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include	"sql_manipulate.php";
include "cgi_manipulate.php";

// ------------------------------------------------------------------
$dsn = 'pgsql:dbname=city host=localhost port=5432';
$user = 'scott';
$password = 'tiger';
$dbcon = new PDO ($dsn, $user,$password);

$arry_param = cgi_manipulate ();

$count = 0;

foreach ($arry_param as $val_aa)
	{
	$id = $val_aa['id'];
	$population = $val_aa['population'];

	sql_update_proc ($dbcon,$id,$population);

	$count++;
	}

$out_str = "OK " . $count;

echo $out_str;

// ------------------------------------------------------------------
?>
