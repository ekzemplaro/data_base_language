#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	create/redis_create.php
//
//					Jun/23/2017
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "text_manipulate.php";

// ------------------------------------------------------------------
function data_prepare_proc ()
{
$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,'t1851','福井',56437,'2002-5-12');
$dict_aa = dict_append_proc ($dict_aa,'t1852','敦賀',47392,'2002-7-15');
$dict_aa = dict_append_proc ($dict_aa,'t1853','小浜',82563,'2002-8-12');
$dict_aa = dict_append_proc ($dict_aa,'t1854','大野',46329,'2002-10-29');
$dict_aa = dict_append_proc ($dict_aa,'t1855','勝山',39745,'2002-2-14');
$dict_aa = dict_append_proc ($dict_aa,'t1856','鯖江',27681,'2002-6-12');
$dict_aa = dict_append_proc ($dict_aa,'t1857','あわら',82197,'2002-4-17');
$dict_aa = dict_append_proc ($dict_aa,'t1858','越前',98513,'2002-3-24');
$dict_aa = dict_append_proc ($dict_aa,'t1859','坂井',46238,'2002-7-8');

	return	$dict_aa;
}
// ------------------------------------------------------------------
print "*** 開始 ***\n";

$dict_aa = data_prepare_proc ();

$redis = new Redis();
$redis->connect('localhost', 6379);

foreach ($dict_aa as $key => $value)
	{
	$json_new = json_encode ($value);
	$redis->set ($key,$json_new);
	}

print "*** 終了 ***\n";
// ------------------------------------------------------------------
?>
