<?php
// ------------------------------------------------------------------
//	jquery_php/read/couch_php_read.php
//
//					May/06/2015
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "curl_get.php";
include "text_manipulate.php";
include "couch_manipulate.php";
// ------------------------------------------------------------------
$url_collection = 'http://localhost:5984/nagano';

$dict_aa=couch_to_dict_proc ($url_collection);

$json_out = json_encode ($dict_aa);

// header ("Content-Type: text/javascript; charset=utf-8");

echo	$json_out;
// ------------------------------------------------------------------
?>
