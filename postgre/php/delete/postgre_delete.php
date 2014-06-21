#! /usr/bin/php
<?php
/*
	php/delete/postgre_delete.php

					Dec/20/2010

*/
// --------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
#
include "sql_display.php";
include "sql_manipulate.php";

// --------------------------------------------------------------------
print "*** 開始 ***\n";
#$dsn = 'pgsql:dbname=city host=cpt003 port=5432';
$dsn = 'pgsql:dbname=city host=localhost port=5432';
$user = 'scott';
$password = 'tiger';

$id_in = $argv[1];

print $id_in . "\n";

$dbcon = new PDO ($dsn, $user, $password);

sql_delete_proc ($dbcon,$id_in);

print "--------------------------\n";
disp_lower_proc ($dbcon);

$dbcon = null;

print "*** 終了 ***\n";
// --------------------------------------------------------------------
?>	
