#! /usr/bin/php
<?php
/*
	php/update/postgre_update.php

					Feb/09/2015

*/
// --------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "pg_manipulate.php";
// --------------------------------------------------------------------
print "*** 開始 ***\n";

$server = 'localhost';
$dbname = 'city';
$user = 'scott';
$password = 'tiger';

$key_in = $argv[1];
$population_in = $argv[2];

print $key_in . "\t" . $population_in . "\n";

pg_update_proc ($server,$dbname,$user,$password,$key_in,$population_in);

print "*** 終了 ***\n";
// --------------------------------------------------------------------
?>
