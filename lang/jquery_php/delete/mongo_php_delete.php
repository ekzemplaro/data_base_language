<?php
// ------------------------------------------------------------------
//	mongo_php_delete.php
//
//				Jun/10/2018
// ------------------------------------------------------------------
// $path=$_SERVER["DOCUMENT_ROOT"]."/data_base/common/php_common";
$path="/var/www/data_base/common/php_common";

set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include	"mongo_manipulate.php";
include "cgi_manipulate.php";

// ------------------------------------------------------------------
$arry_param = cgi_manipulate ();

$manager = new MongoDB\Driver\Manager("mongodb://localhost:27017");
$bulk = new MongoDB\Driver\BulkWrite;


$count = 0;

foreach ($arry_param as $id)
	{
	$bulk->delete(['key' => $id]);

	$count++;
	}

$result = $manager->executeBulkWrite('city_db.saitama', $bulk);

$out_str .= "OK " . $count;

echo $out_str;

// ------------------------------------------------------------------
?>
