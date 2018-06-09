<?php
// ---------------------------------------------------------------------
//	excel_php_create.php
//
//					Oct/11/2011
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

$dict_aa = dict_append_proc ($dict_aa,"t2971",'奈良',72300,'2002-6-28');
$dict_aa = dict_append_proc ($dict_aa,"t2972",'大和高田',34800,'2002-5-18');
$dict_aa = dict_append_proc ($dict_aa,"t2973",'大和郡山',29600,'2002-4-1');
$dict_aa = dict_append_proc ($dict_aa,"t2974",'天理',45300,'2002-10-29');
$dict_aa = dict_append_proc ($dict_aa,"t2975",'橿原',39700,'2002-7-14');
$dict_aa = dict_append_proc ($dict_aa,"t2976",'桜井',24800,'2002-6-12');
$dict_aa = dict_append_proc ($dict_aa,"t2977",'五條',56200,'2002-4-17');
$dict_aa = dict_append_proc ($dict_aa,"t2978",'御所',12700,'2002-3-8');
$dict_aa = dict_append_proc ($dict_aa,"t2979",'生駒',79600,'2002-5-14');
	return	$dict_aa;
}

// ------------------------------------------------------------------
$dict_aa = data_prepare_proc ();

$file_out="/var/tmp/excel/cities.xls";

excel_write_proc ($file_out,$dict_aa);

echo "*** OK ***";
// ---------------------------------------------------------------------
?>	
