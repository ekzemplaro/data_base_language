#! /usr/bin/php
<?php
/*
	sqlite3_delete.php

					Jul/25/2018
*/
// --------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "sql_manipulate.php";

// --------------------------------------------------------------------
fputs (STDERR,"*** 開始 ***\n");
$file_in = $argv[1];
$id_in = $argv[2];

print $file_in . "\t" . $id_in . "\n";

$dbcon = new PDO ("sqlite:" . $file_in);

sql_delete_proc ($dbcon,$id_in);

$dbcon = null;

fputs (STDERR,"*** 終了 ***\n");
// --------------------------------------------------------------------
?>	
