#! /usr/bin/php
<?php
/*
	postgre_read.php

					Dec/20/2010

*/
// --------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "sql_display.php";

/* -------------------------------------------------------------------- */
#$dsn = 'pgsql:dbname=city host=cdbd026 port=5433';
$dsn = 'pgsql:dbname=city host=localhost port=5432';
$user = 'scott';
$password = 'tiger';

print "*** 開始 ***\n";

$dbcon = new PDO ($dsn, $user, $password);

// disp_upper_proc ($dbcon);
disp_lower_proc ($dbcon);

$dbcon = null;

print "*** 終了 ***\n";
/* -------------------------------------------------------------------- */
?>	
