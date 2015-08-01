#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	update/mcachedb_update.php
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
$population_in = $argv[2];
print	$key_in . "\t";
print	$population_in . "\n";


$mc = new Memcached();
$mc->addServer ("ubuntu_1504",21201);

kvalue_update_proc ($mc,$key_in,$population_in);


print "*** 終了 ***\n";
// ------------------------------------------------------------------
?>
