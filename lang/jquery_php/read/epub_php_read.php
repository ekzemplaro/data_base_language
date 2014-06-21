<?php
// ---------------------------------------------------------------------
//	epub_php_read.php
//
//					Aug/20/2012
//
// ---------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include ("text_manipulate.php");
include ("epub_manipulate.php");
// ---------------------------------------------------------------------
$file_epub = "/var/tmp/epub/cities.epub";

$dict_aa = epub_to_dict_proc ($file_epub);

$json_str = json_encode ($dict_aa);

echo $json_str;
// ---------------------------------------------------------------------
?>	
