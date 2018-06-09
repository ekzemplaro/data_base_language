<?php
// ---------------------------------------------------------------------
//	csv_php_create.php
//
//					Jun/13/2011
//
// ---------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include ("text_manipulate.php");
include ("file_io.php");
//
// ---------------------------------------------------------------------
$file_out = "/var/tmp/csv/cities.csv";


// --------------------------------------------------------------------

$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,"t1271",'千葉',65800,'2002-9-12');
$dict_aa = dict_append_proc ($dict_aa,"t1272",'勝浦',37400,'2002-8-18');
$dict_aa = dict_append_proc ($dict_aa,"t1273",'市原',57200,'2002-9-1');
$dict_aa = dict_append_proc ($dict_aa,"t1274",'流山',45300,'2002-10-29');
$dict_aa = dict_append_proc ($dict_aa,"t1275",'八千代',39700,'2002-7-14');
$dict_aa = dict_append_proc ($dict_aa,"t1276",'我孫子',28300,'2002-6-12');
$dict_aa = dict_append_proc ($dict_aa,"t1277",'鴨川',51200,'2002-4-17');
$dict_aa = dict_append_proc ($dict_aa,"t1278",'銚子',29700,'2002-3-8');
$dict_aa = dict_append_proc ($dict_aa,"t1279",'市川',17800,'2002-5-14');


print   $file_out . "\n";

csv_write_proc ($file_out,$dict_aa);

// ---------------------------------------


echo "*** csv_php_create *** OK ***";
// ---------------------------------------------------------------------
?>	
