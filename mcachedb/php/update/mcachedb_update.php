#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	update/mcachedb_update.php
//
//					Sep/09/2010
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "kvalue_manipulate.php";

// ------------------------------------------------------------------
print "*** 開始 ***\n";

$id_in = $argv[1];
$population_in = $argv[2];
print	$id_in . "\t";
print	$population_in . "\n";

$memc = memcache_connect('localhost', 21201);
$memc->addServer('localhost', 21201);

kvalue_update_proc ($memc,$id_in,$population_in);


print "*** 終了 ***\n";
// ------------------------------------------------------------------
?>
