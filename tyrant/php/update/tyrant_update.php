#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	tyrant_update.php
//
//					Jun/20/2011
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "mcached_manipulate.php";
include "kvalue_manipulate.php";

// ------------------------------------------------------------------
$memc = memcache_connect('localhost', 1978);
$memc->addServer('localhost', 1978);

print "*** 開始 ***\n";

$id_in = $argv[1];
$population_in = $argv[2];
print	$id_in . "\t";
print	$population_in . "\n";

kvalue_update_proc ($memc,$id_in,$population_in);

print "*** 終了 ***\n";
?>
