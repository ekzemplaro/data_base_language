#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	php/create/ftp_create.php
//
//					Dec/23/2013
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "curl_get.php";
include "text_manipulate.php";

// ------------------------------------------------------------------
print	"*** 開始 ***\n";

$url_target = 'ftp://scott:tiger@host_dbase/city/iwate.json';

print	"url_target = " .$url_target . "\n";

$dict_aa=data_prepare_proc ();

$str_json = json_encode ($dict_aa);

curl_upload_proc ($url_target,$str_json);

print	"*** 終了 ***\n";


// ------------------------------------------------------------------
function data_prepare_proc ()
{
	$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,'t0361','盛岡',91572,'2002-11-28');
$dict_aa = dict_append_proc ($dict_aa,'t0362','久慈',53817,'2002-8-7');
$dict_aa = dict_append_proc ($dict_aa,'t0363','二戸',52136,'2002-9-15');
$dict_aa = dict_append_proc ($dict_aa,'t0364','宮古',48952,'2002-5-22');
$dict_aa = dict_append_proc ($dict_aa,'t0365','遠野',86431,'2002-10-11');
$dict_aa = dict_append_proc ($dict_aa,'t0366','八幡平',36527,'2002-9-21');
$dict_aa = dict_append_proc ($dict_aa,'t0367','大船渡',81549,'2002-8-24');
$dict_aa = dict_append_proc ($dict_aa,'t0368','一関',52687,'2002-9-21');
$dict_aa = dict_append_proc ($dict_aa,'t0369','花巻',71594,'2002-8-5');



	return $dict_aa;


}
// ------------------------------------------------------------------
?>
