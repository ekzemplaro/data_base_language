<?php
// ------------------------------------------------------------------
//	jquery_php/create/couch_php_create.php
//
//					Jun/20/2014
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "curl_get.php";
include "text_manipulate.php";

// ------------------------------------------------------------------
$url_collection = 'http://localhost:5984/nagano';

curl_delete_proc ($url_collection);
curl_put_proc ($url_collection,'{}');

$dict_aa=data_prepare_proc ();

foreach ($dict_aa as $key => $value)
	{
	$json_out = json_encode ($value);

	$url_target = $url_collection . "/" . $key;

	curl_put_proc ($url_target,$json_out);
	}

// header ("Content-Type: text/javascript; charset=utf-8");

echo	"*** OK ***";
// ------------------------------------------------------------------
function data_prepare_proc ()
{

	$dict_aa = array ();

	$dict_aa = dict_append_proc ($dict_aa,'t2021','長野',41700,'2002-8-5');
	$dict_aa = dict_append_proc ($dict_aa,'t2022','松本',72600,'2002-7-27');
	$dict_aa = dict_append_proc ($dict_aa,'t2023','上田',84900,'2002-2-15');
	$dict_aa = dict_append_proc ($dict_aa,'t2024','小諸',41300,'2002-1-22');
	$dict_aa = dict_append_proc ($dict_aa,'t2025','岡谷',73800,'2002-3-11');
	$dict_aa = dict_append_proc ($dict_aa,'t2026','塩尻',36500,'2002-9-21');
	$dict_aa = dict_append_proc ($dict_aa,'t2027','茅野',49700,'2002-10-24');
	$dict_aa = dict_append_proc ($dict_aa,'t2028','飯田',82100,'2002-9-21');
	$dict_aa = dict_append_proc ($dict_aa,'t2029','中野',71300,'2002-8-05');
	$dict_aa = dict_append_proc ($dict_aa,'t2030','諏訪',26700,'2002-6-17');
	$dict_aa = dict_append_proc ($dict_aa,'t2031','駒ヶ根',25100,'2002-11-15');
	$dict_aa = dict_append_proc ($dict_aa,'t2032','佐久',58400,'2002-4-17');
	$dict_aa = dict_append_proc ($dict_aa,'t2033','伊那',67200,'2002-10-24');
	$dict_aa = dict_append_proc ($dict_aa,'t2034','千曲',75100,'2002-11-13');

	return $dict_aa;
}

// ------------------------------------------------------------------
?>
