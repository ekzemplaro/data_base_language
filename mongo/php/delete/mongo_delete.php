#! /usr/bin/php
<?php
// --------------------------------------------------------------------
/*
	mongo_delete.php

					Aug/01/2018

*/
// --------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "mongo_manipulate.php";
// --------------------------------------------------------------------
fputs (STDERR,"*** 開始 ***\n");

$id_in = $argv[1];
print	$id_in . "\n";

$user = 'scott';
$password = 'tiger123';

mongo_delete_proc ($id_in,$user,$password);

fputs (STDERR,"*** 終了 ***\n");
// --------------------------------------------------------------------
?>
