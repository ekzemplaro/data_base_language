#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	php/read/couch_read.php
//
//					Jun/20/2014
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "curl_get.php";
// include "text_manipulate.php";
// ------------------------------------------------------------------
print	"*** 開始 ***\n";

$url_in = 'http://localhost:5984/nagano';
print	"url_in = " .$url_in . "\n";

$json_string = curl_get_proc ($url_in . "/_all_docs");

// print $json_string;

$list_aa = json_decode ($json_string,true);

$rows = $list_aa['rows'];

// var_dump ($rows[0]);
// var_dump ($rows[0]['key']);

foreach ($rows as $unit)
	{
	$key = $unit['key'];
	$json_string = curl_get_proc ($url_in . "/" . $key);
	$unit_aa = json_decode ($json_string,true);
	print $key . "\t";
	print $unit_aa['name'] . "\t";
	print $unit_aa['population'] . "\t";
	print $unit_aa['date_mod'] . "\n";
	}

print	"*** 終了 ***\n";

// ------------------------------------------------------------------
?>
