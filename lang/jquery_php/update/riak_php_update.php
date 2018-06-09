<?php
// ------------------------------------------------------------------
//	jquery_php/update/riak_php_update.php
//
//				Mar/12/2013
// ------------------------------------------------------------------
// $path=$_SERVER["DOCUMENT_ROOT"]."/data_base/common/php_common";
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include	"curl_get.php";
include "cgi_manipulate.php";

// ------------------------------------------------------------------

$count = 0;
$arry_param = cgi_manipulate ();

$out_str = "AAA ";

foreach ($arry_param as $val_aa)
	{
	$id = $val_aa['id'];
	$population = $val_aa['population'];

	$url_target = 'http://localhost:8098/riak/shimane/' . $id;

	$json_city = curl_get_proc ($url_target);
	$city = json_decode ($json_city,true);

	if ($city != null)
		{
		$city['population'] = $population;
		$today = date ("Y-m-d");
		$city['date_mod'] = $today;
		$str_json = json_encode ($city);
		curl_put_proc ($url_target,$str_json);
		}

	$count++;

	$out_str .= $id . " --- ";
	}

$out_str .= "OK " . $count;

echo $out_str;

// ------------------------------------------------------------------
?>
