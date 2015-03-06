<?php
// ---------------------------------------------------------------------
//	postgre_php_read.php
//
//					Feb/09/2014
//
// ---------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";

//$path=$_SERVER["DOCUMENT_ROOT"]."/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "sql_to_json.php";
include "text_manipulate.php";
include "pg_manipulate.php";
//
// ---------------------------------------------------------------------
$server = 'localhost';
$dbname = 'city';
$user = 'scott';
$password = 'tiger';

$dict_aa = pg_to_dict_proc ($server,$dbname,$user,$password);

// header("Content-Type: text/javascript; charset=utf-8");
// header("Content-Type: text/json; charset=utf-8");

$encode = json_encode ($dict_aa);
echo $encode;
// ---------------------------------------------------------------------
?>	
