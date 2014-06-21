<?php
// ------------------------------------------------------------------
//	jquery_php/create/xindice_php_create.php
//
//					Jun/12/2012
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

$dict_aa = dict_append_proc ($dict_aa,"t0271",'青森',92500,'2002-3-24');
$dict_aa = dict_append_proc ($dict_aa,"t0272",'弘前',68400,'2002-6-18');
$dict_aa = dict_append_proc ($dict_aa,"t0273",'八戸',57100,'2002-5-6');
$dict_aa = dict_append_proc ($dict_aa,"t0274",'三沢',45300,'2002-10-29');
$dict_aa = dict_append_proc ($dict_aa,"t0275",'黒石',39700,'2002-7-14');
$dict_aa = dict_append_proc ($dict_aa,"t0276",'むつ',24300,'2002-6-12');
$dict_aa = dict_append_proc ($dict_aa,"t0277",'五所川原',56200,'2002-4-17');
$dict_aa = dict_append_proc ($dict_aa,"t0278",'十和田',12700,'2002-3-8');
$dict_aa = dict_append_proc ($dict_aa,"t0279",'平川',31700,'2002-5-14');
	return	$dict_aa;
}
// ------------------------------------------------------------------
$uri= 'http://host_dbase:8888/xindice/db';

$collections = "cities";
$name_in = 'cities';


$uri_aa = $uri . "/" . $collections . "/" . $name_in;


$dict_aa = data_prepare_proc ();
$str_xml = dict_to_xml_proc ($dict_aa);

echo	"*** ppp ***<br />";

curl_put_proc ($uri_aa,$str_xml);


echo	"*** OK ***";
// ------------------------------------------------------------------
?>
