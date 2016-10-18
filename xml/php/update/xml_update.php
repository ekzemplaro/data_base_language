#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	xml_update.php
//
//					Oct/18/2016
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "text_manipulate.php";
include "xml_manipulate.php";
include "file_io.php";

// ------------------------------------------------------------------
$xml_file = $argv[1];
$id_in = $argv[2];
$population_in = intval ($argv[3]);

fputs (STDERR,"*** 開始 ***\n");
echo	$xml_file . "\n";
echo	$id_in . "\t";
echo	$population_in . "\n";

$xml_string = file_get_contents ($xml_file);

$dict_aa = xml_to_dict_proc ($xml_string);

$dict_bb = dict_update_proc ($dict_aa,$id_in,$population_in);

$str_xml = dict_to_xml_proc ($dict_bb);

file_write_proc ($str_xml,$xml_file);

fputs (STDERR,"*** 終了 ***\n");
// ------------------------------------------------------------------
?>
