#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	gdbm_delete.php
//
//					Jun/11/2015
//
// ------------------------------------------------------------------
// $path="/var/www/data_base/common/php_common";
// set_include_path (get_include_path() . PATH_SEPARATOR . $path);


// ------------------------------------------------------------------
print "*** 開始 ***\n";
$file_name=$argv[1];
$key_in = $argv[2];

print	$key_in . "\n";

$dbh = dba_open($file_name,"c","gdbm");

$json_string = dba_fetch($key_in, $dbh);
echo $json_string . "\n";


if (dba_exists ($key_in,$dbh))
	{
	dba_delete ($key_in,$dbh);
	}


dba_close ($dbh);

print "*** 終了 ***\n";
// ------------------------------------------------------------------
?> 
