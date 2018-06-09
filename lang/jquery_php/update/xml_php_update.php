<?php
// ------------------------------------------------------------------
//	jquery_php/update/xml_php_update.php
//
//				Oct/13/2011
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "cgi_manipulate.php";
include "xml_manipulate.php";
include "text_manipulate.php";
include "file_io.php";

// ------------------------------------------------------------------
$xml_file = "/var/tmp/xml_file/cities.xml";
$xml_string = file_get_contents ($xml_file);

$dict_aa = xml_to_dict_proc ($xml_string);

$arry_param = cgi_manipulate ();

foreach ($arry_param as $val_aa)
	{
	$id_in = $val_aa['id'];
	$population_in = $val_aa['population'];

	$dict_aa = dict_update_proc ($dict_aa,$id_in,$population_in);
	}

$str_xml = dict_to_xml_proc ($dict_aa);

file_write_proc ($str_xml,$xml_file);

echo "** OK ***";

// ------------------------------------------------------------------
?>
