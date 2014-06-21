#! /usr/bin/php
<?php
// --------------------------------------------------------------------
/*

	php/delete/csv_delete.php

					Jul/02/2011

*/
// --------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);


include "text_manipulate.php";
include "file_io.php";
// --------------------------------------------------------------------
$file_in = $argv[1];
$id_in = $argv[2];

print	"*** 開始 ***\n";

print	$file_in . "\n";
print	$id_in . "\n";

$dict_aa = csv_read_proc ($file_in);
$dict_bb = dict_delete_proc ($dict_aa,$id_in);


dict_display_proc ($dict_bb);

csv_write_proc ($file_in,$dict_bb);

print	"*** 終了 ***\n";
/* -------------------------------------------------------------------- */
?>
