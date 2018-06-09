<?php
// ------------------------------------------------------------------
//	xml_php_delete.php
//
//				Jun/13/2011
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "cgi_manipulate.php";

// ------------------------------------------------------------------
$xml_file = "/var/tmp/xml_file/cities.xml";
$xml_string = file_get_contents ($xml_file);

$root = simplexml_load_string ($xml_string);

$arry_param = cgi_manipulate ();

foreach ($arry_param as $id)
	{
	echo "delete id :" . $id . "<br />";

	unset ($root->$id);
	}

$root->asXML ($xml_file);

echo "** OK ***";

// ------------------------------------------------------------------
?>
