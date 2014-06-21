<?php
// ------------------------------------------------------------------
//	berkeley_php_delete.php
//
//					Sep/13/2013
// ------------------------------------------------------------------
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

foreach ($arry_param as $key)
	{
	dba_delete ($key,$dbh);

	$count++;
	}

dba_close ($dbh);

$out_str .= "OK " . $count;

echo $out_str;

// ------------------------------------------------------------------
?>
