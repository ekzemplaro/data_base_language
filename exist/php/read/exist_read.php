#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	exist_read.php
//
//					Oct/13/2011
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "curl_get.php";
include "xml_manipulate.php";
include "text_manipulate.php";
// ------------------------------------------------------------------
//
print	"*** 開始 ***\n";
//
$uri= "http://localhost:8086/exist/rest";
//$uri= "http://localhost:8086/exist/rest/db";
// $uri= "http://host_dbase:8086/exist/rest/db";
//$uri= "http://cddn007:8086/exist/rest/db";

$collections = "cities";
// $xml_filename = "cities.xml";
$xml_filename = "nagasaki.xml";
$uri_aa = $uri . "/" . $collections . "/" . $xml_filename;

// print	"uri_aa = " .$uri_aa . "\n";

$xml_string = curl_get_proc ($uri_aa);

$dict_aa = xml_to_dict_proc ($xml_string);

dict_display_proc ($dict_aa);

print	"*** 終了 ***\n";
// ------------------------------------------------------------------
?>
