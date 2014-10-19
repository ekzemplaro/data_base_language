#! /usr/bin/php
<?php
//
//	mcached_create.php
//
//					Oct/07/2014
//
// ----------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "text_manipulate.php";
// ----------------------------------------------------------------
function data_prepare_proc ()
{
$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,'t1731','金沢',73614,'2002-5-14');
$dict_aa = dict_append_proc ($dict_aa,'t1732','輪島',41579,'2002-8-12');
$dict_aa = dict_append_proc ($dict_aa,'t1733','小松',58291,'2002-9-1');
$dict_aa = dict_append_proc ($dict_aa,'t1734','七尾',63729,'2002-10-29');
$dict_aa = dict_append_proc ($dict_aa,'t1735','珠洲',17345,'2002-7-14');
$dict_aa = dict_append_proc ($dict_aa,'t1736','加賀',76381,'2002-6-12');
$dict_aa = dict_append_proc ($dict_aa,'t1737','羽咋',21957,'2002-4-17');
$dict_aa = dict_append_proc ($dict_aa,'t1738','かほく',85173,'2002-3-24');
$dict_aa = dict_append_proc ($dict_aa,'t1739','白山',94261,'2002-7-8');

	return	$dict_aa;
}

// ----------------------------------------------------------------
print	"*** 開始 ***\n";

$dict_aa = data_prepare_proc ();

$mc = new Memcached();
$mc->addServer("localhost", 11211);


foreach ($dict_aa as $key => $value)
	{
	$json_out = json_encode ($value);
	$result = $mc->set($key,$json_out);
	}

print	"*** 終了 ***\n";
// ----------------------------------------------------------------
?>
