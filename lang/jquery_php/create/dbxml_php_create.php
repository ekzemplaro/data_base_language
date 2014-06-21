<?php
// ------------------------------------------------------------------
//	jquery_php/read/dbxml_php_read.php
//
//					May/07/2010
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include	"curl_get.php";
// ------------------------------------------------------------------
$collections = 'cities';
$xml_file = 'cities.xml';

$url = 'http://scott:tiger@172.20.180.155:7280/rest/';
$url .= $collections . '/' . $xml_file;


$xml_string = curl_get_proc ($url);

$root = simplexml_load_string ($xml_string);

// header ("Content-Type: text/javascript; charset=utf-8");

// header("Content-Type: text/javascript; charset=utf-8");

echo	json_encode ($root);
// ------------------------------------------------------------------
?>
