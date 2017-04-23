<?php
// ---------------------------------------------------------------------
//	text_php_read.php
//
//					Sep/05/2012
//
// ---------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include ("text_manipulate.php");

// ---------------------------------------------------------------------
$file_in = "/var/tmp/plain_text/cities.txt";
// $file_in = "tmp/plain_text/cities.txt";

$dict_aa = text_read_proc ($file_in);

$json_str = json_encode ($dict_aa);

echo $json_str;
// ---------------------------------------------------------------------
?>	
