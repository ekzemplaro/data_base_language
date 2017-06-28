#! /usr/bin/php
<?php
// --------------------------------------------------------------------
/*

	read/redis_read.php

					Jun/23/2017


*/
// --------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "kvalue_manipulate.php";
include "text_manipulate.php";

// --------------------------------------------------------------------
print	"*** 開始 ***\n";

$redis = new Redis();
$redis->connect('localhost', 6379);

$keys = $redis->getKeys ('t*');

$dict_aa = kvalue_to_dict_proc ($redis,$keys);
dict_display_proc ($dict_aa);

print	"*** 終了 ***\n";
// --------------------------------------------------------------------
?>

