#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	delete/mcached_delete.php
//
//					Sep/08/2010
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

$memc = memcache_connect('localhost', 11211);
$memc->addServer('localhost', 11211);


kvalue_delete_proc ($memc,$id_in);

mcached_display_proc ($memc);

print "*** 終了 ***\n";
?>
