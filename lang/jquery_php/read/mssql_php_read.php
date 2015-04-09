<?php
// ---------------------------------------------------------------------
//	mssql_php_read.php
//
//					Mar/25/2015
//
// ---------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";

set_include_path (get_include_path() . PATH_SEPARATOR . $path);

// include "sql_to_json.php";
include "text_manipulate.php";
//
// ---------------------------------------------------------------------
$server = 'host_mssql:1433';
$user = 'sa';
$password = 'scott_tiger';

$link = mssql_connect ($server,$user,$password);

$selected = mssql_select_db ("city")
		or die ("Couldn’t open database databasename\n");

$dict_aa = array ();

$result = mssql_query ("select * from cities");

while($row = mssql_fetch_array($result))
	{
	$name = $row["name"];

	$dict_aa = dict_append_proc ($dict_aa,$row["id"],
			$name,$row["population"],$row["date_mod"]);
	}

mssql_close();


$json_str = json_encode ($dict_aa);

echo $json_str;
// ---------------------------------------------------------------------
?>	
