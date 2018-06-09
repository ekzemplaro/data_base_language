<?php
// ---------------------------------------------------------------------
//	maria_php_create.php
//
//					Apr/25/2017
//
// ---------------------------------------------------------------------
// $path=$_SERVER["DOCUMENT_ROOT"]."/data_base/common/php_common";
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "text_manipulate.php";
include "sql_display.php";
include "sql_manipulate.php";

//
// ---------------------------------------------------------------------
function data_prepare_proc ()
{
$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,'t3321','岡山',581400,'2002-4-21');
$dict_aa = dict_append_proc ($dict_aa,'t3322','倉敷',847300,'2002-9-8');
$dict_aa = dict_append_proc ($dict_aa,'t3323','津山',271600,'2002-11-15');
$dict_aa = dict_append_proc ($dict_aa,'t3324','玉野',537900,'2002-7-25');
$dict_aa = dict_append_proc ($dict_aa,'t3325','笠岡',274500,'2002-5-3');
$dict_aa = dict_append_proc ($dict_aa,'t3326','井原',831900,'2002-6-12');
$dict_aa = dict_append_proc ($dict_aa,'t3327','総社',685400,'2002-4-7');
$dict_aa = dict_append_proc ($dict_aa,'t3328','高梁',291300,'2002-3-18');
$dict_aa = dict_append_proc ($dict_aa,'t3329','新見',745800,'2002-1-9');

	return	$dict_aa;
}
// ---------------------------------------------------------------------
$dict_aa = data_prepare_proc ();

$dsn = 'mysql:dbname=city;host=localhost';
$user = 'scott';
$password = 'tiger123';

$dbcon = new PDO ($dsn, $user,$password);

drop_table_proc ($dbcon);
create_table_proc ($dbcon);

dict_to_db_proc ($dict_aa,$dbcon);

$dbcon = null;


// header("Content-Type: text/javascript; charset=utf-8");
// header("Content-Type: text/json; charset=utf-8");

echo "*** OK ***";
// ---------------------------------------------------------------------
?>	
