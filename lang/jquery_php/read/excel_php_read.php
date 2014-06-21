<?php
// ---------------------------------------------------------------------
//	excel_php_read.php
//
//					Jul/31/2011
//
// ---------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include ("text_manipulate.php");
include ("excel_manipulate.php");
//
// ---------------------------------------------------------------------
$file_excel = "/var/tmp/excel/cities.xls";


// --------------------------------------------------------------------


$dict_aa = excel_read_proc ($file_excel);

$json_str = json_encode ($dict_aa);


echo $json_str;
// ---------------------------------------------------------------------
?>	
