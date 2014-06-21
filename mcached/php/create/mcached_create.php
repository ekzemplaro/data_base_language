#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	create/mcached_create.php
//
//					May/30/2011
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "mcached_manipulate.php";
include "kvalue_manipulate.php";

// ------------------------------------------------------------------
$memc = memcache_connect('localhost', 11211);
$memc->addServer('localhost', 11211);

print "*** 開始 ***\n";

kvalue_insert_proc ($memc,'t1731','金沢',74621,'2002-2-10');
kvalue_insert_proc ($memc,'t1732','輪島',15298,'2002-9-12');
kvalue_insert_proc ($memc,'t1733','小松',43947,'2002-4-24');
kvalue_insert_proc ($memc,'t1734','七尾',38159,'2002-8-02');
kvalue_insert_proc ($memc,'t1735','珠洲',27186,'2002-9-15');
kvalue_insert_proc ($memc,'t1736','加賀',16935,'2002-1-11');
kvalue_insert_proc ($memc,'t1737','羽咋',81594,'2002-6-28');
kvalue_insert_proc ($memc,'t1738','かほく',25783,'2002-5-21');
kvalue_insert_proc ($memc,'t1739','白山',41257,'2002-10-12');

mcached_display_proc ($memc);

print "*** 終了 ***\n";
?>
