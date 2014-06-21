#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	exist_update.php
//
//					Oct/13/2011
//
// ------------------------------------------------------------------
$path = "/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "curl_get.php";
include "xml_manipulate.php";
include "text_manipulate.php";
//
// ------------------------------------------------------------------
print "*** 開始 ***\n";

$id_in = $argv[1];
$population_in = $argv[2];
print	$id_in . "\t" . $population_in . "\n";
#
$uri= 'http://localhost:8086/exist/rest/db';
$collections = "cities";
$xml_filename = 'cities.xml';
$uri_aa = $uri . "/" . $collections . "/" . $xml_filename;

print	"$uri_aa = " .$uri_aa . "\n";

$xml_string = curl_get_proc ($uri_aa);

$dict_aa = xml_to_dict_proc ($xml_string);

$dict_bb = dict_update_proc ($dict_aa,$id_in,$population_in);
dict_display_proc ($dict_bb);

$str_xml = dict_to_xml_proc ($dict_bb);


curl_put_proc ($uri_aa,$str_xml);

print	"*** 終了 ***\n";
// ------------------------------------------------------------------
?>
