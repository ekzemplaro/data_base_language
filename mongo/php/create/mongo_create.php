#! /usr/bin/php
<?php
// --------------------------------------------------------------------
/*
	mongo_create.php

					Jul/31/2018

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

$dict_aa = dict_append_proc ($dict_aa,'t1161','さいたま',82136,'2002-5-18');
$dict_aa = dict_append_proc ($dict_aa,'t1162','所沢',61378,'2002-11-15');
$dict_aa = dict_append_proc ($dict_aa,'t1163','越谷',59213,'2002-4-1');
$dict_aa = dict_append_proc ($dict_aa,'t1164','久喜',96329,'2002-10-29');
$dict_aa = dict_append_proc ($dict_aa,'t1165','熊谷',35736,'2002-7-14');
$dict_aa = dict_append_proc ($dict_aa,'t1166','秩父',24683,'2002-6-12');
$dict_aa = dict_append_proc ($dict_aa,'t1167','川越',82197,'2002-2-17');
$dict_aa = dict_append_proc ($dict_aa,'t1168','和光',18572,'2002-3-24');
$dict_aa = dict_append_proc ($dict_aa,'t1169','新座',39261,'2002-4-8');

	return	$dict_aa;
}

// --------------------------------------------------------------------
fputs (STDERR,"*** 開始 ***\n");

$dict_aa = data_prepare_proc ();

$user = 'scott';
$password = 'tiger123';

dict_to_mongo_proc ($dict_aa,$user,$password);

fputs (STDERR,"*** 終了 ***\n");

// --------------------------------------------------------------------
?>
