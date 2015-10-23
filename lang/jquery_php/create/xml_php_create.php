<?php
// ---------------------------------------------------------------------
//	jquery_php/create/xml_php_create.php
//
//					Oct/13/2011
//
// ---------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "text_manipulate.php";
include "xml_manipulate.php";
include "file_io.php";
// ---------------------------------------------------------------------
function data_prepare_proc ()
{
$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,"t2261",'静岡',46500,'2002-9-12');
$dict_aa = dict_append_proc ($dict_aa,"t2262",'浜松',63400,'2002-8-18');
$dict_aa = dict_append_proc ($dict_aa,"t2263",'沼津',57200,'2002-9-1');
$dict_aa = dict_append_proc ($dict_aa,"t2264",'三島',45300,'2002-10-29');
$dict_aa = dict_append_proc ($dict_aa,"t2265",'富士',39700,'2002-7-14');
$dict_aa = dict_append_proc ($dict_aa,"t2266",'熱海',24300,'2002-6-12');
$dict_aa = dict_append_proc ($dict_aa,"t2267",'富士宮',56200,'2002-4-17');
$dict_aa = dict_append_proc ($dict_aa,"t2268",'藤枝',12700,'2002-3-8');
$dict_aa = dict_append_proc ($dict_aa,"t2269",'御殿場',31700,'2002-5-14');
$dict_aa = dict_append_proc ($dict_aa,"t2270",'島田',93500,'2002-9-21');
	return	$dict_aa;
}
// ---------------------------------------------------------------------

$xml_file = "/var/tmp/xml_file/cities.xml";

$dict_aa = data_prepare_proc ();

$str_xml = dict_to_xml_proc ($dict_aa);

file_write_proc ($str_xml,$xml_file);

echo "*** OK ***";

// echo json_encode ($xml);
?>
// ---------------------------------------------------------------------

