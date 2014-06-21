<?php
// ------------------------------------------------------------------
//	jquery_php/update/couch_php_update.php
//
//				Jun/20/2014
// ------------------------------------------------------------------
// $path=$_SERVER["DOCUMENT_ROOT"]."/data_base/common/php_common";
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include	"curl_get.php";
include "text_manipulate.php";
include "cgi_manipulate.php";

// ------------------------------------------------------------------
$url_in = 'http://localhost:5984/nagano';

$count = 0;
$arry_param = cgi_manipulate ();

$out_str = "AAA ";

foreach ($arry_param as $val_aa)
	{
	$key_in = $val_aa['id'];
	$url_target = $url_in . "/" . $key_in;

	$json_string = curl_get_proc ($url_target);

	$unit_aa = json_decode ($json_string,true);

	$population_in = $val_aa['population'];

	$unit_aa['population'] = $population_in;
	$today = date ("Y-m-d");
	$unit_aa['date_mod'] = $today;
	$js_out = json_encode ($unit_aa);

	curl_put_proc ($url_target,$js_out);

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
