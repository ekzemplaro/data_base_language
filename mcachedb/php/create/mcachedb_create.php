#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	create/mcachedb_create.php
//
//					Jun/20/2011
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "mcached_manipulate.php";
include "kvalue_manipulate.php";

// ------------------------------------------------------------------
print "*** 開始 ***\n";

$memc = memcache_connect('localhost', 21201);
$memc->addServer('localhost', 21201);


kvalue_insert_proc ($memc,'t1521','新潟',72641,'2002-12-15');
kvalue_insert_proc ($memc,'t1522','長岡',27238,'2002-5-17');
kvalue_insert_proc ($memc,'t1523','新発田',34291,'2002-4-4');
kvalue_insert_proc ($memc,'t1524','上越',14156,'2002-8-02');
kvalue_insert_proc ($memc,'t1525','糸魚川',24237,'2002-9-15');
kvalue_insert_proc ($memc,'t1526','加茂',14982,'2002-1-11');
kvalue_insert_proc ($memc,'t1527','三条',84541,'2002-6-28');
kvalue_insert_proc ($memc,'t1528','佐渡',73762,'2002-5-26');
kvalue_insert_proc ($memc,'t1529','柏崎',46235,'2002-10-15');
kvalue_insert_proc ($memc,'t1530','村上',53182,'2002-12-19');
kvalue_insert_proc ($memc,'t1531','十日町',21357,'2002-2-21');
kvalue_insert_proc ($memc,'t1532','五泉',95428,'2002-5-29');


print "*** 終了 ***\n";
?>
