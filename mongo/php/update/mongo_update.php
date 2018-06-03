#! /usr/bin/php
<?php
// --------------------------------------------------------------------
/*
	mongo_update.php

					Jun/02/2018

*/
// --------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "mongo_manipulate.php";
// --------------------------------------------------------------------
fputs (STDERR,"*** 開始 ***\n");


$id_in = $argv[1];
$population_in = $argv[2];
print	$id_in . "\t";
print	$population_in . "\n";

$manager = new MongoDB\Driver\Manager("mongodb://localhost:27017");

$bulk = new MongoDB\Driver\BulkWrite;

date_default_timezone_set('Asia/Tokyo');
$today = date ("Y-m-d");

$newdata = array('$set' => array("population" => $population_in,"date_mod" => $today));

$bulk->update(array("key" => $id_in), $newdata);

$manager->executeBulkWrite('city_db.saitama', $bulk);

fputs (STDERR,"*** 終了 ***\n");

// --------------------------------------------------------------------
