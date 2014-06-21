<?php
// ---------------------------------------------------------------------
//	mongo_php_create.php
//
//					Jun/26/2012
//
// ---------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include ("text_manipulate.php");
include ("mongo_manipulate.php");
//
// --------------------------------------------------------------------
function data_prepare_proc ()
{
$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,"t1161",'さいたま',52700,'2002-3-24');
$dict_aa = dict_append_proc ($dict_aa,"t1162",'所沢',48100,'2002-5-18');
$dict_aa = dict_append_proc ($dict_aa,"t1163",'越谷',57200,'2002-9-1');
$dict_aa = dict_append_proc ($dict_aa,"t1164",'久喜',45300,'2002-10-29');
$dict_aa = dict_append_proc ($dict_aa,"t1165",'熊谷',39700,'2002-7-14');
$dict_aa = dict_append_proc ($dict_aa,"t1166",'秩父',24300,'2002-6-12');
$dict_aa = dict_append_proc ($dict_aa,"t1167",'川越',56200,'2002-4-17');
$dict_aa = dict_append_proc ($dict_aa,"t1168",'和光',12500,'2002-3-8');
$dict_aa = dict_append_proc ($dict_aa,"t1169",'新座',36700,'2002-5-14');
	return	$dict_aa;
}
// ------------------------------------------------------------------
$dict_aa = data_prepare_proc ();

$mm = new Mongo();
$db = $mm->city_db;
$col = $db->saitama;

dict_to_mongo_proc ($col,$dict_aa);

// ---------------------------------------


echo "*** OK ***";
// ---------------------------------------------------------------------
?>	
