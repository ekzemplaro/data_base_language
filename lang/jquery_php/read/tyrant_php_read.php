<?php
// ---------------------------------------------------------------------
//	tyrant_php_read.php
//
//					Feb/09/2015
//
// ---------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "kvalue_manipulate.php";

// ---------------------------------------------------------------------
$mc = new Memcached ();
$mc->addServer ("host_ubuntu1",1978);

$keys = array ('t4761','t4762','t4763',
		't4764','t4765','t4766',
		't4767','t4768','t4769');

$dict_aa = kvalue_to_dict_proc ($mc,$keys);
$json_str = json_encode ($dict_aa);

echo $json_str;
// ---------------------------------------------------------------------
?>	
