#! /usr/bin/php
<?php
// --------------------------------------------------------------------
/*
	mongo_delete.php

					Jun/02/2018

*/
// --------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

//include "mongo_manipulate.php";
// --------------------------------------------------------------------
fputs (STDERR,"*** 開始 ***\n");

$id_in = $argv[1];
print	$id_in . "\n";

$manager = new MongoDB\Driver\Manager("mongodb://localhost:27017");
$bulk = new MongoDB\Driver\BulkWrite;

$bulk->delete(['key' => $id_in]);

$result = $manager->executeBulkWrite('city_db.saitama', $bulk);

fputs (STDERR,"*** 終了 ***\n");
// --------------------------------------------------------------------
?>
