<?php
// ---------------------------------------------------------------------
//	postgre_php_create.php
//
//					Feb/09/2015
//
// ---------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "text_manipulate.php";
include "pg_manipulate.php";
//
// ---------------------------------------------------------------------
function data_prepare_proc ()
{
$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,'t3461','広島',51400,'2002-8-5');
$dict_aa = dict_append_proc ($dict_aa,'t3462','福山',87300,'2002-7-25');
$dict_aa = dict_append_proc ($dict_aa,'t3463','東広島',71600,'2002-6-11');
$dict_aa = dict_append_proc ($dict_aa,'t3464','呉',57900,'2002-9-29');
$dict_aa = dict_append_proc ($dict_aa,'t3465','尾道',74500,'2002-11-24');
$dict_aa = dict_append_proc ($dict_aa,'t3466','竹原',21900,'2002-6-12');
$dict_aa = dict_append_proc ($dict_aa,'t3467','三次',82400,'2002-4-15');
$dict_aa = dict_append_proc ($dict_aa,'t3468','大竹',51300,'2002-3-4');
$dict_aa = dict_append_proc ($dict_aa,'t3469','府中',79200,'2002-1-18');

	return	$dict_aa;
}

// ---------------------------------------------------------------------
$dict_aa = data_prepare_proc ();

$server = 'localhost';
$dbname = 'city';
$user = 'scott';
$password = 'tiger';

dict_to_pg_proc ($dict_aa,$server,$dbname,$user,$password);



// header("Content-Type: text/javascript; charset=utf-8");
// header("Content-Type: text/json; charset=utf-8");

print "*** OK ***";

// ---------------------------------------------------------------------
?>	
