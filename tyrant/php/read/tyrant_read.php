#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	tyrant_read.php
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

$keys = array ('t4761','t4762','t4763',
		't4764','t4765','t4766',
		't4767','t4768','t4769');

foreach ($keys as $key)
{
	kvalue_display_proc ($memc,$key);
}

print "*** 終了 ***\n";
?>
