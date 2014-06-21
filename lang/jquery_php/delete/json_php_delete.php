<?php
// ------------------------------------------------------------------
//	json_php_delete.php
//
//				Apr/28/2011
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "cgi_manipulate.php";
include	"file_io.php";
include	"text_manipulate.php";

// ------------------------------------------------------------------
echo "*** json_php_delete.php ***<br />";
$json_file = "/var/tmp/json/cities.json";
$json_string = file_get_contents ($json_file);
// echo $json_string;
// echo "<p />";
$dict_aa = json_decode ($json_string,true);

$arry_param = cgi_manipulate ();

foreach ($arry_param as $id)
	{
	echo "delete id :" . $id . "<br />";
	$dict_aa = dict_delete_proc ($dict_aa,$id);
	}


$json_out = json_encode ($dict_aa);

echo $json_out;
echo "<p />";

file_write_proc ($json_out,$json_file);

echo "*** OK ***<br />";

// ------------------------------------------------------------------
?>
