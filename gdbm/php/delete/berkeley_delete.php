#! /usr/bin/php
<?
// ------------------------------------------------------------------
//	berkeley_delete.php
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
#
print	$id_in . "\n";
#
$dbh = dba_open($file_name,"c","db4");
#
$key = $id_in;
#
$json_string = dba_fetch($key, $dbh);
echo $json_string . "\n";


if (dba_exists ($key,$dbh))
	{
	dba_delete ($key,$dbh);
	}


dba_close ($dbh);

print "*** 終了 ***\n";
?> 
