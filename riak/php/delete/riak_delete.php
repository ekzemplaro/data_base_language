#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	php/delete/riak_delete.php
//
//					Feb/09/2015
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "curl_get.php";
// ------------------------------------------------------------------
print	"*** 開始 ***\n";

$key_in = $argv[1];

print	"key_in = " .$key_in . "\n";

$url_target = 'http://host_ubuntu1:8098/riak/shimane/' . $key_in;

curl_delete_proc ($url_target);

print	"*** 終了 ***\n";

// ------------------------------------------------------------------
?>
