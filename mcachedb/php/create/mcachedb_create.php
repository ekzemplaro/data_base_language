#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	create/mcachedb_create.php
//
//					Feb/06/2015
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "text_manipulate.php";

// ------------------------------------------------------------------
function data_prepare_proc ()
{
$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,'t1521','新潟',78214,'2002-4-14');
$dict_aa = dict_append_proc ($dict_aa,'t1522','長岡',92173,'2002-7-12');
$dict_aa = dict_append_proc ($dict_aa,'t1523','新発田',58291,'2002-8-1');
$dict_aa = dict_append_proc ($dict_aa,'t1524','上越',63729,'2002-11-29');
$dict_aa = dict_append_proc ($dict_aa,'t1525','糸魚川',15245,'2002-5-14');
$dict_aa = dict_append_proc ($dict_aa,'t1526','加茂',71384,'2002-6-12');
$dict_aa = dict_append_proc ($dict_aa,'t1527','三条',28957,'2002-4-17');
$dict_aa = dict_append_proc ($dict_aa,'t1528','佐渡',86152,'2002-3-24');
$dict_aa = dict_append_proc ($dict_aa,'t1529','柏崎',94261,'2002-7-8');
$dict_aa = dict_append_proc ($dict_aa,'t1530','村上',25376,'2002-5-12');
$dict_aa = dict_append_proc ($dict_aa,'t1531','十日町',38579,'2002-9-25');
$dict_aa = dict_append_proc ($dict_aa,'t1532','五泉',61428,'2002-10-7');

	return	$dict_aa;
}

// ------------------------------------------------------------------
print "*** 開始 ***\n";

$dict_aa = data_prepare_proc ();

$mc = new Memcached();
$mc->addServer ("host_ubuntu1",21201);

foreach ($dict_aa as $key => $value)
	{
	$json_out = json_encode ($value);
	$result = $mc->set($key,$json_out);
	}

print "*** 終了 ***\n";
// ------------------------------------------------------------------
?>
