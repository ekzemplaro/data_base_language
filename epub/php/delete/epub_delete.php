#! /usr/bin/php
<?php
// --------------------------------------------------------------------
/*
	epub_delete.php

					Aug/20/2012

*/
// --------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "text_manipulate.php";
include "epub_manipulate.php";
include "file_io.php";

// --------------------------------------------------------------------
$file_epub = $argv[1];
$id_in = $argv[2];

print	"*** 開始 ***\n";

print	$file_epub . "\n";
print	$id_in . "\t";

$dict_aa = epub_to_dict_proc ($file_epub);

$dict_aa = dict_delete_proc ($dict_aa,$id_in);

dict_display_proc ($dict_aa);

dict_to_epub_proc ($dict_aa,$file_epub);

print	"*** 終了 ***\n";
// --------------------------------------------------------------------
?>
