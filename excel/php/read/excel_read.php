#! /usr/bin/php
<?php
//
//	excel_read.php
//
//					Apr/14/2011
//
// ----------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "text_manipulate.php";
include "excel_manipulate.php";
// ----------------------------------------------------------------
print "*** 開始 ***\n";

$file_in = $argv[1];
#
print $file_in . "\n";

$dict_aa = excel_read_proc ($file_in);

dict_display_proc ($dict_aa);

echo " Peak memory usage: " . (memory_get_peak_usage(true) / 1024 / 1024) . " MB\r\n";

print "*** 終了 ***\n";

// ----------------------------------------------------------------
?>
