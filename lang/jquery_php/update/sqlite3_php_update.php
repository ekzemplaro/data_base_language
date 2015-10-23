<?php
// ------------------------------------------------------------------
//	jquery_php/update/sqlite3_php_update.php
//
//				Oct/29/2013
// ------------------------------------------------------------------
//$path=$_SERVER["DOCUMENT_ROOT"]."/data_base/common/php_common";
$path="/var/www/data_base/common/php_common";

set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include	"sql_manipulate.php";
// ------------------------------------------------------------------
$dbcon = new PDO ("sqlite:/var/tmp/sqlite3/cities.db");

$count = 0;

if (isset ($_REQUEST['my_data']))
	{
	$out_str = "";
	$count = 0;
	$tmp = $_REQUEST['my_data'];
	$data_modified = str_replace ('\"', '"',$tmp);

	foreach ($data_modified as $key_aa => $val_aa)
		{
		$id = $val_aa['id'];
		$population = $val_aa['population'];
echo $id . "__ ";
echo $population . "__ ";

		sql_update_proc ($dbcon,$id,$population);

		$count++;
		}


	$out_str = "OK " . $count;

//	echo "OK ***";
	echo $out_str;
	}
else
	{
	echo "NG ***";
	}

// ------------------------------------------------------------------
?>
