#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	berkeley_read.php
//
//					Sep/13/2013
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "text_manipulate.php";
include "dba_manipulate.php";
// ------------------------------------------------------------------
print "*** 開始 ***\n";
$file_db=$argv[1];

$dict_aa = berkeley_to_dict_proc ($file_db);

dict_display_proc ($dict_aa);

print "*** 終了 ***\n";
// ------------------------------------------------------------------
?> 
