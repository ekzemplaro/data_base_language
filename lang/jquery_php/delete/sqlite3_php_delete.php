<?php
// ------------------------------------------------------------------
//	sqlite3_php_delete.php
//
//					Oct/29/2013
// ------------------------------------------------------------------
// $path=$_SERVER["DOCUMENT_ROOT"]."/data_base/common/php_common";
$path="/var/www/data_base/common/php_common";

set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include	"sql_manipulate.php";
// ------------------------------------------------------------------
$dbcon = new PDO ("sqlite:/var/tmp/sqlite3/cities.db");

if (isset ($_REQUEST['my_data']))
	{
	$out_str = "";
	$count = 0;
	$tmp = $_REQUEST['my_data'];
	$data_modified = str_replace ('\"', '"',$tmp);

	foreach ($data_modified as $id)
		{
		sql_delete_proc ($dbcon,$id);

		$count++;
		}


	$out_str .= "OK " . $count;

	echo $out_str;
	}
else
	{
	echo "NG ***";
	}

// ------------------------------------------------------------------
?>
