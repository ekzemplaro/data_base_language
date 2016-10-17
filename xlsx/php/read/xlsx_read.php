#! /usr/bin/php
<?php
//
//	xlsx_read.php
//
//					Oct/16/2016
//
// ----------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "text_manipulate.php";
include "excel_manipulate.php";
// ----------------------------------------------------------------
fputs (STDERR,"*** 開始 ***\n");

date_default_timezone_set('Asia/Tokyo');

$file_in = $argv[1];
#
print $file_in . "\n";

$dict_aa = excel_read_proc ($file_in);

dict_display_proc ($dict_aa);

echo " Peak memory usage: " . (memory_get_peak_usage(true) / 1024 / 1024) . " MB\r\n";

fputs (STDERR, "*** 終了 ***\n");

// ----------------------------------------------------------------
?>
