#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	berkeley_update.php
//
//					Mar/07/2014
//
// ------------------------------------------------------------------
print "*** 開始 ***\n";
$file_name=$argv[1];
$key = $argv[2];
$population_in = $argv[3];

$dbh = dba_open ($file_name,"c","db4");

$json_string = dba_fetch($key, $dbh);

$city = json_decode ($json_string);
echo $key . "\t";
echo $city->name . "\t";
echo $city->population . "\t";
echo $city->date_mod;
echo "\n";


$city->population = $population_in;
$city->date_mod = date ("Y-m-d");

$encode = json_encode ($city);

echo $encode . "\n";

dba_replace ($key,$encode,$dbh);

$tmp = dba_fetch($key, $dbh);
echo $tmp . "\n";

dba_close ($dbh);

print "*** 終了 ***\n";
// ------------------------------------------------------------------
?> 
