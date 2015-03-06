#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	php/read/riak_read.php
//
//					Feb/09/2015
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "curl_get.php";
include "text_manipulate.php";
// ------------------------------------------------------------------
print	"*** 開始 ***\n";

$url_base = 'http://host_ubuntu1:8098/riak/shimane';
$url_in = $url_base . '?keys=true';

$json_string = curl_get_proc ($url_in);

$data_aa = json_decode ($json_string,true);

$dict_aa = array ();

$count = count($data_aa['keys']);
for ($it = 0; $it < $count; $it++)
	{
	$key = $data_aa['keys'][$it];
	$url_city = $url_base . '/' . $key;
	$json_city = curl_get_proc ($url_city);
	$city = json_decode ($json_city,true);
	if ($city != null)
		{
		$dict_aa[$key] = $city;
		}
	}

dict_display_proc ($dict_aa);

print	"*** 終了 ***\n";

// ------------------------------------------------------------------
?>
