#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	tyrant_create.php
//
//					Feb/06/2015
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

$dict_aa = dict_append_proc ($dict_aa,'t4761','那覇',72314,'2002-5-14');
$dict_aa = dict_append_proc ($dict_aa,'t4762','宜野湾',63473,'2002-8-12');
$dict_aa = dict_append_proc ($dict_aa,'t4763','石垣',51382,'2002-9-01');
$dict_aa = dict_append_proc ($dict_aa,'t4764','浦添',46829,'2002-10-29');
$dict_aa = dict_append_proc ($dict_aa,'t4765','名護',81735,'2002-7-14');
$dict_aa = dict_append_proc ($dict_aa,'t4766','糸満',29184,'2002-6-12');
$dict_aa = dict_append_proc ($dict_aa,'t4767','沖縄',82197,'2002-4-17');
$dict_aa = dict_append_proc ($dict_aa,'t4768','豊見城',92578,'2002-3-24');
$dict_aa = dict_append_proc ($dict_aa,'t4769','うるま',79261,'2002-7-8');

	return	$dict_aa;
}

// ------------------------------------------------------------------
print "*** 開始 ***\n";

$mc = new Memcached ();
$mc->addServer ("host_ubuntu1",1978);

$dict_aa = data_prepare_proc ();

foreach ($dict_aa as $key => $value)
	{
	$json_out = json_encode ($value);
	$result = $mc->set($key,$json_out);
	}

print "*** 終了 ***\n";
// ------------------------------------------------------------------
?>
