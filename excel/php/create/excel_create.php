#! /usr/bin/php
<?php
//
//	excel_create.php
//
//					Oct/16/2016
//
// ----------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "text_manipulate.php";
include "excel_manipulate.php";
// ----------------------------------------------------------------
// error_reporting(E_ALL);

// date_default_timezone_set('Europe/London');


fputs (STDERR,"*** 開始 ***\n");

$file_out = $argv[1];
#
print ($file_out);
$dict_aa = data_prepare_proc ();
excel_write_proc ($file_out,$dict_aa);

// Echo memory peak usage
echo date('H:i:s') . " Peak memory usage: " . (memory_get_peak_usage(true) / 1024 / 1024) . " MB\r\n";

fputs (STDERR,"*** 終了 ***\n");

// ----------------------------------------------------------------
function data_prepare_proc ()
{
$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,'t2971','奈良',32518,'2002-2-14');
$dict_aa = dict_append_proc ($dict_aa,'t2972','大和高田',61473,'2002-8-12');
$dict_aa = dict_append_proc ($dict_aa,'t2973','大和郡山',57182,'2002-9-01');
$dict_aa = dict_append_proc ($dict_aa,'t2974','天理',46379,'2002-10-29');
$dict_aa = dict_append_proc ($dict_aa,'t2975','橿原',35715,'2002-7-14');
$dict_aa = dict_append_proc ($dict_aa,'t2976','桜井',29384,'2002-6-12');
$dict_aa = dict_append_proc ($dict_aa,'t2977','五條',82147,'2002-4-17');
$dict_aa = dict_append_proc ($dict_aa,'t2978','御所',92568,'2002-3-24');
$dict_aa = dict_append_proc ($dict_aa,'t2979','生駒',79451,'2002-7-8');

return	$dict_aa;

}

// ----------------------------------------------------------------
?>
