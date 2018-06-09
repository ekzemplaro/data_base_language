<?php
// ---------------------------------------------------------------------
//	csv_php_read.php
//
//					May/09/2011
//
// ---------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include ("text_manipulate.php");
//
// ---------------------------------------------------------------------
$file_in = "/var/tmp/csv/cities.csv";

$dict_aa = csv_read_proc ($file_in);

$json_str = json_encode ($dict_aa);

echo $json_str;
// ---------------------------------------------------------------------
?>	
