#! /usr/bin/php
<?php
//
//	xml_create.php
//
//					Dec/09/2016
//
// ----------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "text_manipulate.php";
include "xml_manipulate.php";
include "file_io.php";
// ----------------------------------------------------------------
function data_prepare_proc ()
{
$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,'t2261','静岡',51489,'2002-11-30');
$dict_aa = dict_append_proc ($dict_aa,'t2262','浜松',62473,'2002-8-12');
$dict_aa = dict_append_proc ($dict_aa,'t2263','沼津',57982,'2002-3-8');
$dict_aa = dict_append_proc ($dict_aa,'t2264','三島',46329,'2002-10-29');
$dict_aa = dict_append_proc ($dict_aa,'t2265','富士',31785,'2002-7-14');
$dict_aa = dict_append_proc ($dict_aa,'t2266','熱海',29684,'2002-6-12');
$dict_aa = dict_append_proc ($dict_aa,'t2267','富士宮',83197,'2002-4-17');
$dict_aa = dict_append_proc ($dict_aa,'t2268','藤枝',92578,'2002-3-24');
$dict_aa = dict_append_proc ($dict_aa,'t2269','御殿場',35982,'2002-5-14');
$dict_aa = dict_append_proc ($dict_aa,'t2270','島田',79461,'2002-7-8');

	return	$dict_aa;
}
// ----------------------------------------------------------------
print	"*** 開始 ***\n";

$file_xml = $argv[1];
print	$file_xml . "\n";

folder_create_proc ($file_xml);

$dict_aa = data_prepare_proc ();

$str_xml = dict_to_xml_proc ($dict_aa);

file_write_proc ($str_xml,$file_xml);

print	"*** 終了 ***\n";

// ----------------------------------------------------------------
?>

