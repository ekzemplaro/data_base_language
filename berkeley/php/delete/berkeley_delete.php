#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	berkeley_delete.php
//
//					Mar/07/2014
//
// ------------------------------------------------------------------
print "*** 開始 ***\n";
$file_name=$argv[1];
$key = $argv[2];

print	$key . "\n";

$dbh = dba_open($file_name,"c","db4");

$json_string = dba_fetch($key, $dbh);
echo $json_string . "\n";

if (dba_exists ($key,$dbh))
	{
	dba_delete ($key,$dbh);
	}

dba_close ($dbh);

print "*** 終了 ***\n";
// ------------------------------------------------------------------
?> 
