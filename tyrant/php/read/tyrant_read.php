#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	tyrant_read.php
//
//					Oct/07/2014
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "text_manipulate.php";
include "kvalue_manipulate.php";

// ------------------------------------------------------------------

$mc = new Memcached ();
$mc->addServer ("localhost",1978);

print "*** 開始 ***\n";

$keys = array ('t4761','t4762','t4763',
		't4764','t4765','t4766',
		't4767','t4768','t4769');

$dict_aa = kvalue_to_dict_proc ($mc,$keys);
dict_display_proc ($dict_aa);

print "*** 終了 ***\n";
?>
