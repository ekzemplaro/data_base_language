<?php
// ------------------------------------------------------------------
//	redis_php_delete.php
//
//				Jun/14/2013
// ------------------------------------------------------------------
// $path=$_SERVER["DOCUMENT_ROOT"]."/data_base/common/php_common";
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "kvalue_manipulate.php";
include "cgi_manipulate.php";

// ------------------------------------------------------------------
$redis = new Redis();
// $redis->connect('127.0.0.1', 6379);
$redis->connect('host_dbase', 6379);


$arry_param = cgi_manipulate ();

$count = 0;
$out_str = "";
foreach ($arry_param as $id)
	{

	kvalue_delete_proc ($redis,$id);

	$count++;
	}

$out_str .= "OK " . $count;

echo $out_str;

// ------------------------------------------------------------------
?>
