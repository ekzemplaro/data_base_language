#! /usr/bin/php
<?php
// --------------------------------------------------------------------
/*
	php/update/csv_update.php

					Oct/21/2016

*/
// --------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "text_manipulate.php";
include "file_io.php";

// --------------------------------------------------------------------
$file_in = $argv[1];
$id_in = $argv[2];
$population_in = intval ($argv[3]);

fputs (STDERR,"*** 開始 ***\n");

echo	$file_in . "\n";
echo	$id_in . "\t";
echo	$population_in . "\n";

$dict_aa = csv_read_proc ($file_in);
$dict_bb = dict_update_proc ($dict_aa,$id_in,$population_in);

csv_write_proc ($file_in,$dict_bb);

fputs (STDERR,"*** 終了 ***\n");
/* -------------------------------------------------------------------- */
?>
