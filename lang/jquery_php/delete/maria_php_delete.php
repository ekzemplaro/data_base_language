<?php
// ------------------------------------------------------------------
//	maria_php_delete.php
//
//				Apr/25/2017
// ------------------------------------------------------------------
// $path=$_SERVER["DOCUMENT_ROOT"]."/data_base/common/php_common";
$path="/var/www/data_base/common/php_common";

set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include	"sql_manipulate.php";
include "cgi_manipulate.php";

// ------------------------------------------------------------------
$dsn = 'mysql:dbname=city;host=localhost';
$user = 'scott';
$password = 'tiger123';
$dbcon = new PDO ($dsn, $user,$password);

$arry_param = cgi_manipulate ();

foreach ($arry_param as $id)
	{
	sql_delete_proc ($dbcon,$id);

	$count++;
	}

$out_str .= "OK " . $count;

echo $out_str;

// ------------------------------------------------------------------
?>
