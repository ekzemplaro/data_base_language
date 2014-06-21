#! /usr/bin/php
<?php
//
//	mysql_create.php
//
//					Sep/17/2013
//
// ----------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "text_manipulate.php";
include "sql_display.php";
include "sql_manipulate.php";
include "mysql_utf8.php";
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
$dict_aa = dict_append_proc ($dict_aa,'t3328','高梁',57213,'2002-3-14');
$dict_aa = dict_append_proc ($dict_aa,'t3329','新見',74598,'2002-1-12');

	return	$dict_aa;
}
// ----------------------------------------------------------------
print "*** 開始 ***\n";

$dict_aa = data_prepare_proc ();

$dsn = 'mysql:dbname=city;host=host_mysql';
$user = 'scott';
$password = 'tiger';

$dbcon = new PDO ($dsn, $user,$password);

mysql_utf8_proc ($dbcon);

drop_table_proc ($dbcon);
create_table_proc ($dbcon);

dict_to_db_proc ($dict_aa,$dbcon);

disp_lower_proc ($dbcon);

$dbcon = null;

print "*** 終了 ***\n";
?>

