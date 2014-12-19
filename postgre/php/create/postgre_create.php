#! /usr/bin/php
<?php
//
//	postgre_create.php
//
//					Dec/04/2014
//
// ----------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "text_manipulate.php";
// ----------------------------------------------------------------
function data_prepare_proc ()
{
$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,'t3321','岡山',32514,'2002-2-4');
$dict_aa = dict_append_proc ($dict_aa,'t3322','倉敷',84973,'2002-3-21');
$dict_aa = dict_append_proc ($dict_aa,'t3323','津山',98216,'2002-5-7');
$dict_aa = dict_append_proc ($dict_aa,'t3324','玉野',32579,'2002-10-19');
$dict_aa = dict_append_proc ($dict_aa,'t3325','笠岡',72845,'2002-7-24');
$dict_aa = dict_append_proc ($dict_aa,'t3326','井原',26319,'2002-6-2');
$dict_aa = dict_append_proc ($dict_aa,'t3327','総社',82754,'2002-4-9');
$dict_aa = dict_append_proc ($dict_aa,'t3328','高梁',57813,'2002-3-14');
$dict_aa = dict_append_proc ($dict_aa,'t3329','新見',74298,'2002-1-12');

	return	$dict_aa;
}

// ----------------------------------------------------------------
function pg_query_proc ($query)
{
	$result = pg_query($query) or die('Query failed: ' . pg_last_error());
}

// ----------------------------------------------------------------
print "*** 開始 ***\n";

$dict_aa = data_prepare_proc ();

$host = 'localhost';
$dbname = 'city';
$user = 'scott';
$password = 'tiger';

$str_connect = "host=". $host . " dbname=" . $dbname
	 . " user=" . $user . " password=" . $password;
echo $str_connect . "\n";

$dbconn = pg_connect ($str_connect)
    or die('Could not connect: ' . pg_last_error());

$query = "drop table cities;";
pg_query_proc ($query);

$query = "create TABLE cities (id varchar(10) NOT NULL PRIMARY KEY,name text,"
		. "population int,date_mod text)";
pg_query_proc ($query);

foreach ($dict_aa as $key => $value)
	{
	$name = $value['name'];
	$population = $value['population'];
	$date_mod = $value['date_mod'];

	$query = "insert into cities (id, Name, Population, date_mod) "
		. "values ('" . $key . "','" . $name . "',"
		. $population .  ",'" . $date_mod . "')";
	pg_query_proc ($query);
	}

pg_close ($dbconn);

print "*** 終了 ***\n";
?>
