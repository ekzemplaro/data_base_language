<?php
// ------------------------------------------------------------------
//	jquery_php/update/mongo_php_update.php
//
//				Jun/10/2018
// ------------------------------------------------------------------
//$path=$_SERVER["DOCUMENT_ROOT"]."/data_base/common/php_common";
$path="/var/www/data_base/common/php_common";

set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include	"mongo_manipulate.php";
include "cgi_manipulate.php";

// ------------------------------------------------------------------
$manager = new MongoDB\Driver\Manager("mongodb://localhost:27017");

$bulk = new MongoDB\Driver\BulkWrite;

date_default_timezone_set('Asia/Tokyo');
$today = date ("Y-m-d");

$arry_param = cgi_manipulate ();

$count = 0;

foreach ($arry_param as $val_aa)
	{
	$id = $val_aa['id'];
	$population = $val_aa['population'];

	$newdata = array('$set' => array("population" => $population,"date_mod" => $today));

	$bulk->update(array("key" => $id), $newdata);

	$count++;
	}

$manager->executeBulkWrite('city_db.saitama', $bulk);

$out_str .= "OK " . $count;

echo $out_str;

// ------------------------------------------------------------------
?>
