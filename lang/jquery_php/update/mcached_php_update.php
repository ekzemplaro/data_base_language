<?php
// ------------------------------------------------------------------
//	jquery_php/update/mcached_php_update.php
//
//				Aug/22/2010
// ------------------------------------------------------------------
// $path=$_SERVER["DOCUMENT_ROOT"]."/data_base/common/php_common";
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "kvalue_manipulate.php";
include "cgi_manipulate.php";

// ------------------------------------------------------------------
$memc = memcache_connect('localhost', 11211);
$memc->addServer('localhost', 11211);


$arry_param = cgi_manipulate ();

$count = 0;
$out_str = "";

foreach ($arry_param as $val_aa)
	{
	$id = $val_aa['id'];
	$population = $val_aa['population'];

	kvalue_update_proc ($memc,$id,$population);

	$count++;
	}

$out_str .= "OK " . $count;

echo $out_str;

// ------------------------------------------------------------------
?>
