#! /usr/bin/php
<?php
// --------------------------------------------------------------------
/*

	php/read/text_read.php

					Sep/15/2016


*/
// --------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "text_manipulate.php";

// --------------------------------------------------------------------
$file_in = $argv[1];

fputs (STDERR,"*** 開始 ***\n");

print	$file_in . "\n";

$str_in = file_get_contents($file_in);

$dict_aa = str_to_dict_proc ($str_in);

dict_display_proc ($dict_aa);

fputs (STDERR,"*** 終了 ***\n");
// --------------------------------------------------------------------
?>
