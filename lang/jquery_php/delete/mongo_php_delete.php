<?php
// ------------------------------------------------------------------
//	mongo_php_delete.php
//
//				Jun/26/2012
// ------------------------------------------------------------------
// $path=$_SERVER["DOCUMENT_ROOT"]."/data_base/common/php_common";
$path="/var/www/data_base/common/php_common";

set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include	"mongo_manipulate.php";
include "cgi_manipulate.php";

// ------------------------------------------------------------------
$mm = new Mongo();
$db = $mm->city_db;
$col = $db->saitama;


$arry_param = cgi_manipulate ();


foreach ($arry_param as $id)
	{
	mongo_delete_proc ($col,$id);

	$count++;
	}

$out_str .= "OK " . $count;

echo $out_str;

// ------------------------------------------------------------------
?>
