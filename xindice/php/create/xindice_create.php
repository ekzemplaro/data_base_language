#! /usr/bin/php
<?php
//
//	xindice_create.php
//
//					Oct/13/2011
//
// ----------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "xml_manipulate.php";
include "text_manipulate.php";
include "curl_get.php";

// ----------------------------------------------------------------
function data_prepare_proc ()
{
$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,'t0271','青森',51296,'2002-3-25');
$dict_aa = dict_append_proc ($dict_aa,'t0272','弘前',63973,'2002-8-12');
$dict_aa = dict_append_proc ($dict_aa,'t0273','八戸',57182,'2002-9-01');
$dict_aa = dict_append_proc ($dict_aa,'t0274','三沢',46329,'2002-10-29');
$dict_aa = dict_append_proc ($dict_aa,'t0275','黒石',31745,'2002-7-14');
$dict_aa = dict_append_proc ($dict_aa,'t0276','むつ',28614,'2002-6-12');
$dict_aa = dict_append_proc ($dict_aa,'t0277','五所川原',82197,'2002-4-17');
$dict_aa = dict_append_proc ($dict_aa,'t0278','十和田',92573,'2002-3-24');
$dict_aa = dict_append_proc ($dict_aa,'t0279','平川',74618,'2002-7-8');

	return	$dict_aa;
}

// ----------------------------------------------------------------
$uri= 'http://host_dbase:8888/xindice/db';

$collections = "cities";
$name_in = 'cities';
$uri_aa = $uri . "/" . $collections . "/" . $name_in;

print	"*** 開始 ***\n";

$dict_aa = data_prepare_proc ();
$str_xml = dict_to_xml_proc ($dict_aa);

curl_put_proc ($uri_aa,$str_xml);

print	"*** 終了 ***\n";
// ----------------------------------------------------------------
?>

