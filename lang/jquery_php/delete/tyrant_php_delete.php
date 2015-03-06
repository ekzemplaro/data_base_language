<?php
// ------------------------------------------------------------------
//	tyrant_php_delete.php
//
//				Feb/09/2015
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include	"cgi_manipulate.php";
include "kvalue_manipulate.php";
// ------------------------------------------------------------------
$mc = new Memcached();
$mc->addServer("host_ubuntu1", 1978);

$arry_param = cgi_manipulate ();

var_dump ($arry_param[0]);

foreach ($arry_param as $val_aa)
	{
	$id_in = $val_aa;

	kvalue_delete_proc ($mc,$id_in);
	}

$out_str = '*** OK ***';

echo $out_str;

// ------------------------------------------------------------------
?>
