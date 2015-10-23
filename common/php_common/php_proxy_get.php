<?php
// ------------------------------------------------------------------
//	php_proxy_get.php
//
//					Jan/17/2011
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "curl_get.php";
// ------------------------------------------------------------------
$url_in = $_GET['url'];

$data_string = curl_get_proc ($url_in);


// header ("Content-Type: text/javascript; charset=utf-8");

echo	$data_string;
// ------------------------------------------------------------------
?>
