#! /usr/bin/php
<?php
// --------------------------------------------------------------------
/*
	read/mongo_read.php

					Jun/26/2012

*/
// --------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "text_manipulate.php";
include "mongo_manipulate.php";
// --------------------------------------------------------------------
print	"*** 開始 ***\n";

$mm = new Mongo();

$db = $mm->city_db;

$col = $db->saitama;

$dict_aa = mongo_to_dict_proc ($col);

dict_display_proc ($dict_aa);

print	"*** 終了 ***\n";

// --------------------------------------------------------------------
?>
