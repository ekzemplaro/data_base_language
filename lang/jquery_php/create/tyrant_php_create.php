<?php
// ---------------------------------------------------------------------
//	tyrant_php_create.php
//
//					Feb/09/2015
//
// ---------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "text_manipulate.php";
include "kvalue_manipulate.php";
//
// --------------------------------------------------------------------
function data_prepare_proc ()
{
$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,"t4761",'那覇',41500,'2002-9-12');
$dict_aa = dict_append_proc ($dict_aa,"t4762",'宜野湾',68400,'2002-8-18');
$dict_aa = dict_append_proc ($dict_aa,"t4763",'石垣',57200,'2002-9-1');
$dict_aa = dict_append_proc ($dict_aa,"t4764",'浦添',45300,'2002-10-29');
$dict_aa = dict_append_proc ($dict_aa,"t4765",'名護',39700,'2002-7-14');
$dict_aa = dict_append_proc ($dict_aa,"t4766",'糸満',24300,'2002-6-12');
$dict_aa = dict_append_proc ($dict_aa,"t4767",'沖縄',56200,'2002-4-17');
$dict_aa = dict_append_proc ($dict_aa,"t4768",'豊見城',92700,'2002-3-8');
$dict_aa = dict_append_proc ($dict_aa,"t4769",'うるま',31800,'2002-5-14');
	return	$dict_aa;
}
// ------------------------------------------------------------------
$mc = new Memcached ();
$mc->addServer ("host_ubuntu1",1978);

$dict_aa = data_prepare_proc ();

foreach ($dict_aa as $key => $value)
	{
	$json_out = json_encode ($value);
	$result = $mc->set($key,$json_out);
	}

echo "*** OK ***";
// ---------------------------------------------------------------------
?>	
