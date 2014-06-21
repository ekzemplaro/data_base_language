<?php
// ------------------------------------------------------------------
//	jquery_php/update/maria_php_update.php
//
//				Sep/17/2013
// ------------------------------------------------------------------
//$path=$_SERVER["DOCUMENT_ROOT"]."/data_base/common/php_common";
$path="/var/www/data_base/common/php_common";

set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include	"sql_manipulate.php";
include	"mysql_utf8.php";
include "cgi_manipulate.php";

// ------------------------------------------------------------------
$dsn = 'mysql:dbname=city;host=localhost';
$user = 'scott';
$password = 'tiger';
$dbcon = new PDO ($dsn, $user,$password);

mysql_utf8_proc ($dbcon);

$arry_param = cgi_manipulate ();


foreach ($arry_param as $val_aa)
	{
	$id = $val_aa['id'];
	$population = $val_aa['population'];

	sql_update_proc ($dbcon,$id,$population);

	$count++;
	}

$out_str .= "OK " . $count;

echo $out_str;

// ------------------------------------------------------------------
?>
