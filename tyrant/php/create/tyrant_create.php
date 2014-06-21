#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	tyrant_create.php
//
//					Jun/29/2011
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "mcached_manipulate.php";
include "kvalue_manipulate.php";
include "text_manipulate.php";

// ------------------------------------------------------------------
function data_prepare_proc ()
{
$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,'t4761','那覇',72514,'2002-5-14');
$dict_aa = dict_append_proc ($dict_aa,'t4762','宜野湾',63473,'2002-8-12');
$dict_aa = dict_append_proc ($dict_aa,'t4763','石垣',57282,'2002-9-01');
$dict_aa = dict_append_proc ($dict_aa,'t4764','浦添',46329,'2002-10-29');
$dict_aa = dict_append_proc ($dict_aa,'t4765','名護',35735,'2002-7-14');
$dict_aa = dict_append_proc ($dict_aa,'t4766','糸満',24184,'2002-6-12');
$dict_aa = dict_append_proc ($dict_aa,'t4767','沖縄',82197,'2002-4-17');
$dict_aa = dict_append_proc ($dict_aa,'t4768','豊見城',98578,'2002-3-24');
$dict_aa = dict_append_proc ($dict_aa,'t4769','うるま',79461,'2002-7-8');

	return	$dict_aa;
}
// ------------------------------------------------------------------
$memc = memcache_connect('localhost', 1978);
$memc->addServer('localhost', 1978);

print "*** 開始 ***\n";

$dict_aa = data_prepare_proc ();

foreach ($dict_aa as $key => $value)
	{
	$name = $value['name'];
	$population = $value['population'];
	$date_mod = $value['date_mod'];
	kvalue_insert_proc ($memc,$key,$name,$population,$date_mod);
	}

print "*** 終了 ***\n";
?>
