<?php
// ---------------------------------------------------------------------
//	jquery_php/read/master_php_read.php
//
//					Jun/30/2014
//
// ---------------------------------------------------------------------
// $path=$_SERVER["DOCUMENT_ROOT"]."/data_base/common/php_common";
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "text_manipulate.php";

//
// ---------------------------------------------------------------------
$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,'t0421','仙台',78165,'2002-5-18');
$dict_aa = dict_append_proc ($dict_aa,'t0422','石巻',69537,'2002-10-7');
$dict_aa = dict_append_proc ($dict_aa,'t0423','塩竈',51876,'2002-9-15');
$dict_aa = dict_append_proc ($dict_aa,'t0424','気仙沼',43192,'2002-5-22');
$dict_aa = dict_append_proc ($dict_aa,'t0425','白石',82941,'2002-11-11');
$dict_aa = dict_append_proc ($dict_aa,'t0426','名取',32587,'2002-9-21');
$dict_aa = dict_append_proc ($dict_aa,'t0427','多賀城',72549,'2002-8-24');
$dict_aa = dict_append_proc ($dict_aa,'t0428','岩沼',52186,'2002-3-17');
$dict_aa = dict_append_proc ($dict_aa,'t0429','大崎',76934,'2002-8-5');

// ---------------------------------------------------------------------

	$encode = json_encode ($dict_aa);

// echo "Content-type: text/json";
// echo "";
// echo "";

echo $encode;
// ---------------------------------------------------------------------
?>	
