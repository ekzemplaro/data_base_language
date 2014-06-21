<?php
// ---------------------------------------------------------------------
//	mcached_php_create.php
//
//					Jul/02/2011
//
// ---------------------------------------------------------------------
//$path=$_SERVER["DOCUMENT_ROOT"]."/data_base/common/common/php_common";
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "mcached_manipulate.php";
include "kvalue_manipulate.php";

// ---------------------------------------------------------------------
$memc = memcache_connect('localhost', 11211);
$memc->addServer('localhost', 11211);

kvalue_insert_proc ($memc,'t1731','金沢',54600,'2002-12-10');
kvalue_insert_proc ($memc,'t1732','輪島',35200,'2002-5-8');
kvalue_insert_proc ($memc,'t1733','小松',72400,'2002-4-24');
kvalue_insert_proc ($memc,'t1734','七尾',94100,'2002-8-02');
kvalue_insert_proc ($memc,'t1735','珠洲',62500,'2002-9-15');
kvalue_insert_proc ($memc,'t1736','加賀',37900,'2002-1-11');
kvalue_insert_proc ($memc,'t1737','羽咋',74500,'2002-6-28');
kvalue_insert_proc ($memc,'t1738','かほく',13700,'2002-5-21');
kvalue_insert_proc ($memc,'t1739','白山',15200,'2002-10-12');

echo "*** OK ***";
// ---------------------------------------------------------------------
?>	
