<?php
// ---------------------------------------------------------------------
//	sqlite3_php_read.php
//
//					Apr/25/2011
//
// ---------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "sql_to_json.php";
include "text_manipulate.php";
//
// ---------------------------------------------------------------------
$sqlite3_file = "/var/tmp/sqlite3/cities.db";

$dbcon = new PDO ("sqlite:" . $sqlite3_file);

$json_str = sql_to_json_lower_proc ($dbcon);

$dbcon = null;
// header("Content-Type: text/javascript; charset=utf-8");
// header("Content-Type: text/json; charset=utf-8");

echo $json_str;
// ---------------------------------------------------------------------
?>	
