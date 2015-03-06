#! /usr/bin/php
<?php
/*
	postgre_read.php

					Feb/09/2015

*/
// --------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "text_manipulate.php";
include "pg_manipulate.php";

// --------------------------------------------------------------------
print "*** 開始 ***\n";

$server = 'localhost';
$dbname = 'city';
$user = 'scott';
$password = 'tiger';

$dict_aa = pg_to_dict_proc ($server,$dbname,$user,$password);

dict_display_proc ($dict_aa);

print "*** 終了 ***\n";
// --------------------------------------------------------------------
?>
