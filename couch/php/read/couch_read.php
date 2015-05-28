#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	php/read/couch_read.php
//
//					May/06/2015
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "curl_get.php";
include "text_manipulate.php";
include "couch_manipulate.php";
// ------------------------------------------------------------------
print	"*** 開始 ***\n";

$url_collection = 'http://localhost:5984/nagano';
print	"url_collection = " .$url_collection . "\n";

$dict_aa=couch_to_dict_proc ($url_collection);

dict_display_proc ($dict_aa);

print	"*** 終了 ***\n";

// ------------------------------------------------------------------
?>
