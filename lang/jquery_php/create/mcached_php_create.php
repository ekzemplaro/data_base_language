<?php
// ---------------------------------------------------------------------
//	mcached_php_create.php
//
//					Oct/09/2014
//
// ---------------------------------------------------------------------
//$path=$_SERVER["DOCUMENT_ROOT"]."/data_base/common/common/php_common";
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "text_manipulate.php";
// ---------------------------------------------------------------------
function data_prepare_proc ()
{
$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,'t1731','金沢',31400,'2002-9-18');
$dict_aa = dict_append_proc ($dict_aa,'t1732','輪島',45900,'2002-2-23');
$dict_aa = dict_append_proc ($dict_aa,'t1733','小松',29100,'2002-5-7');
$dict_aa = dict_append_proc ($dict_aa,'t1734','七尾',63700,'2002-11-19');
$dict_aa = dict_append_proc ($dict_aa,'t1735','珠洲',13500,'2002-3-24');
$dict_aa = dict_append_proc ($dict_aa,'t1736','加賀',76100,'2002-8-12');
$dict_aa = dict_append_proc ($dict_aa,'t1737','羽咋',25700,'2002-1-17');
$dict_aa = dict_append_proc ($dict_aa,'t1738','かほく',85300,'2002-6-27');
$dict_aa = dict_append_proc ($dict_aa,'t1739','白山',96100,'2002-4-9');

	return	$dict_aa;
}
// ---------------------------------------------------------------------
$mc = new Memcached();
$mc->addServer("localhost", 11211);

$dict_aa = data_prepare_proc ();

foreach ($dict_aa as $key => $value)
	{
	$json_out = json_encode ($value);
	$result = $mc->set($key,$json_out);
	}

echo "*** OK ***";
// ---------------------------------------------------------------------
?>	
