<?php
// ---------------------------------------------------------------------
//	berkeley_php_read.php
//
//					Sep/13/2013
//
// ---------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "dba_manipulate.php";

// ---------------------------------------------------------------------
$file_in="/var/tmp/berkeley/cities.db";

$dict_aa = berkeley_to_dict_proc ($file_in);

$json_str = json_encode ($dict_aa);

echo $json_str;
// ---------------------------------------------------------------------
?>	
