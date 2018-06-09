<?php
// ------------------------------------------------------------------
//	ftp_php_delete.php
//
//				Oct/02/2012
// ------------------------------------------------------------------
// $path=$_SERVER["DOCUMENT_ROOT"]."/data_base/common/php_common";
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include	"curl_get.php";
include "text_manipulate.php";
include "cgi_manipulate.php";

// ------------------------------------------------------------------
$url_in = 'ftp://scott:tiger@host_dbase/city/iwate.json';
$json_string = curl_get_proc ($url_in);
$dict_aa = json_decode ($json_string,true);
$rev=$dict_aa->_rev;
//
echo "check aaaa<br />";

$arry_param = cgi_manipulate ();

$out_str = "";

foreach ($arry_param as $id)
	{
	echo "check bbb $id<br />";
	$dict_aa=dict_delete_proc ($dict_aa,$id);
	}

$js_out = json_encode ($dict_aa);
curl_upload_proc ($url_in,$js_out);

$out_str .= "*** OK *** " . $count;

echo $out_str;

// ------------------------------------------------------------------
?>
