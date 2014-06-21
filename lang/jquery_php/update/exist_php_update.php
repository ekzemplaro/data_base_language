<?php
// ------------------------------------------------------------------
//	jquery_php/update/exist_php_update.php
//
//				Oct/13/2011
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "curl_get.php";
include "cgi_manipulate.php";
include "xml_manipulate.php";
include "text_manipulate.php";

// ------------------------------------------------------------------
// $uri= 'http://admin:hello9@cpt003:8086/exist/rest/db';
$uri= 'http://localhost:8086/exist/rest/db';
$collections = "cities";
$xml_filename = 'cities.xml';
$uri_aa = $uri . "/" . $collections . "/" . $xml_filename;

echo $uri_aa . "<br />";

$xml_string = curl_get_proc ($uri_aa);

$dict_aa = xml_to_dict_proc ($xml_string);


$arry_param = cgi_manipulate ();
 echo "check bbbbbb<br />";

foreach ($arry_param as $val_aa)
	{
	$id_in = $val_aa['id'];
	$population_in = $val_aa['population'];
	$dict_aa = dict_update_proc ($dict_aa,$id_in,$population_in);
 echo "check cccccc ***" . $id_in . "<br />";
	}


$str_xml = dict_to_xml_proc ($dict_aa);


curl_put_proc ($uri_aa,$str_xml);

$out_str = "OK ";

echo $out_str;

// ------------------------------------------------------------------
?>
