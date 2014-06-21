#! /usr/bin/php
<?php
/*
	oracle_read.php

					Mar/01/2010

*/
// --------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
include ("sql_display.php");

/* -------------------------------------------------------------------- */
// $dsn = 'oci:dbname=cpt003/xe';
$dsn = 'oci:dbname=spn109/xe';
$user = 'scott';
$password = 'tiger';

$dbcon = new PDO ($dsn, $user, $password);

print "*** start ***\n";

disp_lower_proc ($dbcon);

print "*** end ***\n";
/* -------------------------------------------------------------------- */
?>	
