<?php
// ---------------------------------------------------------------------
//	redis_php_create.php
//
//					Sep/13/2013
//
// ---------------------------------------------------------------------
//$path=$_SERVER["DOCUMENT_ROOT"]."/data_base/common/php_common";
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "text_manipulate.php";

// ---------------------------------------------------------------------
function data_prepare_proc ()
{
$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,'t1851','福井',43700,'2002-5-18');
$dict_aa = dict_append_proc ($dict_aa,'t1852','敦賀',39200,'2002-9-17');
$dict_aa = dict_append_proc ($dict_aa,'t1853','小浜',56300,'2002-10-21');
$dict_aa = dict_append_proc ($dict_aa,'t1854','大野',32900,'2002-3-9');
$dict_aa = dict_append_proc ($dict_aa,'t1855','勝山',78500,'2002-11-14');
$dict_aa = dict_append_proc ($dict_aa,'t1856','鯖江',68100,'2002-6-12');
$dict_aa = dict_append_proc ($dict_aa,'t1857','あわら',19700,'2002-4-17');
$dict_aa = dict_append_proc ($dict_aa,'t1858','越前',57300,'2002-3-24');
$dict_aa = dict_append_proc ($dict_aa,'t1859','坂井',13700,'2002-7-8');

	return	$dict_aa;
}

// ---------------------------------------------------------------------
$dict_aa = data_prepare_proc ();

$redis = new Redis();
$redis->connect('host_dbase', 6379);

foreach ($dict_aa as $key => $value)
	{
	$json_new = json_encode ($value);
	$redis->set ($key,$json_new);
	}

echo "*** OK ***";
// ---------------------------------------------------------------------
?>	
