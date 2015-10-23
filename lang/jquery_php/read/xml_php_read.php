<?php
// ---------------------------------------------------------------------
//	jquery_php/read/xml_php_read.php
//
//					Oct/13/2011
//
// ---------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include ("file_io.php");
// ---------------------------------------------------------------------
$xml_file = "/var/tmp/xml_file/cities.xml";

$xml_string = file_get_contents ($xml_file);

$xml = simplexml_load_string ($xml_string);

echo json_encode ($xml);
?>
