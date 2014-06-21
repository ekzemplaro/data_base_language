#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	data_base/xml/php/xml_read.php
//
//					Oct/13/2011
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
include "text_manipulate.php";
include "xml_manipulate.php";

// ------------------------------------------------------------------
$xml_filename = $argv[1];

print	"*** 開始 ***\n";

$xml_string = file_get_contents ($xml_filename);

$dict_aa = xml_to_dict_proc ($xml_string);

dict_display_proc ($dict_aa);

print	"*** 終了 ***\n";
// ------------------------------------------------------------------
?>
