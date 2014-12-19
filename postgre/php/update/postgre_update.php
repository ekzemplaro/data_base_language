#! /usr/bin/php
<?php
/*
	php/update/postgre_update.php

					Dec/04/2014

*/
// --------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

// --------------------------------------------------------------------
print "*** 開始 ***\n";

$host = 'localhost';
$dbname = 'city';
$user = 'scott';
$password = 'tiger';

$key_in = $argv[1];
$population_in = $argv[2];

print $key_in . "\t" . $population_in . "\n";

$str_connect = "host=". $host . " dbname=" . $dbname
	 . " user=" . $user . " password=" . $password;
echo $str_connect . "\n";

$dbconn = pg_connect ($str_connect)
    or die('Could not connect: ' . pg_last_error());

date_default_timezone_set('Asia/Tokyo');
$today = date ("Y-m-d");
$query = "update cities set POPULATION=" . $population_in;
$query .= ", DATE_MOD='" . $today . "'";
$query .= " where ID='" . $key_in . "'";

print $query . "\n";

$result = pg_query($query) or die('Query failed: ' . pg_last_error());

pg_close ($dbconn);

print "*** 終了 ***\n";
// --------------------------------------------------------------------
?>
