<?php
// ------------------------------------------------------------------
//	jquery_php/read/webdav_php_read.php
//
//					Jan/24/2012
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "curl_get.php";
// ------------------------------------------------------------------
$url_in = 'http://host_dbase:3004/city/tokyo.json';

$json_string = curl_get_proc ($url_in);


// header ("Content-Type: text/javascript; charset=utf-8");

echo	$json_string;
// ------------------------------------------------------------------
?>
