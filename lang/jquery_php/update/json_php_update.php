<?php
// ------------------------------------------------------------------
//	jquery_php/update/son_php_update.php
//
//				Jun/13/2011
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include	"file_io.php";
include	"text_manipulate.php";
include "cgi_manipulate.php";

// ------------------------------------------------------------------
$json_file = "/var/tmp/json/cities.json";
$json_string = file_get_contents ($json_file);
$dict_aa = json_decode ($json_string,true);

$arry_param = cgi_manipulate ();

for ($it=0; $it < count ($arry_param); $it++)
	{
	$id = $arry_param[$it]['id'];
	$population = $arry_param[$it]['population'];

	echo $id . " ";

	echo $population . "<br />";
	$dict_aa = dict_update_proc ($dict_aa,$id,$population);
	}

$json_file_out = $json_file;

$json_encoded = json_encode ($dict_aa);

file_write_proc ($json_encoded,$json_file_out);

echo "*** OK ***";

// ------------------------------------------------------------------
?>
