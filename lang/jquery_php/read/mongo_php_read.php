<?php
// ---------------------------------------------------------------------
//	mongo_php_read.php
//
//					Jun/09/2018
//
// ---------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include ("text_manipulate.php");
include ("mongo_manipulate.php");
//
// ---------------------------------------------------------------------
$manager = new MongoDB\Driver\Manager("mongodb://localhost:27017");

$filter = [];
$options = [
	'projection' => ['_id' => 0],
	'sort' => ['_id' => -1],
];

$query = new MongoDB\Driver\Query($filter, $options);
$cursor = $manager->executeQuery('city_db.saitama', $query);

$dict_aa = array ();

foreach ($cursor as $document) {
	$dict_aa = dict_append_proc ($dict_aa,$document->key,$document->name,$document->population,$document->date_mod);

}

$json_str = json_encode ($dict_aa);

echo $json_str;
// ---------------------------------------------------------------------
?>	
