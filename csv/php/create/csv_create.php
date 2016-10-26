#! /usr/bin/php
<?php
//
//	csv_create.php
//
//					Oct/21/2016
//
// ----------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "text_manipulate.php";
include "file_io.php";
// ----------------------------------------------------------------
fputs (STDERR,"*** 開始 ***\n");

$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,'t1271','千葉',51769,'2002-9-8');
$dict_aa = dict_append_proc ($dict_aa,'t1272','勝浦',63473,'2002-8-12');
$dict_aa = dict_append_proc ($dict_aa,'t1273','市原',57182,'2002-6-1');
$dict_aa = dict_append_proc ($dict_aa,'t1274','流山',46359,'2002-10-29');
$dict_aa = dict_append_proc ($dict_aa,'t1275','八千代',32765,'2002-7-14');
$dict_aa = dict_append_proc ($dict_aa,'t1276','我孫子',29134,'2002-6-12');
$dict_aa = dict_append_proc ($dict_aa,'t1277','鴨川',82157,'2002-4-17');
$dict_aa = dict_append_proc ($dict_aa,'t1278','銚子',91548,'2002-2-24');
$dict_aa = dict_append_proc ($dict_aa,'t1279','市川',74256,'2002-11-12');


$file_out = $argv[1];

print	$file_out . "\n";

csv_write_proc ($file_out,$dict_aa);

fputs (STDERR,"*** 終了 ***\n");
// ----------------------------------------------------------------
?>
