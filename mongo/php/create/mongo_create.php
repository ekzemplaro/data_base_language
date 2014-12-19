#! /usr/bin/php
<?php
// --------------------------------------------------------------------
/*
	mongo_create.php

					Jun/26/2012

*/
// --------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "mongo_manipulate.php";
include "text_manipulate.php";
// --------------------------------------------------------------------
function data_prepare_proc ()
{
$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,'t1161','さいたま',71436,'2002-5-24');
$dict_aa = dict_append_proc ($dict_aa,'t1162','所沢',45391,'2002-8-12');
$dict_aa = dict_append_proc ($dict_aa,'t1163','越谷',59213,'2002-4-01');
$dict_aa = dict_append_proc ($dict_aa,'t1164','久喜',96329,'2002-10-29');
$dict_aa = dict_append_proc ($dict_aa,'t1165','熊谷',35736,'2002-7-14');
$dict_aa = dict_append_proc ($dict_aa,'t1166','秩父',24683,'2002-6-12');
$dict_aa = dict_append_proc ($dict_aa,'t1167','川越',82197,'2002-2-17');
$dict_aa = dict_append_proc ($dict_aa,'t1168','和光',18572,'2002-3-24');
$dict_aa = dict_append_proc ($dict_aa,'t1169','新座',79461,'2002-7-8');

	return	$dict_aa;
}

// --------------------------------------------------------------------
print	"*** 開始 ***\n";

$dict_aa = data_prepare_proc ();

$mm = new Mongo();
$db = $mm->city_db;
$col = $db->saitama;

dict_to_mongo_proc ($col,$dict_aa);

print	"*** 終了 ***\n";

// --------------------------------------------------------------------
?>
