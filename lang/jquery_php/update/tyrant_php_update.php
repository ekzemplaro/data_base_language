<?php
// ------------------------------------------------------------------
//	tyrant_php_update.php
//
//				Oct/09/2014
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include	"cgi_manipulate.php";
include "kvalue_manipulate.php";

// ------------------------------------------------------------------
$mc = new Memcached();
$mc->addServer ("localhost",1978);

$arry_param = cgi_manipulate ();


foreach ($arry_param as $val_aa)
	{
	$id_in = $val_aa['id'];
	$population_in = $val_aa['population'];

	kvalue_update_proc ($mc,$id_in,$population_in);
	}

$out_str .= "*** OK ***";

echo $out_str;

// ------------------------------------------------------------------
?>
