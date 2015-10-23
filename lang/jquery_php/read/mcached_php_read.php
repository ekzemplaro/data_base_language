<?php
// ---------------------------------------------------------------------
//	mcached_php_read.php
//
//					Oct/09/2014
//
// ---------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "kvalue_manipulate.php";

// ---------------------------------------------------------------------
$mc = new Memcached ();
$mc->addServer ("localhost",11211);

$keys = array ('t1731','t1732','t1733',
		't1734','t1735','t1736',
		't1737','t1738','t1739');

$dict_aa = kvalue_to_dict_proc ($mc,$keys);
$json_str = json_encode ($dict_aa);

echo $json_str;
// ---------------------------------------------------------------------
?>	
