<?php
// ------------------------------------------------------------------
//	jquery_php/update/webdav_php_update.php
//
//				Jun/20/2012
// ------------------------------------------------------------------
// $path=$_SERVER["DOCUMENT_ROOT"]."/data_base/common/php_common";
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include	"curl_get.php";
include "text_manipulate.php";
include "cgi_manipulate.php";

// ------------------------------------------------------------------
$url_in = 'http://host_dbase:3004/city/tokyo.json';
$json_string = curl_get_proc ($url_in);
$dict_aa = json_decode ($json_string,true);

$count = 0;
$arry_param = cgi_manipulate ();

$out_str = "AAA ";

foreach ($arry_param as $val_aa)
	{
	$id = $val_aa['id'];
	$population = $val_aa['population'];

	$dict_aa = dict_update_proc
			($dict_aa,$id,$population);

	$count++;

	$out_str .= $id . " --- ";
	}

$js_out = json_encode ($dict_aa);

curl_put_proc ($url_in,$js_out);

$out_str .= "OK " . $count;

echo $js_out;

echo $out_str;

// ------------------------------------------------------------------
?>
