<?php
// ------------------------------------------------------------------
//	jquery_php/create/exist_php_create.php
//
//					Oct/13/2011
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "curl_get.php";
include "xml_manipulate.php";
include "text_manipulate.php";
// ------------------------------------------------------------------
function data_prepare_proc ()
{
$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,"t4251",'長崎',92500,'2002-3-24');
$dict_aa = dict_append_proc ($dict_aa,"t4252",'佐世保',68400,'2002-6-18');
$dict_aa = dict_append_proc ($dict_aa,"t4253",'島原',57100,'2002-5-6');
$dict_aa = dict_append_proc ($dict_aa,"t4254",'大村',45300,'2002-10-29');
$dict_aa = dict_append_proc ($dict_aa,"t4255",'諫早',39700,'2002-7-14');
$dict_aa = dict_append_proc ($dict_aa,"t4256",'五島',24300,'2002-6-12');
$dict_aa = dict_append_proc ($dict_aa,"t4257",'平戸',56200,'2002-4-17');
$dict_aa = dict_append_proc ($dict_aa,"t4258",'雲仙',12700,'2002-3-8');
$dict_aa = dict_append_proc ($dict_aa,"t4259",'松浦',31700,'2002-5-14');
	return	$dict_aa;
}
// ------------------------------------------------------------------
$uri= 'http://localhost:8086/exist/rest/db';

$collections = 'cities';
$xml_filename = 'cities.xml';
$uri_aa = $uri . "/" . $collections . "/" . $xml_filename;

$dict_aa = data_prepare_proc ();
$str_xml = dict_to_xml_proc ($dict_aa);

curl_put_proc ($uri_aa,$str_xml);

echo	"*** OK ***";
// ------------------------------------------------------------------
?>
