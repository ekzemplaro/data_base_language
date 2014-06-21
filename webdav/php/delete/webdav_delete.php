#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	delete/webdav_delete.php
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
$id_in = $argv[1];

print	"*** 開始 ***\n";

print	"id_in = " .$id_in . "\n";

$url_in = 'http://host_dbase:3004/city/tokyo.json';
print	"url_in = " .$url_in . "\n";
//
$json_string = curl_get_proc ($url_in);
//
$dict_aa = json_decode ($json_string,true);
//
$dict_bb=dict_delete_proc ($dict_aa,$id_in);

dict_display_proc ($dict_bb);

$js_out = json_encode ($dict_bb);

curl_upload_proc ($url_in,$js_out);

print	"*** 終了 ***\n";

// ------------------------------------------------------------------
?>
