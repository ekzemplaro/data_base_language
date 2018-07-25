#! /usr/bin/php
<?php
/*
	sqlite3_read.php	for sqlite3

					Jul/25/2018

*/
// --------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "sql_display.php";

// --------------------------------------------------------------------
$sqlite3_file = $argv[1];
$dbcon = new PDO ("sqlite:" . $sqlite3_file);

fputs (STDERR,"*** 開始 ***\n");

disp_lower_proc ($dbcon);

$dbcon=null;

fputs (STDERR,"*** 終了 ***\n");
// --------------------------------------------------------------------
?>	
