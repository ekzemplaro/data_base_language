#! /usr/bin/php
<?php
//
//	maria_create.php
//
//					Jun/29/2017
//
// ----------------------------------------------------------------
$path="../../../common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "text_manipulate.php";
include "sql_manipulate.php";
// ----------------------------------------------------------------
function data_prepare_proc ()
{
$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,'t3321','岡山',725139,'2002-2-9');
$dict_aa = dict_append_proc ($dict_aa,'t3322','倉敷',417328,'2002-5-15');
$dict_aa = dict_append_proc ($dict_aa,'t3323','津山',891654,'2002-7-21');
$dict_aa = dict_append_proc ($dict_aa,'t3324','玉野',265981,'2002-11-12');
$dict_aa = dict_append_proc ($dict_aa,'t3325','笠岡',284597,'2002-4-24');
$dict_aa = dict_append_proc ($dict_aa,'t3326','井原',671942,'2002-2-8');
$dict_aa = dict_append_proc ($dict_aa,'t3327','総社',265481,'2002-8-3');
$dict_aa = dict_append_proc ($dict_aa,'t3328','高梁',792356,'2002-3-14');
$dict_aa = dict_append_proc ($dict_aa,'t3329','新見',415892,'2002-1-15');

	return	$dict_aa;
}

// ----------------------------------------------------------------
fputs (STDERR,"*** 開始 ***\n");

$dict_aa = data_prepare_proc ();

$host = 'localhost';
$user = 'scott';
$password = 'tiger123';
$db = 'city';
$dsn = 'mysql:dbname=' . $db . ';host=' . $host . ';charset=utf8';

try
	{
	$dbcon = new PDO ($dsn, $user,$password);
	drop_table_proc ($dbcon);
	create_table_proc ($dbcon);
	dict_to_db_proc ($dict_aa,$dbcon);
	$dbcon = null;
	}
catch  (PDOException $e)
	{
	print('Error:'.$e->getMessage());
	}

fputs (STDERR,"*** 終了 ***\n");
// ----------------------------------------------------------------
?>
