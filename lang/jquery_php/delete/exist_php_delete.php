<?php
// ------------------------------------------------------------------
//	exist_php_delete.php
//
//				May/10/2011
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "curl_get.php";
include "cgi_manipulate.php";

// ------------------------------------------------------------------
// $uri= 'http://admin:hello9@cpt003:8086/exist/rest/db';
$uri= 'http://localhost:8086/exist/rest/db';
$collections = "cities";
$xml_filename = 'cities.xml';
$uri_aa = $uri . "/" . $collections . "/" . $xml_filename;

echo $uri_aa . "<br />";

$xml_string = curl_get_proc ($uri_aa);

$root_table = simplexml_load_string ($xml_string);

$arry_param = cgi_manipulate ();

foreach ($arry_param as $id)
	{
	unset ($root_table->$id);
	}

$xml_out = $root_table->asXML();

curl_put_proc ($uri_aa,$xml_out);

$out_str = "OK ";

echo $out_str;

// ------------------------------------------------------------------
?>
