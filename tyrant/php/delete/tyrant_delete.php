#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	tyrant_delete.php
//
//					Feb/06/2015
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "kvalue_manipulate.php";

// ------------------------------------------------------------------
print "*** 開始 ***\n";

$key_in = $argv[1];
print	$key_in . "\n";

$mc = new Memcached();
$mc->addServer("host_ubuntu1", 1978);

kvalue_delete_proc ($mc,$key_in);

print "*** 終了 ***\n";
// ------------------------------------------------------------------
?>
