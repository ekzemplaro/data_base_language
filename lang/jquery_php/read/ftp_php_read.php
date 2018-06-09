<?php
// ------------------------------------------------------------------
//	jquery_php/read/ftp_php_read.php
//
//					Oct/02/2012
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "curl_get.php";
// ------------------------------------------------------------------
$url_in = 'ftp://scott:tiger@host_dbase/city/iwate.json';

$json_string = curl_get_proc ($url_in);


echo	$json_string;
// ------------------------------------------------------------------
?>
