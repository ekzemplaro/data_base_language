#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	read/mcachedb_read.php
//
//					Oct/07/2014
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "kvalue_manipulate.php";
include "text_manipulate.php";

// ------------------------------------------------------------------
$mc = new Memcached ();
$mc->addServer ("localhost",21201);

print "*** 開始 ***\n";

$keys = array ('t1521','t1522','t1523',
		't1524','t1525','t1526',
		't1527','t1528','t1529',
		't1530','t1531','t1532');

$dict_aa = kvalue_to_dict_proc ($mc,$keys);
dict_display_proc ($dict_aa);

print "*** 終了 ***\n";
// ------------------------------------------------------------------
?>
