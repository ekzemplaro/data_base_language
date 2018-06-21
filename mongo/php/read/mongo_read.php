#! /usr/bin/php
<?php
// --------------------------------------------------------------------
/*
	read/mongo_read.php

					Jun/21/2018

*/
// --------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "text_manipulate.php";
// include "mongo_manipulate.php";
// --------------------------------------------------------------------
fputs (STDERR,"*** 開始 ***\n");

$str_connect = "mongodb://scott:tiger123@localhost:27017";
$manager = new MongoDB\Driver\Manager($str_connect);

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

dict_display_proc ($dict_aa);

fputs (STDERR,"*** 終了 ***\n");

// --------------------------------------------------------------------
?>
