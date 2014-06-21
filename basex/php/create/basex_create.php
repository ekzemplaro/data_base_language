#! /usr/bin/php
<?php
//
//	basex_create.php
//
//					Jun/12/2012
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

$dict_aa = dict_append_proc ($dict_aa,'t4161','佐賀',93628,'2002-3-25');
$dict_aa = dict_append_proc ($dict_aa,'t4162','唐津',63273,'2002-8-12');
$dict_aa = dict_append_proc ($dict_aa,'t4163','鳥栖',57824,'2002-9-01');
$dict_aa = dict_append_proc ($dict_aa,'t4164','多久',46329,'2002-10-29');
$dict_aa = dict_append_proc ($dict_aa,'t4165','伊万里',35735,'2002-7-14');
$dict_aa = dict_append_proc ($dict_aa,'t4166','武雄',24684,'2002-6-12');
$dict_aa = dict_append_proc ($dict_aa,'t4167','鹿島',82197,'2002-4-17');
$dict_aa = dict_append_proc ($dict_aa,'t4168','小城',98578,'2002-3-24');
$dict_aa = dict_append_proc ($dict_aa,'t4169','嬉野',79461,'2002-7-8');

	return	$dict_aa;
}

// ----------------------------------------------------------------

$uri = "http://admin:admin@localhost:8984/rest/cities";

print	"*** 開始 ***\n";

$dict_aa = data_prepare_proc ();
$str_xml = dict_to_xml_proc ($dict_aa);

print	"*** check ddd ***\n";

print	$str_xml;

curl_put_proc ($uri,$str_xml);

print	"*** 終了 ***\n";
// ----------------------------------------------------------------
?>

