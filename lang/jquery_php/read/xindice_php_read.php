<?php
// ------------------------------------------------------------------
//	jquery_php/read/xindice_php_read.php
//
//					May/07/2010
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include	"curl_get.php";
// ------------------------------------------------------------------

$name_in = 'cities';
$url = 'http://cdbd026:8888/xindice/db/cities/' . $name_in;
$xml_string = curl_get_proc ($url);

$root = simplexml_load_string ($xml_string);

// header ("Content-Type: text/javascript; charset=utf-8");

// header("Content-Type: text/javascript; charset=utf-8");

echo	json_encode ($root);
// ------------------------------------------------------------------
?>
