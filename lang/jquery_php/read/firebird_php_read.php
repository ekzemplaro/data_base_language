<?php
// ---------------------------------------------------------------------
//	jquery_firebird_read.php
//
//					Apr/25/2011
//
// ---------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "firebird_to_json.php";
include "text_manipulate.php";
//
// ---------------------------------------------------------------------
define("DBNAME","localhost:/var/tmp/firebird/cities.fdb");
define("DBUSER","sysdba");
define("DBPASS","tiger");

$dbh = ibase_connect(DBNAME,DBUSER,DBPASS,"UTF-8");


$json_str = firebird_to_json_proc ($dbh);
ibase_close($dbh);

// --------------------------------------------------------------------



// header("Content-Type: text/javascript; charset=utf-8");
// header("Content-Type: text/json; charset=utf-8");

echo $json_str;
// ---------------------------------------------------------------------
?>	
