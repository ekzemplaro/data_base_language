<?php
// ---------------------------------------------------------------------
//	json_php_create.php
//
//					Jun/13/2011
//
// ---------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "file_io.php";
include "text_manipulate.php";

// ---------------------------------------------------------------------
$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,"t0921",'宇都宮',78500,'2002-10-18');
$dict_aa = dict_append_proc ($dict_aa,"t0922",'小山',63100,'2002-8-7');
$dict_aa = dict_append_proc ($dict_aa,"t0923",'佐野',59700,'2002-1-15');
$dict_aa = dict_append_proc ($dict_aa,"t0924",'足利',41900,'2002-5-22');
$dict_aa = dict_append_proc ($dict_aa,"t0925",'日光',87600,'2002-7-11');
$dict_aa = dict_append_proc ($dict_aa,"t0926",'下野',35400,'2002-9-21');
$dict_aa = dict_append_proc ($dict_aa,"t0927",'さくら',48500,'2002-8-24');
$dict_aa = dict_append_proc ($dict_aa,"t0928",'矢板',56700,'2002-9-21');
$dict_aa = dict_append_proc ($dict_aa,"t0929",'真岡',71300,'2002-8-05');
$dict_aa = dict_append_proc ($dict_aa,"t0930",'栃木',96900,'2002-6-17');
$dict_aa = dict_append_proc ($dict_aa,"t0931",'大田原',25700,'2002-5-15');
$dict_aa = dict_append_proc ($dict_aa,"t0932",'鹿沼',78600,'2002-4-17');
$dict_aa = dict_append_proc ($dict_aa,"t0933",'那須塩原',29500,'2002-12-11');
$dict_aa = dict_append_proc ($dict_aa,"t0934",'那須烏山',23400,'2002-11-12');





$str_json = json_encode ($dict_aa);

$file_out = "/var/tmp/json/cities.json";

print	$file_out . "\n";

file_write_proc ($str_json,$file_out);

chmod ($file_out,0666);

echo "*** OK ***";

?>

