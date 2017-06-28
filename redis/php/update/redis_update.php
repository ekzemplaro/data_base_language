#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	update/redis_update.php
//
//					Jun/23/2017
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

$redis = new Redis();
$redis->connect('localhost', 6379);

kvalue_update_proc ($redis,$id_in,$population_in);

print "*** 終了 ***\n";
// ------------------------------------------------------------------
?>
