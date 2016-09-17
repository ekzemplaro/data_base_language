#! /usr/bin/php
<?php
// --------------------------------------------------------------------
/*

	php/delete/text_delete.php

					Sep/15/2016

*/
// --------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);


include "text_manipulate.php";
include "file_io.php";
// --------------------------------------------------------------------
$file_in = $argv[1];
$id_in = $argv[2];

fputs (STDERR,"*** 開始 ***\n");

print	$file_in . "\n";
print	$id_in . "\n";

$dict_aa = text_read_proc ($file_in);
$dict_bb = dict_delete_proc ($dict_aa,$id_in);

text_write_proc ($file_in,$dict_bb);

fputs (STDERR,"*** 終了 ***\n");
/* -------------------------------------------------------------------- */
?>
