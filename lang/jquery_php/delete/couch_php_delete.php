<?php
// ------------------------------------------------------------------
//	couch_php_delete.php
//
//				Jun/20/2014
// ------------------------------------------------------------------
// $path=$_SERVER["DOCUMENT_ROOT"]."/data_base/common/php_common";
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include	"curl_get.php";
// include "text_manipulate.php";
include "cgi_manipulate.php";

// ------------------------------------------------------------------
$url_in = 'http://localhost:5984/nagano';

//
echo "check aaaa<br />";

$arry_param = cgi_manipulate ();

$out_str = "";

foreach ($arry_param as $key)
	{
	echo "check bbb $key<br />";

	$url_target = $url_in . "/" . $key;
//
	$json_string = curl_get_proc ($url_target);
	$unit_aa = json_decode ($json_string,true);

	if (isset ($unit_aa['_rev']))
		{
		print $unit_aa['name'] . "\n";
		print $unit_aa['_rev'] . "\n";

		$url_del = $url_target . "?rev=" . $unit_aa['_rev'];

		curl_delete_proc ($url_del);
		}
	}

$out_str .= "*** OK *** " . $count;

echo $out_str;

// ------------------------------------------------------------------
?>
