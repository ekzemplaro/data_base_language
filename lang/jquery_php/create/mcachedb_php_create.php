<?php
// ---------------------------------------------------------------------
//	mcachedb_php_create.php
//
//					Oct/09/2014
//
// ---------------------------------------------------------------------
//$path=$_SERVER["DOCUMENT_ROOT"]."/data_base/common/php_common";
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "text_manipulate.php";

// ---------------------------------------------------------------------
function data_prepare_proc ()
{
$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,'t1521','新潟',61400,'2002-4-14');
$dict_aa = dict_append_proc ($dict_aa,'t1522','長岡',97300,'2002-7-12');
$dict_aa = dict_append_proc ($dict_aa,'t1523','新発田',58100,'2002-8-1');
$dict_aa = dict_append_proc ($dict_aa,'t1524','上越',32900,'2002-11-29');
$dict_aa = dict_append_proc ($dict_aa,'t1525','糸魚川',52400,'2002-5-14');
$dict_aa = dict_append_proc ($dict_aa,'t1526','加茂',78400,'2002-6-12');
$dict_aa = dict_append_proc ($dict_aa,'t1527','三条',25700,'2002-4-17');
$dict_aa = dict_append_proc ($dict_aa,'t1528','佐渡',86100,'2002-3-24');
$dict_aa = dict_append_proc ($dict_aa,'t1529','柏崎',94200,'2002-7-8');
$dict_aa = dict_append_proc ($dict_aa,'t1530','村上',25300,'2002-5-12');
$dict_aa = dict_append_proc ($dict_aa,'t1531','十日町',38900,'2002-9-25');
$dict_aa = dict_append_proc ($dict_aa,'t1532','五泉',62800,'2002-10-7');

	return	$dict_aa;
}
// ---------------------------------------------------------------------
$dict_aa = data_prepare_proc ();

$mc = new Memcached();
$mc->addServer ("localhost",21201);

foreach ($dict_aa as $key => $value)
	{
	$json_out = json_encode ($value);
	$result = $mc->set($key,$json_out);
	}

echo "*** OK ***";
// ---------------------------------------------------------------------
?>	
