#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	php/update/couch_update.php
//
//					Jun/20/2014
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

print	$key_in . "\t";
print	$population_in . "\n";

$url_in = 'http://localhost:5984/nagano';
$url_target = $url_in . "/" . $key_in;
print	"url_in = " .$url_in . "\n";

$json_string = curl_get_proc ($url_target);

print $json_string . "\n";
$unit_aa = json_decode ($json_string,true);
print $unit_aa['name'] . "\n";

$unit_aa['population'] = $population_in;
$today = date ("Y-m-d");
$unit_aa['date_mod'] = $today;
$js_out = json_encode ($unit_aa);
print $js_out . "\n";
curl_put_proc ($url_target,$js_out);

print	"*** 終了 ***\n";

// ------------------------------------------------------------------
?>
