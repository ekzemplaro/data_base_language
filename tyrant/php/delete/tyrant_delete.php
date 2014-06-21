#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	tyrant_delete.php
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
print "*** 開始 ***\n";

$id_in = $argv[1];
print	$id_in . "\n";

$memc = memcache_connect('localhost', 1978);
$memc->addServer('localhost', 1978);

kvalue_delete_proc ($memc,$id_in);

print "*** 終了 ***\n";
?>
