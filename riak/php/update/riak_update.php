#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	php/update/riak_update.php
//
//					Feb/09/2015
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "curl_get.php";
// ------------------------------------------------------------------
print	"*** 開始 ***\n";

$key_in = $argv[1];
$population_in = $argv[2];

print	"key_in = " .$key_in . "\n";
print	$population_in . "\n";

$url_target = 'http://host_ubuntu1:8098/riak/shimane/' . $key_in;

$json_city = curl_get_proc ($url_target);
$city = json_decode ($json_city,true);
if ($city != null)
	{
	print $city['population'] . "\n";
	$city['population'] = $population_in;
	date_default_timezone_set('Asia/Tokyo');
	$today = date ("Y-m-d");
	$city['date_mod'] = $today;
	$str_json = json_encode ($city);
	curl_put_proc ($url_target,$str_json);
	}

print	"*** 終了 ***\n";

// ------------------------------------------------------------------
?>
