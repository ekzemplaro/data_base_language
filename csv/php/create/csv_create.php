#! /usr/bin/php
<?php
//
//	csv_create.php
//
//					Jul/02/2011
//
// ----------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "text_manipulate.php";
include "file_io.php";
// ----------------------------------------------------------------
print	"*** 開始 ***\n";

$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,'t1271','千葉',51462,'2002-9-8');
$dict_aa = dict_append_proc ($dict_aa,'t1272','勝浦',63473,'2002-8-12');
$dict_aa = dict_append_proc ($dict_aa,'t1273','市原',57282,'2002-9-01');
$dict_aa = dict_append_proc ($dict_aa,'t1274','流山',46399,'2002-10-29');
$dict_aa = dict_append_proc ($dict_aa,'t1275','八千代',35765,'2002-7-14');
$dict_aa = dict_append_proc ($dict_aa,'t1276','我孫子',24134,'2002-6-12');
$dict_aa = dict_append_proc ($dict_aa,'t1277','鴨川',82187,'2002-4-17');
$dict_aa = dict_append_proc ($dict_aa,'t1278','銚子',98518,'2002-3-24');
$dict_aa = dict_append_proc ($dict_aa,'t1279','市川',94256,'2002-10-12');


$file_out = $argv[1];

print	$file_out . "\n";

csv_write_proc ($file_out,$dict_aa);

print	"*** 終了 ***\n";
?>
