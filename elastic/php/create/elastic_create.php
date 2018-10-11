#! /usr/bin/php
<?php
//
//	elastic_create.php
//
//					Oct/12/2018
//
// ----------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "text_manipulate.php";
// ----------------------------------------------------------------
function data_prepare_proc ()
{
	$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,"t0921",'宇都宮',71345,'2002-8-15');
$dict_aa = dict_append_proc ($dict_aa,"t0922",'小山',68237,'2002-12-4');
$dict_aa = dict_append_proc ($dict_aa,"t0923",'佐野',52876,'2002-7-15');
$dict_aa = dict_append_proc ($dict_aa,"t0924",'足利',49142,'2002-6-22');
$dict_aa = dict_append_proc ($dict_aa,"t0925",'日光',81953,'2002-10-18');
$dict_aa = dict_append_proc ($dict_aa,"t0926",'下野',72537,'2002-9-21');
$dict_aa = dict_append_proc ($dict_aa,"t0927",'さくら',49816,'2002-8-24');
$dict_aa = dict_append_proc ($dict_aa,"t0928",'矢板',52681,'2002-9-21');
$dict_aa = dict_append_proc ($dict_aa,"t0929",'真岡',74536,'2002-8-5');
$dict_aa = dict_append_proc ($dict_aa,"t0930",'栃木',27146,'2002-6-17');
$dict_aa = dict_append_proc ($dict_aa,"t0931",'大田原',25371,'2002-8-15');
$dict_aa = dict_append_proc ($dict_aa,"t0932",'鹿沼',38179,'2002-9-17');
$dict_aa = dict_append_proc ($dict_aa,"t0933",'那須塩原',19436,'2002-7-11');
$dict_aa = dict_append_proc ($dict_aa,"t0934",'那須烏山',73912,'2002-8-24');

	return	$dict_aa;
}

// ----------------------------------------------------------------
fputs (STDERR,"*** 開始 ***\n");

include('Requests/library/Requests.php');
Requests::register_autoloader();


$dict_aa = data_prepare_proc ();

$url_base = "http://localhost:9200/cities/tochigi";

foreach ($dict_aa as $key => $value)
	{
	$json_str = json_encode($value);
	print $key . "\n";
	$url = $url_base . "/" . $key;

	$headers = array('content-type' => 'application/json');
	$request = Requests::put($url,$headers, $json_str);	
	};


fputs (STDERR,"*** 終了 ***\n");
// ----------------------------------------------------------------
?>

