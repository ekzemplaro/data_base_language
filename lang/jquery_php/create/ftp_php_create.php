<?php
// ------------------------------------------------------------------
//	jquery_php/create/ftp_php_create.php
//
//					Jan/21/2013
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "curl_get.php";
include "couch_manipulate.php";
include "text_manipulate.php";

// ------------------------------------------------------------------
$url_target = 'ftp://scott:tiger@host_dbase/city/iwate.json';

$dict_aa=data_prepare_proc ();

$str_json = json_encode ($dict_aa);

// echo $str_json;

curl_upload_proc ($url_target,$str_json);


// header ("Content-Type: text/javascript; charset=utf-8");

echo	"*** OK ***";
// ------------------------------------------------------------------
function data_prepare_proc ()
{
	$dict_aa = array ();

	$dict_aa = dict_append_proc ($dict_aa,'t0361','盛岡',17800,'2002-5-8');
	$dict_aa = dict_append_proc ($dict_aa,'t0362','久慈',63900,'2002-8-17');
	$dict_aa = dict_append_proc ($dict_aa,'t0363','二戸',52100,'2002-9-25');
	$dict_aa = dict_append_proc ($dict_aa,'t0364','宮古',42900,'2002-5-22');
	$dict_aa = dict_append_proc ($dict_aa,'t0365','遠野',82700,'2002-7-11');
	$dict_aa = dict_append_proc ($dict_aa,'t0366','八幡平',32100,'2002-9-21');
	$dict_aa = dict_append_proc ($dict_aa,'t0367','大船渡',45700,'2002-10-24');
	$dict_aa = dict_append_proc ($dict_aa,'t0368','一関',86400,'2002-9-21');
	$dict_aa = dict_append_proc ($dict_aa,'t0369','花巻',79300,'2002-8-05');

	return $dict_aa;
}

// ------------------------------------------------------------------
?>
