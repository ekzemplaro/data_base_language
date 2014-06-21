<?php
// ------------------------------------------------------------------
//	update/text_php_update.php
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
$file_in = "/var/tmp/plain_text/cities.txt";

$arry_param = cgi_manipulate ();

$dict_aa = text_read_proc ($file_in);

foreach ($arry_param as $val_aa)
	{
	$id = $val_aa['id'];
	$population = $val_aa['population'];

	$dict_aa = dict_update_proc
			($dict_aa,$id,$population);

	$count++;
	}

text_write_proc ($file_in,$dict_aa);

$out_str .= "OK " . $count;

echo $out_str;

// ------------------------------------------------------------------
?>
