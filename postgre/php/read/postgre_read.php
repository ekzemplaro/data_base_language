#! /usr/bin/php
<?php
/*
	postgre_read.php

					Dec/04/2014

*/
// --------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "text_manipulate.php";

// --------------------------------------------------------------------
function db_to_dict_proc ()
{
	$dict_aa = array ();

	$query = 'SELECT * FROM cities';

	$result = pg_query($query) or die('Query failed: ' . pg_last_error());

	while ($line = pg_fetch_array($result, null, PGSQL_ASSOC))
		{
		$key = $line['id'];
		$name = $line['name'];
		$population = $line['population'];
		$date_mod = $line['date_mod'];
	$dict_aa = dict_append_proc ($dict_aa,$key,$name,$population,$date_mod);
		}

	pg_free_result($result);

	return	$dict_aa;
}

// --------------------------------------------------------------------
print "*** 開始 ***\n";

$host = 'localhost';
$dbname = 'city';
$user = 'scott';
$password = 'tiger';

$str_connect = "host=". $host . " dbname=" . $dbname
	 . " user=" . $user . " password=" . $password;
echo $str_connect . "\n";

$dbconn = pg_connect ($str_connect)
    or die('Could not connect: ' . pg_last_error());

$dict_aa = db_to_dict_proc ();

pg_close ($dbconn);

dict_display_proc ($dict_aa);

print "*** 終了 ***\n";
// --------------------------------------------------------------------
?>
