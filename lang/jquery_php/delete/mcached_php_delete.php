<?php
// ------------------------------------------------------------------
//	mcached_php_delete.php
//
//				Oct/09/2014
// ------------------------------------------------------------------
//$path=$_SERVER["DOCUMENT_ROOT"]."/data_base/common/php_common";
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "kvalue_manipulate.php";
include "cgi_manipulate.php";

// ------------------------------------------------------------------
$mc = new Memcached ();
$mc->addServer ("localhost",11211);

$arry_param = cgi_manipulate ();

$count = 0;
$out_str = "";

foreach ($arry_param as $id)
	{
	kvalue_delete_proc ($mc,$id);

	$count++;
	}

$out_str .= "OK " . $count;

echo $out_str;

// ------------------------------------------------------------------
?>
