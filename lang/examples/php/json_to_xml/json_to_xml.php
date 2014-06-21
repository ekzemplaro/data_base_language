#! /usr/bin/php
<?php
// --------------------------------------------------------------------
//
//	json_to_xml.php
//
//						Apr/03/2012
//
// --------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "text_manipulate.php";
include "xml_manipulate.php";
// --------------------------------------------------------------------
$json_filename = $argv[1];

$json_string = file_get_contents ($json_filename);

$dict_aa = json_decode ($json_string,true);

$str_xml = dict_to_xml_proc ($dict_aa);

print $str_xml;

// --------------------------------------------------------------------
?>

