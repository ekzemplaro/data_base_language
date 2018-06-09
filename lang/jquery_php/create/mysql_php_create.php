<?php
// ---------------------------------------------------------------------
//	mysql_php_create.php
//
//					Sep/17/2013
//
// ---------------------------------------------------------------------
// $path=$_SERVER["DOCUMENT_ROOT"]."/data_base/common/php_common";
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "text_manipulate.php";
include "sql_display.php";
include "sql_manipulate.php";
include "mysql_utf8.php";

//
// ---------------------------------------------------------------------
function data_prepare_proc ()
{
$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,'t3321','岡山',51400,'2002-8-5');
$dict_aa = dict_append_proc ($dict_aa,'t3322','倉敷',87300,'2002-4-22');
$dict_aa = dict_append_proc ($dict_aa,'t3323','津山',21600,'2002-9-9');
$dict_aa = dict_append_proc ($dict_aa,'t3324','玉野',37900,'2002-11-12');
$dict_aa = dict_append_proc ($dict_aa,'t3325','笠岡',74500,'2002-7-21');
$dict_aa = dict_append_proc ($dict_aa,'t3326','井原',31900,'2002-6-9');
$dict_aa = dict_append_proc ($dict_aa,'t3327','総社',85400,'2002-4-1');
$dict_aa = dict_append_proc ($dict_aa,'t3328','高梁',21300,'2002-3-12');
$dict_aa = dict_append_proc ($dict_aa,'t3329','新見',75800,'2002-1-18');

	return	$dict_aa;
}
// ---------------------------------------------------------------------
$dict_aa = data_prepare_proc ();

$dsn = 'mysql:dbname=city;host=host_mysql';
$user = 'scott';
$password = 'tiger';

$dbcon = new PDO ($dsn, $user,$password);

mysql_utf8_proc ($dbcon);

drop_table_proc ($dbcon);
create_table_proc ($dbcon);

dict_to_db_proc ($dict_aa,$dbcon);

$dbcon = null;


// header("Content-Type: text/javascript; charset=utf-8");
// header("Content-Type: text/json; charset=utf-8");

echo "*** OK ***";
// ---------------------------------------------------------------------
?>	
