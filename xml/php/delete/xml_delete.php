#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	xml_delete.php
//
//					Oct/13/2011
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "xml_manipulate.php";
include "text_manipulate.php";
include "file_io.php";
// ------------------------------------------------------------------
$xml_file = $argv[1];
$id_in = $argv[2];

print	"*** 開始 ***\n";
print	$id_in . "\n";

$xml_string = file_get_contents ($xml_file);

$dict_aa = xml_to_dict_proc ($xml_string);

$dict_bb = dict_delete_proc ($dict_aa,$id_in);
dict_display_proc ($dict_bb);

$str_xml = dict_to_xml_proc ($dict_bb);

file_write_proc ($str_xml,$xml_file);

print	"*** 終了 ***\n";
// ------------------------------------------------------------------
?>
