#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	php/delete/couch_delete.php
//
//					Jun/20/2014
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "curl_get.php";

// ------------------------------------------------------------------
$key_in = $argv[1];

print	"*** 開始 ***\n";

print	"key_in = " . $key_in . "\n";

$url_in = 'http://localhost:5984/nagano';
$url_target = $url_in . "/" . $key_in;
print	"url_in = " .$url_in . "\n";
//
$json_string = curl_get_proc ($url_target);
print $json_string . "\n";
$unit_aa = json_decode ($json_string,true);

if (isset ($unit_aa['_rev']))
	{
	print $unit_aa['name'] . "\n";
	print $unit_aa['_rev'] . "\n";

	$url_del = $url_target . "?rev=" . $unit_aa['_rev'];

	curl_delete_proc ($url_del);
	}

print	"*** 終了 ***\n";

// ------------------------------------------------------------------
?>
