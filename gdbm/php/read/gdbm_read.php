#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	gdbm_read.php
//
//					Jun/11/2015
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "text_manipulate.php";
// ------------------------------------------------------------------
print "*** 開始 ***\n";
$file_gdbm=$argv[1];
echo $file_gdbm . "\n";

$dbh = dba_open($file_gdbm,"r","gdbm");

$dict_aa = array ();

for($key = dba_firstkey($dbh); $key != false; $key = dba_nextkey($dbh))
	{
	$json_string = dba_fetch($key, $dbh);
	$city = json_decode ($json_string);

	$dict_unit = array ();
	$dict_unit['name'] = $city->name;
	$dict_unit['population'] = $city->population;
	$dict_unit['date_mod'] = $city->date_mod;
	$dict_aa[$key]= $dict_unit;
	}

dba_close ($dbh);

dict_display_proc ($dict_aa);


print "*** 終了 ***";
// ------------------------------------------------------------------
?> 
