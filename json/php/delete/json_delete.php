#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	json_delete.php
//
//					Sep/15/2016
//
// ------------------------------------------------------------------
$path = "/var/www/data_base/common/php_common";

set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "file_io.php";
include "text_manipulate.php";
// ------------------------------------------------------------------
fputs (STDERR,"*** 開始 ***\n");
$json_filename = $argv[1];
$id_in = $argv[2];

echo	$json_filename . "\n";
echo	$id_in . "\n";

$json_string = file_get_contents ($json_filename);
$dict_aa = json_decode ($json_string,true);

$dict_bb = dict_delete_proc ($dict_aa,$id_in);

$js_out = json_encode ($dict_bb);

file_write_proc ($js_out,$json_filename);

fputs (STDERR,"*** 終了 ***\n");

// ------------------------------------------------------------------
?>
