#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	read/webdav_read.php
//
//					Mar/15/2013
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "curl_get.php";
include "text_manipulate.php";
// ------------------------------------------------------------------
print	"*** 開始 ***\n";

$url_in = 'http://host_dbase:3004/city/tokyo.json';
print	"url_in = " .$url_in . "\n";

$json_string = curl_get_proc ($url_in);

# print	$json_string;
$dict_aa = json_decode ($json_string,true);
dict_display_proc ($dict_aa);

print	"*** 終了 ***\n";

// ------------------------------------------------------------------

// ------------------------------------------------------------------
?>
