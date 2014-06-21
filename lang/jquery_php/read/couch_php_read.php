<?php
// ------------------------------------------------------------------
//	jquery_php/read/couch_php_read.php
//
//					Jun/20/2014
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "curl_get.php";
// ------------------------------------------------------------------
$url_in = 'http://localhost:5984/nagano';

$json_string = curl_get_proc ($url_in . "/_all_docs");

$list_aa = json_decode ($json_string,true);

$rows = $list_aa['rows'];
$dict_aa = array ();
foreach ($rows as $unit)
	{
	$key = $unit['key'];
	$json_string = curl_get_proc ($url_in . "/" . $key);
	$unit_aa = json_decode ($json_string,true);
	$dict_aa[$key]= $unit_aa;
	}

$json_out = json_encode ($dict_aa);

// header ("Content-Type: text/javascript; charset=utf-8");

echo	$json_out;
// ------------------------------------------------------------------
?>
