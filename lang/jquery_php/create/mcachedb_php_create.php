<?php
// ---------------------------------------------------------------------
//	mcachedb_php_create.php
//
//					Jan/21/2013
//
// ---------------------------------------------------------------------
//$path=$_SERVER["DOCUMENT_ROOT"]."/data_base/common/php_common";
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "mcached_manipulate.php";
include "kvalue_manipulate.php";

// ---------------------------------------------------------------------
$memc = memcache_connect('localhost', 21201);
$memc->addServer('localhost', 21201);

kvalue_insert_proc ($memc,'t1521','新潟',52600,'2002-12-25');
kvalue_insert_proc ($memc,'t1522','長岡',17400,'2002-5-7');
kvalue_insert_proc ($memc,'t1523','新発田',64800,'2002-4-14');
kvalue_insert_proc ($memc,'t1524','上越',14500,'2002-8-2');
kvalue_insert_proc ($memc,'t1525','糸魚川',74200,'2002-9-15');
kvalue_insert_proc ($memc,'t1526','加茂',14900,'2002-1-11');
kvalue_insert_proc ($memc,'t1527','三条',84500,'2002-6-21');
kvalue_insert_proc ($memc,'t1528','佐渡',73600,'2002-5-26');
kvalue_insert_proc ($memc,'t1529','柏崎',41200,'2002-10-15');
kvalue_insert_proc ($memc,'t1530','村上',37100,'2002-12-19');
kvalue_insert_proc ($memc,'t1531','十日町',71300,'2002-2-12');
kvalue_insert_proc ($memc,'t1532','五泉',95200,'2002-5-29');

echo "*** OK ***";
// ---------------------------------------------------------------------
?>	
