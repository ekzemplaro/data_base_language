#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	php/create/couch_create.php
//
//					Jun/20/2014
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "curl_get.php";
include "text_manipulate.php";

// ------------------------------------------------------------------
print	"*** 開始 ***\n";

$url_collection = 'http://localhost:5984/nagano';
print	"url_collection = " .$url_collection . "\n";

curl_delete_proc ($url_collection);
curl_put_proc ($url_collection,'{}');

$dict_aa=data_prepare_proc ();

foreach ($dict_aa as $key => $value)
	{
	$json_out = json_encode ($value);

	$url_target = $url_collection . "/" . $key;

	curl_put_proc ($url_target,$json_out);
	}

print	"*** 終了 ***\n";


// ------------------------------------------------------------------
function data_prepare_proc ()
{
	$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,'t2021','長野',18945,'2002-3-12');
$dict_aa = dict_append_proc ($dict_aa,'t2022','松本',69537,'2002-10-7');
$dict_aa = dict_append_proc ($dict_aa,'t2023','上田',72186,'2002-9-15');
$dict_aa = dict_append_proc ($dict_aa,'t2024','小諸',49672,'2002-5-22');
$dict_aa = dict_append_proc ($dict_aa,'t2025','岡谷',82341,'2002-11-11');
$dict_aa = dict_append_proc ($dict_aa,'t2026','塩尻',32597,'2002-9-21');
$dict_aa = dict_append_proc ($dict_aa,'t2027','茅野',42519,'2002-8-24');
$dict_aa = dict_append_proc ($dict_aa,'t2028','飯田',52986,'2002-9-28');
$dict_aa = dict_append_proc ($dict_aa,'t2029','中野',72513,'2002-8-5');
$dict_aa = dict_append_proc ($dict_aa,'t2030','諏訪',58146,'2002-6-17');
$dict_aa = dict_append_proc ($dict_aa,'t2031','駒ヶ根',25371,'2002-8-15');
$dict_aa = dict_append_proc ($dict_aa,'t2032','佐久',78529,'2002-4-14');
$dict_aa = dict_append_proc ($dict_aa,'t2033','伊那',29416,'2002-3-21');
$dict_aa = dict_append_proc ($dict_aa,'t2034','千曲',83725,'2002-5-18');


	return $dict_aa;
}
// ------------------------------------------------------------------
?>
