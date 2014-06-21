#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	read/xindice_read.php
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

$name_in = 'cities';

print	"name_in = " .$name_in . "\n";

$url = 'http://host_dbase:8888/xindice/db/cities/' . $name_in;

$xml_string = curl_get_proc ($url);

//print	$xml_string;

$dict_aa = xml_to_dict_proc ($xml_string);

dict_display_proc ($dict_aa);
// print	$xml_string;

print	"*** 終了 ***\n";
// ------------------------------------------------------------------
?>
