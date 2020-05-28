#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	data_base/json/php/read/json_read.php
//
//					Sep/15/2016
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include_once "text_manipulate.php";
//
// ------------------------------------------------------------------
fputs (STDERR,"*** 開始 ***\n");
$json_filename = $argv[1];

$json_string = file_get_contents ($json_filename);
$dict_aa = json_decode ($json_string,true);

// var_dump ($root);

dict_display_proc ($dict_aa);

fputs (STDERR,"*** 終了 ***\n");

// ------------------------------------------------------------------
?>
