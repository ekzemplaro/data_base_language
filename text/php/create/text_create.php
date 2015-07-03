#! /usr/bin/php
<?php
//
//	text_create.php
//
//					Jun/24/2015
//
// ----------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "text_manipulate.php";
include "file_io.php";
// ----------------------------------------------------------------
function data_prepare_proc ()
{
$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,'t2381','名古屋',72514,'2002-5-14');
$dict_aa = dict_append_proc ($dict_aa,'t2382','豊橋',68473,'2002-8-12');
$dict_aa = dict_append_proc ($dict_aa,'t2383','岡崎',57982,'2002-9-1');
$dict_aa = dict_append_proc ($dict_aa,'t2384','一宮',46329,'2002-10-29');
$dict_aa = dict_append_proc ($dict_aa,'t2385','蒲郡',31745,'2002-7-14');
$dict_aa = dict_append_proc ($dict_aa,'t2386','常滑',27631,'2002-6-12');
$dict_aa = dict_append_proc ($dict_aa,'t2387','大府',82197,'2002-4-17');
$dict_aa = dict_append_proc ($dict_aa,'t2388','瀬戸',98573,'2002-3-24');
$dict_aa = dict_append_proc ($dict_aa,'t2389','犬山',79461,'2002-7-8');

	return	$dict_aa;
}

// ----------------------------------------------------------------
print	"*** 開始 ***\n";

$file_out = $argv[1];

print	$file_out . "\n";

folder_create_proc ($file_out);

$dict_aa = data_prepare_proc ();

text_write_proc ($file_out,$dict_aa);

print	"*** 終了 ***\n";
?>
