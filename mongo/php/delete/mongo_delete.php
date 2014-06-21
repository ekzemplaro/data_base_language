#! /usr/bin/php
<?php
// --------------------------------------------------------------------
/*
	mongo_delete.php

					Jun/26/2012

*/
// --------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "mongo_manipulate.php";
// --------------------------------------------------------------------
print	"*** 開始 ***\n";

$id_in = $argv[1];
print	$id_in . "\n";

$m = new Mongo();

$db = $m->city_db;

$col = $db->saitama;

mongo_delete_proc ($col,$id_in);

print	"*** 終了 ***\n";

// --------------------------------------------------------------------
?>
