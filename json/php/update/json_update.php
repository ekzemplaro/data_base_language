#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	update/json_update.php
//
//					Apr/25/2011
//
// ------------------------------------------------------------------
$path = "/var/www/data_base/common/php_common";

set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "file_io.php";
include "text_manipulate.php";
// ------------------------------------------------------------------

echo "*** 開始 ***\n";
$json_filename = $argv[1];
$id_in = $argv[2];
$population_in = $argv[3];

print	$json_filename . "\n";
print	$id_in . "\t";
print	$population_in . "\n";


$json_string = file_get_contents ($json_filename);
$dict_aa = json_decode ($json_string,true);

// var_dump ($dict_aa);

$dict_bb = dict_update_proc ($dict_aa,$id_in,$population_in);

echo "-----------------------\n";

dict_display_proc ($dict_bb);

$js_out = json_encode ($dict_bb);

file_write_proc ($js_out,$json_filename);

echo "*** 終了 ***\n";

// ------------------------------------------------------------------
?>
