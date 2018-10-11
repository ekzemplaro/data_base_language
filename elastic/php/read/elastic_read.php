#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	php/read/elastic_read.php
//
//					Oct/12/2018
//
// ------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "text_manipulate.php";
//
// ------------------------------------------------------------------
fputs (STDERR,"*** 開始 ***\n");

include('Requests/library/Requests.php');
Requests::register_autoloader();

$url = "http://localhost:9200/cities/tochigi/_search?q=*&size=100";

$request = Requests::get($url, array('Accept' => 'application/json'));

$json_string = $request->body;

$data_aa = json_decode ($json_string,true);

// var_dump ($data_aa['hits']['hits']);

$count = count($data_aa['hits']['hits']);

print $count . "\n";

$dict_aa = array ();

foreach ($data_aa['hits']['hits'] as $unit)
	{
	$key = $unit['_id'];
	$dict_aa[$key] = $unit['_source'];
	}

dict_display_proc ($dict_aa);

fputs (STDERR,"*** 終了 ***\n");
// ------------------------------------------------------------------
?>
