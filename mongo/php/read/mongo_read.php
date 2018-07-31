#! /usr/bin/php
<?php
// --------------------------------------------------------------------
/*
	read/mongo_read.php

					Jun/30/2018

*/
// --------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "text_manipulate.php";
include "mongo_manipulate.php";
// --------------------------------------------------------------------
fputs (STDERR,"*** 開始 ***\n");

$user = 'scott';
$password = 'tiger123';

$dict_aa = mongo_to_dict_proc($user,$password);

dict_display_proc ($dict_aa);

fputs (STDERR,"*** 終了 ***\n");

// --------------------------------------------------------------------
?>
