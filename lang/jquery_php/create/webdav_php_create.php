<?php
// ------------------------------------------------------------------
//	jquery_php/create/webdav_php_create.php
//
//					Jan/24/2012
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "curl_get.php";
include "couch_manipulate.php";
include "text_manipulate.php";

// ------------------------------------------------------------------
$url_target = 'http://host_dbase:3004/city/tokyo.json';

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

	$dict_aa = dict_append_proc ($dict_aa,'t1351','八王子',48700,'2002-3-8');
	$dict_aa = dict_append_proc ($dict_aa,'t1352','立川',72900,'2002-2-17');
	$dict_aa = dict_append_proc ($dict_aa,'t1353','武蔵野',12500,'2002-9-25');
	$dict_aa = dict_append_proc ($dict_aa,'t1354','三鷹',42300,'2002-5-22');
	$dict_aa = dict_append_proc ($dict_aa,'t1355','青梅',82800,'2002-7-11');
	$dict_aa = dict_append_proc ($dict_aa,'t1356','府中',32900,'2002-9-21');
	$dict_aa = dict_append_proc ($dict_aa,'t1357','昭島',42700,'2002-10-24');
	$dict_aa = dict_append_proc ($dict_aa,'t1358','調布',52400,'2002-9-21');
	$dict_aa = dict_append_proc ($dict_aa,'t1359','町田',72800,'2002-8-05');

	return $dict_aa;
}

// ------------------------------------------------------------------
?>
