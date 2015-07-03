#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	gdbm_update.php
//
//					Jun/11/2015
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "dba_manipulate.php";

// ------------------------------------------------------------------
print "*** 開始 ***\n";
$file_name=$argv[1];
$key_in = $argv[2];
$population_in = $argv[3];

$dbh = dba_open($file_name,"c","gdbm");

$json_string = dba_fetch($key_in, $dbh);
echo $json_string . "\n";

$city = json_decode ($json_string);
echo $key_in . "\t";
echo $city->name . "\t";
echo $city->population . "\t";
echo $city->date_mod;
echo "\n";

date_default_timezone_set('Asia/Tokyo');
$today = date ("Y-m-d");

$encode = value_to_json_proc ($city->name,$population_in,$today);

dba_replace ($key_in,$encode,$dbh);

dba_close ($dbh);

print "*** 終了 ***\n";
// ------------------------------------------------------------------
?> 
