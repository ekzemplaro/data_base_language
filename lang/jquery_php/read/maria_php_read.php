<?php
// ---------------------------------------------------------------------
//	maria_php_read.php
//
//					Apr/25/2017
//
// ---------------------------------------------------------------------
//$path=$_SERVER["DOCUMENT_ROOT"]."/data_base/common/php_common";
$path="/var/www/data_base/common/php_common";

set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "sql_to_json.php";
include "text_manipulate.php";
//
// ---------------------------------------------------------------------
$dsn = 'mysql:dbname=city;host=localhost';
$user = 'scott';
$password = 'tiger123';

$dbcon = new PDO ($dsn, $user,$password);

// --------------------------------------------------------------------


$json_str = sql_to_json_lower_proc ($dbcon);
//  $json_str = sql_to_json_upper_proc ($dbcon);

$dbcon = null;

// header("Content-Type: text/javascript; charset=utf-8");
// header("Content-Type: text/json; charset=utf-8");

echo $json_str;
// ---------------------------------------------------------------------
?>	
