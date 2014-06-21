#! /usr/bin/php
<?php
//
//	exist_create.php
//
//					Jun/05/2013
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

$dict_aa = dict_append_proc ($dict_aa,'t4251','長崎',68231,'2002-10-25');
$dict_aa = dict_append_proc ($dict_aa,'t4252','佐世保',35479,'2002-8-12');
$dict_aa = dict_append_proc ($dict_aa,'t4253','島原',57182,'2002-9-1');
$dict_aa = dict_append_proc ($dict_aa,'t4254','大村',46329,'2002-10-29');
$dict_aa = dict_append_proc ($dict_aa,'t4255','諫早',38745,'2002-7-14');
$dict_aa = dict_append_proc ($dict_aa,'t4256','五島',21685,'2002-6-2');
$dict_aa = dict_append_proc ($dict_aa,'t4257','平戸',82197,'2002-4-17');
$dict_aa = dict_append_proc ($dict_aa,'t4258','雲仙',94578,'2002-3-24');
$dict_aa = dict_append_proc ($dict_aa,'t4259','松浦',79461,'2002-7-8');

	return	$dict_aa;
}
// ----------------------------------------------------------------
// $uri= 'http://localhost:8086/exist/rest/db';
$uri= 'http://localhost:8086/exist/rest';

$collections = "cities";
$xml_filename = 'nagasaki.xml';
$uri_aa = $uri . "/" . $collections . "/" . $xml_filename;

print	"*** 開始 ***\n";

$dict_aa = data_prepare_proc ();
$str_xml = dict_to_xml_proc ($dict_aa);

curl_put_proc ($uri_aa,$str_xml);

print	"*** 終了 ***\n";
// ----------------------------------------------------------------
?>

