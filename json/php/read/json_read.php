#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	data_base/json/php/read/json_read.php
//
//					Jun/13/2011
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "text_manipulate.php";
//
// ------------------------------------------------------------------

echo "*** 開始 ***\n";
$json_filename = $argv[1];

$json_string = file_get_contents ($json_filename);
$dict_aa = json_decode ($json_string,true);

// var_dump ($root);

dict_display_proc ($dict_aa);

echo "*** 終了 ***\n";

// ------------------------------------------------------------------
?>
