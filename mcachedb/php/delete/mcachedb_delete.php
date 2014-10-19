#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	delete/mcachedb_delete.php
//
//					Oct/07/2014
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
$mc->addServer ("localhost",21201);

kvalue_delete_proc ($mc,$key_in);

print "*** 終了 ***\n";
// ------------------------------------------------------------------
?>
