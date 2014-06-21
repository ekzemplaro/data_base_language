#! /usr/bin/php
<?php
//
//	json_create.php
//
//					Apr/28/2011
//
// ----------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "file_io.php";
include "text_manipulate.php";
// ----------------------------------------------------------------
print	"*** 開始 ***\n";

$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,"t0921",'宇都宮',78145,'2002-5-18');
$dict_aa = dict_append_proc ($dict_aa,"t0922",'小山',69237,'2002-10-7');
$dict_aa = dict_append_proc ($dict_aa,"t0923",'佐野',52846,'2002-9-15');
$dict_aa = dict_append_proc ($dict_aa,"t0924",'足利',49142,'2002-5-22');
$dict_aa = dict_append_proc ($dict_aa,"t0925",'日光',81952,'2002-11-11');
$dict_aa = dict_append_proc ($dict_aa,"t0926",'下野',72537,'2002-9-21');
$dict_aa = dict_append_proc ($dict_aa,"t0927",'さくら',49816,'2002-8-24');
$dict_aa = dict_append_proc ($dict_aa,"t0928",'矢板',52681,'2002-9-21');
$dict_aa = dict_append_proc ($dict_aa,"t0929",'真岡',74836,'2002-8-5');
$dict_aa = dict_append_proc ($dict_aa,"t0930",'栃木',26146,'2002-6-17');
$dict_aa = dict_append_proc ($dict_aa,"t0931",'大田原',25371,'2002-8-15');
$dict_aa = dict_append_proc ($dict_aa,"t0932",'鹿沼',28179,'2002-4-17');
$dict_aa = dict_append_proc ($dict_aa,"t0933",'那須塩原',29136,'2002-3-11');
$dict_aa = dict_append_proc ($dict_aa,"t0934",'那須烏山',83415,'2422-6-12');


$str_json = json_encode ($dict_aa);

#$file_out = "/var/tmp/json/cities.json";
$file_out = $argv[1];

print	$file_out . "\n";

file_write_proc ($str_json,$file_out);
chmod ($file_out,0666);

print	"*** 終了 ***\n";
// ----------------------------------------------------------------
?>

