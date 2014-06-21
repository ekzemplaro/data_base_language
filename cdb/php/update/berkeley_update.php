#! /usr/bin/php
<?
// ------------------------------------------------------------------
//	berkeley_update.php
//
//					Jan/27/2011
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "dba_manipulate.php";

// ------------------------------------------------------------------
print "*** 開始 ***\n";
$file_name=$argv[1];
$id_in = $argv[2];
$population_in = $argv[3];
#
$dbh = dba_open($file_name,"c","db4");
#
$key = $id_in;
#
$json_string = dba_fetch($key, $dbh);
echo $json_string . "\n";

$city = json_decode ($json_string);
echo $key . "\t";
echo $city->name . "\t";
echo $city->population . "\t";
echo $city->date_mod;
echo "\n";

$today = date ("Y-m-d");

$encode = value_to_json_proc ($city->name,$population_in,$today);
echo $encode . "\n";

dba_replace ($key,$encode,$dbh);

$tmp = dba_fetch($key, $dbh);
echo $tmp . "\n";

dba_close ($dbh);

print "*** 終了 ***\n";
?> 
