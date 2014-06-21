#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	xindice_update.php
//
//					Oct/13/2011
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "xml_manipulate.php";
include "text_manipulate.php";
include "curl_get.php";
// ------------------------------------------------------------------
print "*** 開始 ***\n";
$id_in = $argv[1];
$population_in = $argv[2];
print	$id_in . "\t" . $population_in . "\n";
#
$name_in = 'cities';

print	"name_in = " .$name_in . "\n";

$url = 'http://host_xindice:8888/xindice/db/cities/' . $name_in;

$xml_string = curl_get_proc ($url);

$dict_aa = xml_to_dict_proc ($xml_string);

$dict_bb = dict_update_proc ($dict_aa,$id_in,$population_in);
dict_display_proc ($dict_bb);

$str_xml = dict_to_xml_proc ($dict_bb);

curl_put_proc ($url,$str_xml);

print	"*** 終了 ***\n";
// ------------------------------------------------------------------
?>
