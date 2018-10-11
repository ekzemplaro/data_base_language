#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	elastic_delete.php
//
//					Oct/12/2018
//
// ------------------------------------------------------------------
fputs (STDERR,"*** 開始 ***\n");
include('Requests/library/Requests.php');
Requests::register_autoloader();

$key_in = $argv[1];

echo	$key_in . "\n";

$url = "http://localhost:9200/cities/tochigi/" . $key_in;

$request = Requests::delete($url);

var_dump($request->status_code);

fputs (STDERR,"*** 終了 ***\n");

// ------------------------------------------------------------------
?>
