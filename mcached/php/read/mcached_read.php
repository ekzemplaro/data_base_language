#! /usr/bin/php
<?php
//
//	mcached_read.php
//
//					Oct/07/2014
//
// ----------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "text_manipulate.php";
include "kvalue_manipulate.php";

// ----------------------------------------------------------------
print	"*** 開始 ***\n";

$mc = new Memcached ();
$mc->addServer ("localhost",11211);

$keys = $mc->getAllKeys();

$dict_aa = kvalue_to_dict_proc ($mc,$keys);
dict_display_proc ($dict_aa);

print	"*** 終了 ***\n";
// ----------------------------------------------------------------
?>
