<?php
// ---------------------------------------------------------------------
//	redis_php_read.php
//
//					Jun/14/2013
//
// ---------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "kvalue_manipulate.php";

// ---------------------------------------------------------------------
$redis = new Redis();
// $redis->connect('127.0.0.1', 6379);
$redis->connect('host_dbase', 6379);

$keys = $redis->getKeys ('t*');

$dict_aa = kvalue_to_dict_proc ($redis,$keys);

$json_str = json_encode ($dict_aa);

echo $json_str;
// ---------------------------------------------------------------------
?>	
