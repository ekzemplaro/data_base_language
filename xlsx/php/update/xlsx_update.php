#! /usr/bin/php
<?php
//
//	xlsx_update.php
//
//					Sep/09/2018
//
// ----------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "text_manipulate.php";
include "xlsx_manipulate.php";
// ----------------------------------------------------------------
fputs (STDERR,"*** 開始 ***\n");
date_default_timezone_set('Asia/Tokyo');

$file_xlsx = $argv[1];
$id_in = $argv[2];
$population_in = $argv[3];
#
print $file_xlsx . "\n";
print	$id_in . "\t";
print	$population_in . "\n";


$dict_aa = xlsx_read_proc ($file_xlsx);

$dict_bb = dict_update_proc ($dict_aa,$id_in,$population_in);

xlsx_write_proc ($file_xlsx,$dict_bb);

echo " Peak memory usage: " . (memory_get_peak_usage(true) / 1024 / 1024) . " MB\n";

fputs (STDERR,"*** 終了 ***\n");

// ----------------------------------------------------------------
?>
