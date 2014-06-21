<?php
// ------------------------------------------------------------------
//	riak_php_delete.php
//
//				Mar/12/2013
// ------------------------------------------------------------------
// $path=$_SERVER["DOCUMENT_ROOT"]."/data_base/common/php_common";
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include	"curl_get.php";
include "text_manipulate.php";
include "cgi_manipulate.php";

// ------------------------------------------------------------------
$arry_param = cgi_manipulate ();

$out_str = "";

foreach ($arry_param as $id)
	{
	echo "check bbb $id<br />";

	$url_target = 'http://localhost:8098/riak/shimane/' . $id;

	curl_delete_proc ($url_target);
	}

$out_str .= "*** OK *** " . $count;

echo $out_str;

// ------------------------------------------------------------------
?>
