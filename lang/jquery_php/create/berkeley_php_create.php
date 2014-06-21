<?php
// ---------------------------------------------------------------------
//	berkeley_php_create.php
//
//					Sep/13/2013
//
// ---------------------------------------------------------------------
//$path=$_SERVER["DOCUMENT_ROOT"]."/data_base/common/common/php_common";
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "text_manipulate.php";
include "dba_manipulate.php";

// ---------------------------------------------------------------------
function data_prepare_proc ()
{
$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,'t2451','津',47200,'2002-5-8');
$dict_aa = dict_append_proc ($dict_aa,'t2452','鈴鹿',91300,'2002-4-23');
$dict_aa = dict_append_proc ($dict_aa,'t2453','伊勢',58300,'2002-9-1');
$dict_aa = dict_append_proc ($dict_aa,'t2454','鳥羽',95100,'2002-11-29');
$dict_aa = dict_append_proc ($dict_aa,'t2455','四日市',78500,'2002-7-14');
$dict_aa = dict_append_proc ($dict_aa,'t2456','亀山',68100,'2002-6-12');
$dict_aa = dict_append_proc ($dict_aa,'t2457','尾鷲',19700,'2002-4-17');
$dict_aa = dict_append_proc ($dict_aa,'t2458','桑名',57300,'2002-3-27');
$dict_aa = dict_append_proc ($dict_aa,'t2459','志摩',76100,'2002-7-8');
$dict_aa = dict_append_proc ($dict_aa,'t2460','伊賀',82300,'2002-9-12');
$dict_aa = dict_append_proc ($dict_aa,'t2461','名張',59100,'2002-6-18');
$dict_aa = dict_append_proc ($dict_aa,'t2462','熊野',75800,'2002-5-24');

	return	$dict_aa;
}
// ---------------------------------------------------------------------
$db_file="/var/tmp/berkeley/cities.db";

$dict_aa = data_prepare_proc ();

dict_to_berkeley_proc ($dict_aa,$db_file);

echo "*** OK ***";
// ---------------------------------------------------------------------
?>	
