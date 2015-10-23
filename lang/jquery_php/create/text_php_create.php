<?php
// ---------------------------------------------------------------------
//	text_php_create.php
//
//					Oct/11/2011
//
// ---------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include ("text_manipulate.php");
include ("file_io.php");
//
// --------------------------------------------------------------------
function data_prepare_proc ()
{
$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,"t2381",'名古屋',46500,'2002-9-12');
$dict_aa = dict_append_proc ($dict_aa,"t2382",'豊橋',63400,'2002-8-18');
$dict_aa = dict_append_proc ($dict_aa,"t2383",'岡崎',57200,'2002-9-1');
$dict_aa = dict_append_proc ($dict_aa,"t2384",'一宮',45300,'2002-10-29');
$dict_aa = dict_append_proc ($dict_aa,"t2385",'蒲郡',39700,'2002-7-14');
$dict_aa = dict_append_proc ($dict_aa,"t2386",'常滑',24300,'2002-6-12');
$dict_aa = dict_append_proc ($dict_aa,"t2387",'大府',56200,'2002-4-17');
$dict_aa = dict_append_proc ($dict_aa,"t2388",'瀬戸',12700,'2002-3-8');
$dict_aa = dict_append_proc ($dict_aa,"t2389",'犬山',31700,'2002-5-14');
	return	$dict_aa;
}
// ------------------------------------------------------------------
$file_out = "/var/tmp/plain_text/cities.txt";

$dict_aa = data_prepare_proc ();

print   $file_out . "\n";

text_write_proc ($file_out,$dict_aa);

// ---------------------------------------


echo "*** OK ***";
// ---------------------------------------------------------------------
?>	
