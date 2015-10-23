<?php
// ---------------------------------------------------------------------
//	xlsx_php_read.php
//
//					Aug/19/2013
//
// ---------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include ("text_manipulate.php");
include ("excel_manipulate.php");
//
// ---------------------------------------------------------------------
$file_xlsx = "/var/tmp/xlsx/cities.xlsx";


// --------------------------------------------------------------------


$dict_aa = excel_read_proc ($file_xlsx);

$json_str = json_encode ($dict_aa);


echo $json_str;
// ---------------------------------------------------------------------
?>	
