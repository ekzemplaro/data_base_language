#! /usr/bin/php
<?php
//
//	sqlite3_create.php
//
//					Jul/25/2018
//
// ----------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "text_manipulate.php";
include "sql_manipulate.php";
include "file_io.php";
// ----------------------------------------------------------------
function data_prepare_proc ()
{
$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,'t0711','郡山',34516,'2002-8-9');
$dict_aa = dict_append_proc ($dict_aa,'t0712','会津若松',84973,'2002-9-21');
$dict_aa = dict_append_proc ($dict_aa,'t0713','白河',98214,'2002-6-7');
$dict_aa = dict_append_proc ($dict_aa,'t0714','福島',32579,'2002-11-19');
$dict_aa = dict_append_proc ($dict_aa,'t0715','喜多方',72145,'2002-7-24');
$dict_aa = dict_append_proc ($dict_aa,'t0716','二本松',26319,'2002-6-2');
$dict_aa = dict_append_proc ($dict_aa,'t0717','いわき',82754,'2002-4-9');
$dict_aa = dict_append_proc ($dict_aa,'t0718','相馬',57213,'2002-5-14');
$dict_aa = dict_append_proc ($dict_aa,'t0719','須賀川',21598,'2002-3-12');

	return	$dict_aa;
}

// ----------------------------------------------------------------
fputs (STDERR,"*** 開始 ***\n");

$file_out = $argv[1];
print	$file_out . "\n";

folder_create_proc ($file_out);

$dict_aa = data_prepare_proc ();

$dbcon = new PDO ("sqlite:" . $file_out);

drop_table_proc ($dbcon);
create_table_proc ($dbcon);

dict_to_db_proc ($dict_aa,$dbcon);

fputs (STDERR,"*** 終了 ***\n");
?>

