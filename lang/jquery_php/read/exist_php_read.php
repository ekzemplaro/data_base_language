<?php
// ------------------------------------------------------------------
//	jquery_php/read/exist_php_read.php
//
//					May/25/2012
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include ("curl_get.php");
// ------------------------------------------------------------------
$uri= 'http://localhost:8086/exist/rest/db';
$collections = 'cities';
$xml_filename = 'cities.xml';
$uri_aa = $uri . "/" . $collections . "/" . $xml_filename;

$xml_string = curl_get_proc ($uri_aa);

$root = simplexml_load_string ($xml_string);

// header ("Content-Type: text/javascript; charset=utf-8");

// header("Content-Type: text/javascript; charset=utf-8");

echo	json_encode ($root);
// ------------------------------------------------------------------
?>
