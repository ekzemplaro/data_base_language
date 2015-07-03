#! /usr/bin/php
<?php
// --------------------------------------------------------------------
//	gdbm_create.php
//
//					Jun/11/2015
//
// --------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "text_manipulate.php";
// --------------------------------------------------------------------
function data_prepare_proc ()
{
$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,'t2151','岐阜',32564,'2002-7-16');
$dict_aa = dict_append_proc ($dict_aa,'t2152','大垣',98413,'2002-2-22');
$dict_aa = dict_append_proc ($dict_aa,'t2153','多治見',47982,'2002-8-9');
$dict_aa = dict_append_proc ($dict_aa,'t2154','各務原',16329,'2002-10-29');
$dict_aa = dict_append_proc ($dict_aa,'t2155','土岐',31745,'2002-7-14');
$dict_aa = dict_append_proc ($dict_aa,'t2156','高山',27631,'2002-6-12');
$dict_aa = dict_append_proc ($dict_aa,'t2157','美濃加茂',82197,'2002-4-17');
$dict_aa = dict_append_proc ($dict_aa,'t2158','恵那',98573,'2002-3-24');
$dict_aa = dict_append_proc ($dict_aa,'t2159','関',72461,'2002-7-8');

	return	$dict_aa;
}

// --------------------------------------------------------------------
print	"*** 開始 ***\n";

$file_in = $argv[1];

$dict_aa = data_prepare_proc ();

$id = dba_open ($file_in, "n", "gdbm");

if (!$id) {
        echo "dba_open failed\n";
        exit;
}

foreach ($dict_aa as $key => $value)
	{
	$json_out = json_encode ($value);
	dba_replace($key, $json_out, $id);
	}

dba_close($id);

print	"*** 終了 ***\n";
// --------------------------------------------------------------------
?>
