#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	delete/redis_delete.php
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
print	$id_in . "\n";

$redis = new Redis();
$redis->connect('localhost', 6379);

kvalue_delete_proc ($redis,$id_in);

// mcached_display_proc ($redis);

print "*** 終了 ***\n";
// ------------------------------------------------------------------
?>
