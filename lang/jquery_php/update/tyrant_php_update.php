<?php
// ------------------------------------------------------------------
//	tyrant_php_update.php
//
//				Oct/11/2011
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include	"cgi_manipulate.php";
include "mcached_manipulate.php";
include "kvalue_manipulate.php";

// ------------------------------------------------------------------
$memc = memcache_connect('localhost', 1978);
$memc->addServer('localhost', 1978);

$arry_param = cgi_manipulate ();


foreach ($arry_param as $val_aa)
	{
	$id_in = $val_aa['id'];
	$population_in = $val_aa['population'];

	kvalue_update_proc ($memc,$id_in,$population_in);
	}

$out_str .= "*** OK ***";

echo $out_str;

// ------------------------------------------------------------------
?>
