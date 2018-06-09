<?php
// ------------------------------------------------------------------
//	jquery_php/update/berkeley_php_update.php
//
//					Sep/13/2011
// ------------------------------------------------------------------
// $path=$_SERVER["DOCUMENT_ROOT"]."/data_base/common/php_common";
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "cgi_manipulate.php";

// ------------------------------------------------------------------
$file_name="/var/tmp/berkeley/cities.db";

$dbh = dba_open($file_name,"c","db4");

$arry_param = cgi_manipulate ();

$count = 0;
$out_str = "";

foreach ($arry_param as $val_aa)
	{
	$key = $val_aa['id'];
	$population = $val_aa['population'];

	$json_string = dba_fetch($key, $dbh);

	$city = json_decode ($json_string);

	$city->population = $population;
	$city->date_mod = date ("Y-m-d");

	$encode = json_encode ($city);

	echo $encode . "\n";

	dba_replace ($key,$encode,$dbh);

	$count++;
	}

dba_close ($dbh);

$out_str .= "OK " . $count;

echo $out_str;

// ------------------------------------------------------------------
?>
