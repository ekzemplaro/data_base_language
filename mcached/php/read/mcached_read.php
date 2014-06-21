#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	read/mcached_read.php
//
//					Jul/23/2010
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "mcached_manipulate.php";
include "kvalue_manipulate.php";

// ------------------------------------------------------------------
$memc = memcache_connect('localhost', 11211);
$memc->addServer('localhost', 11211);

print "*** 開始 ***\n";

mcached_display_proc ($memc);

print "*** 終了 ***\n";
?>
