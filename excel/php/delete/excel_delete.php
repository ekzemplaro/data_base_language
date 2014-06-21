#! /usr/bin/php
<?php
//
//	excel_delete.php
//
//					Apr/15/2011
//
// ----------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "text_manipulate.php";
include "excel_manipulate.php";
// ----------------------------------------------------------------
print "*** 開始 ***\n";

$file_excel = $argv[1];
$id_in = $argv[2];
#
print $file_excel . "\n";
print	$id_in . "\n";


$dict_aa = excel_read_proc ($file_excel);

$dict_bb = dict_delete_proc ($dict_aa,$id_in);

dict_display_proc ($dict_bb);

excel_write_proc ($file_excel,$dict_bb);

echo " Peak memory usage: " . (memory_get_peak_usage(true) / 1024 / 1024) . " MB\r\n";

print "*** 終了 ***\n";

// ----------------------------------------------------------------
?>
