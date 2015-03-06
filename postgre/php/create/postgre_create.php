#! /usr/bin/php
<?php
//
//	postgre_create.php
//
//					Feb/09/2015
//
// ----------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "text_manipulate.php";
include "pg_manipulate.php";
// ----------------------------------------------------------------
function data_prepare_proc ()
{
$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,'t3461','広島',39514,'2002-2-4');
$dict_aa = dict_append_proc ($dict_aa,'t3462','福山',85973,'2002-3-21');
$dict_aa = dict_append_proc ($dict_aa,'t3463','東広島',97216,'2002-5-7');
$dict_aa = dict_append_proc ($dict_aa,'t3464','呉',31579,'2002-10-19');
$dict_aa = dict_append_proc ($dict_aa,'t3465','尾道',72145,'2002-7-24');
$dict_aa = dict_append_proc ($dict_aa,'t3466','竹原',26319,'2002-6-2');
$dict_aa = dict_append_proc ($dict_aa,'t3467','三次',82754,'2002-4-9');
$dict_aa = dict_append_proc ($dict_aa,'t3468','大竹',57813,'2002-3-14');
$dict_aa = dict_append_proc ($dict_aa,'t3469','府中',74298,'2002-1-12');

	return	$dict_aa;
}

// ----------------------------------------------------------------
print "*** 開始 ***\n";

$dict_aa = data_prepare_proc ();

$server = 'localhost';
$dbname = 'city';
$user = 'scott';
$password = 'tiger';

dict_to_pg_proc ($dict_aa,$server,$dbname,$user,$password);

print "*** 終了 ***\n";
?>
