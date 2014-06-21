#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	xindice_delete.php
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
print	$id_in . "\n";
#
$uri= 'http://host_xindice:8888/xindice/db';

$collections = "cities";
$name_in = 'cities';

$uri_aa = $uri . "/" . $collections . "/" . $name_in;

print	"$uri_aa = " .$uri_aa . "\n";

$xml_string = curl_get_proc ($uri_aa);

$dict_aa = xml_to_dict_proc ($xml_string);

$dict_bb = dict_delete_proc ($dict_aa,$id_in);
dict_display_proc ($dict_bb);

$str_xml = dict_to_xml_proc ($dict_bb);

curl_put_proc ($uri_aa,$str_xml);

print	"*** 終了 ***\n";
// ------------------------------------------------------------------
?>
