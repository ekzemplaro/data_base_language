#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	berkeley_create.php
//
//					Mar/07/2014
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "text_manipulate.php";
include "dba_manipulate.php";

// ------------------------------------------------------------------
function data_prepare_proc ()
{
$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,'t2451','津',31472,'2002-10-14');
$dict_aa = dict_append_proc ($dict_aa,'t2452','鈴鹿',47913,'2002-8-12');
$dict_aa = dict_append_proc ($dict_aa,'t2453','伊勢',58962,'2002-9-01');
$dict_aa = dict_append_proc ($dict_aa,'t2454','鳥羽',72651,'2002-11-29');
$dict_aa = dict_append_proc ($dict_aa,'t2455','四日市',31785,'2002-7-14');
$dict_aa = dict_append_proc ($dict_aa,'t2456','亀山',27681,'2002-6-12');
$dict_aa = dict_append_proc ($dict_aa,'t2457','尾鷲',82197,'2002-4-17');
$dict_aa = dict_append_proc ($dict_aa,'t2458','桑名',98573,'2002-3-27');
$dict_aa = dict_append_proc ($dict_aa,'t2459','志摩',79461,'2002-7-8');
$dict_aa = dict_append_proc ($dict_aa,'t2460','伊賀',61823,'2002-9-12');
$dict_aa = dict_append_proc ($dict_aa,'t2461','名張',23591,'2002-6-18');
$dict_aa = dict_append_proc ($dict_aa,'t2462','熊野',62458,'2002-5-24');

	return	$dict_aa;
}

// ------------------------------------------------------------------
#
print "*** 開始 ***\n";
$db_file=$argv[1];
print $db_file . "\n";

$dict_aa = data_prepare_proc ();

dict_to_berkeley_proc ($dict_aa,$db_file);

#
print "*** 終了 ***\n";
// ------------------------------------------------------------------
?> 
