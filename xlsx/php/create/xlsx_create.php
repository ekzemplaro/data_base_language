#! /usr/bin/php
<?php
//
//	xlsx_create.php
//
//					Sep/09/2018
//
// ----------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "text_manipulate.php";
include "xlsx_manipulate.php";

// ----------------------------------------------------------------
error_reporting(E_ALL);

fputs (STDERR,"*** 開始 ***\n");
date_default_timezone_set('Asia/Tokyo');

$xlsx_file = $argv[1];

$dict_aa = data_prepare_proc ();

xlsx_write_proc ($xlsx_file,$dict_aa);

fputs (STDERR,"*** 終了 ***\n");
// ----------------------------------------------------------------
function data_prepare_proc ()
{
$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,'t2971','奈良',59276,'2002-7-31');
$dict_aa = dict_append_proc ($dict_aa,'t2972','大和高田',47325,'2002-4-12');
$dict_aa = dict_append_proc ($dict_aa,'t2973','大和郡山',28914,'2002-9-01');
$dict_aa = dict_append_proc ($dict_aa,'t2974','天理',46379,'2002-10-29');
$dict_aa = dict_append_proc ($dict_aa,'t2975','橿原',36715,'2002-7-14');
$dict_aa = dict_append_proc ($dict_aa,'t2976','桜井',24387,'2002-6-12');
$dict_aa = dict_append_proc ($dict_aa,'t2977','五條',82149,'2002-4-17');
$dict_aa = dict_append_proc ($dict_aa,'t2978','御所',98561,'2002-3-24');
$dict_aa = dict_append_proc ($dict_aa,'t2979','生駒',79452,'2002-7-8');

return	$dict_aa;

}

// ----------------------------------------------------------------
?>
