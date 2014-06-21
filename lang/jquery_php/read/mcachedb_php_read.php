<?php
// ---------------------------------------------------------------------
//	mcachedb_php_read.php
//
//					Jun/20/2011
//
// ---------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "kvalue_manipulate.php";

// ---------------------------------------------------------------------
$memc = memcache_connect('localhost', 21201);
$memc->addServer('localhost', 21201);

$keys = array ('t1521','t1522','t1523',
		't1524','t1525','t1526',
		't1527','t1528','t1529',
		't1530','t1531','t1532');

$dict_aa = kvalue_to_dict_proc ($memc,$keys);
$json_str = json_encode ($dict_aa);

echo $json_str;
// ---------------------------------------------------------------------
?>	
