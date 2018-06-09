<?php
// ------------------------------------------------------------------
//	csv_php_delete.php
//
//				May/23/2011
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include	"cgi_manipulate.php";
include	"text_manipulate.php";
include	"file_io.php";

// ------------------------------------------------------------------
$file_in = "/var/tmp/csv/cities.csv";

$arry_param = cgi_manipulate ();

var_dump ($arry_param[0]);

$dict_aa = csv_read_proc ($file_in);

$count = 0;

$out_str = 'Ma/09/2011';

foreach ($arry_param as $val_aa)
	{
$out_str .= 'ppp ';

	$id = $val_aa;

	$dict_aa = dict_delete_proc ($dict_aa,$id);

	$count++;
	}

csv_write_proc ($file_in,$dict_aa);

$out_str .= 'OK ' . $count;

echo $out_str;

// ------------------------------------------------------------------
?>
