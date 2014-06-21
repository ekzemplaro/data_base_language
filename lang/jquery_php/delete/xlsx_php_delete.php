<?php
// ------------------------------------------------------------------
//	excel_php_delete.php
//
//				Aug/18/2013
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include	"cgi_manipulate.php";
include	"text_manipulate.php";
include	"excel_manipulate.php";

// ------------------------------------------------------------------
$file_xlsx = "/var/tmp/xlsx/cities.xlsx";

$arry_param = cgi_manipulate ();


$dict_aa = excel_read_proc ($file_xlsx);


foreach ($arry_param as $val_aa)
	{
	$id = $val_aa;

	$dict_aa = dict_delete_proc ($dict_aa,$id);
	}

excel_write_proc ($file_xlsx,$dict_aa);

$out_str = '*** OK ***';

echo $out_str;

// ------------------------------------------------------------------
?>
