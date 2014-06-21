<?php
// ---------------------------------------------------------------------
//	xlsx_php_create.php
//
//					Aug/19/2013
//
// ---------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include ("text_manipulate.php");
include ("excel_manipulate.php");
//
// --------------------------------------------------------------------
function data_prepare_proc ()
{
$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,"t2971",'奈良',23900,'2002-3-15');
$dict_aa = dict_append_proc ($dict_aa,"t2972",'大和高田',43500,'2002-8-12');
$dict_aa = dict_append_proc ($dict_aa,"t2973",'大和郡山',96100,'2002-9-5');
$dict_aa = dict_append_proc ($dict_aa,"t2974",'天理',53700,'2002-11-21');
$dict_aa = dict_append_proc ($dict_aa,"t2975",'橿原',97200,'2002-4-23');
$dict_aa = dict_append_proc ($dict_aa,"t2976",'桜井',48500,'2002-2-14');
$dict_aa = dict_append_proc ($dict_aa,"t2977",'五條',62900,'2002-8-12');
$dict_aa = dict_append_proc ($dict_aa,"t2978",'御所',27600,'2002-10-7');
$dict_aa = dict_append_proc ($dict_aa,"t2979",'生駒',96400,'2002-9-24');

	return	$dict_aa;
}

// ------------------------------------------------------------------
$dict_aa = data_prepare_proc ();

$file_out="/var/tmp/xlsx/cities.xlsx";

excel_write_proc ($file_out,$dict_aa);

echo "*** OK ***";
// ---------------------------------------------------------------------
?>	
