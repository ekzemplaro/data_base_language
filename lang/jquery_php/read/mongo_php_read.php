<?php
// ---------------------------------------------------------------------
//	mongo_php_read.php
//
//					Jun/26/2012
//
// ---------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include ("text_manipulate.php");
include ("mongo_manipulate.php");
//
// ---------------------------------------------------------------------
$mm = new Mongo();

$db = $mm->city_db;

$col = $db->saitama;

$dict_aa = mongo_to_dict_proc ($col);

$json_str = json_encode ($dict_aa);


echo $json_str;
// ---------------------------------------------------------------------
?>	
