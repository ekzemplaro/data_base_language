#! /usr/bin/php
<?php
// --------------------------------------------------------------------
/*
	epub_read.php

					Aug/20/2012

*/
// --------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "text_manipulate.php";
include "epub_manipulate.php";

// --------------------------------------------------------------------
$file_epub = $argv[1];

print	"*** 開始 ***\n";

print	$file_epub . "\n";

$dict_aa = epub_to_dict_proc ($file_epub);

dict_display_proc ($dict_aa);

print	"*** 終了 ***\n";
// --------------------------------------------------------------------
?>
