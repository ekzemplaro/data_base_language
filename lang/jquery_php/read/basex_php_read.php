<?php
// ------------------------------------------------------------------
//	jquery_php/read/basex_php_read.php
//
//					Feb/02/2012
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include	"curl_get.php";
// ------------------------------------------------------------------

$url = 'http://admin:admin@localhost:8984/rest/cities?query=/';
$xml_string = curl_get_proc ($url);

$root = simplexml_load_string ($xml_string);

// header ("Content-Type: text/javascript; charset=utf-8");

// header("Content-Type: text/javascript; charset=utf-8");

echo	json_encode ($root);
// ------------------------------------------------------------------
?>
