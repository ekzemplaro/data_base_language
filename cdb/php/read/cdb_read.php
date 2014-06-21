#! /usr/bin/php
<?
// ------------------------------------------------------------------
//	cdb_read.php
//
//					Mar/27/2013
//
// ------------------------------------------------------------------
print "*** 開始 ***\n";
$file_cdb=$argv[1];
#
$dbh = dba_open($file_cdb,"r","cdb");
#
#
for($key = dba_firstkey($dbh); $key != false; $key = dba_nextkey($dbh)) {
	$json_string = dba_fetch($key, $dbh);
	$city = json_decode ($json_string);
	echo $key . "\t";
	echo $city->name . "\t";
	echo $city->population . "\t";
	echo $city->date_mod;
	echo "\n";

}
dba_close ($dbh);
print "*** 終了 ***\n";
?> 
