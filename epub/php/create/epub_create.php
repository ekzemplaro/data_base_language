#! /usr/bin/php
<?php
//
//	epub_create.php
//
//					Aug/20/2012
//
// ----------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "text_manipulate.php";
include "epub_manipulate.php";
include "file_io.php";
// ----------------------------------------------------------------
function data_prepare_proc ()
{
$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,'t1931','甲府',51436,'2002-3-18');
$dict_aa = dict_append_proc ($dict_aa,'t1932','富士吉田',68473,'2002-8-22');
$dict_aa = dict_append_proc ($dict_aa,'t1933','都留',57281,'2002-9-1');
$dict_aa = dict_append_proc ($dict_aa,'t1934','山梨',46329,'2002-10-29');
$dict_aa = dict_append_proc ($dict_aa,'t1935','大月',15736,'2002-7-14');
$dict_aa = dict_append_proc ($dict_aa,'t1936','韮崎',24687,'2002-6-12');
$dict_aa = dict_append_proc ($dict_aa,'t1937','南アルプス',82197,'2002-4-17');
$dict_aa = dict_append_proc ($dict_aa,'t1938','北杜',92578,'2002-3-24');
$dict_aa = dict_append_proc ($dict_aa,'t1939','甲斐',79463,'2002-5-8');

	return	$dict_aa;
}

// ----------------------------------------------------------------
print	"*** 開始 ***\n";

$file_epub = $argv[1];

print	$file_epub . "\n";

$dict_aa = data_prepare_proc ();

dict_to_epub_proc ($dict_aa,$file_epub);

print	"*** 終了 ***\n";
// ----------------------------------------------------------------
?>
