#! /usr/bin/php
<?php
// --------------------------------------------------------------------
/*

	read/redis_read.php

					May/28/2013


*/
// --------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "kvalue_manipulate.php";

// --------------------------------------------------------------------
print	"*** 開始 ***\n";

$redis = new Redis();
#$redis->connect('127.0.0.1', 6379);
$redis->connect('host_dbase', 6379);

$keys = $redis->getKeys ('t*');

foreach ($keys as $key)
{
	kvalue_display_proc ($redis,$key);
}


print	"*** 終了 ***\n";
// --------------------------------------------------------------------
?>

