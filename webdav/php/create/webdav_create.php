#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	create/webdav_create.php
//
//					Jan/23/2012
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "curl_get.php";
include "text_manipulate.php";

// ------------------------------------------------------------------
print	"*** 開始 ***\n";

$url_target = 'http://host_dbase:3004/city/tokyo.json';

print	"url_target = " .$url_target . "\n";


$dict_aa=data_prepare_proc ();

$str_json = json_encode ($dict_aa);

curl_upload_proc ($url_target,$str_json);

print	"*** 終了 ***\n";


// ------------------------------------------------------------------
function data_prepare_proc ()
{
	$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,'t1351','八王子',91578,'2002-7-28');
$dict_aa = dict_append_proc ($dict_aa,'t1352','立川',53817,'2002-10-7');
$dict_aa = dict_append_proc ($dict_aa,'t1353','武蔵野',52536,'2002-1-16');
$dict_aa = dict_append_proc ($dict_aa,'t1354','三鷹',48182,'2002-5-22');
$dict_aa = dict_append_proc ($dict_aa,'t1355','青梅',87153,'2002-11-18');
$dict_aa = dict_append_proc ($dict_aa,'t1356','府中',36537,'2002-9-21');
$dict_aa = dict_append_proc ($dict_aa,'t1357','昭島',63549,'2002-8-24');
$dict_aa = dict_append_proc ($dict_aa,'t1358','調布',52685,'2002-2-15');
$dict_aa = dict_append_proc ($dict_aa,'t1359','町田',79432,'2002-8-5');



	return $dict_aa;


}
// ------------------------------------------------------------------
?>
