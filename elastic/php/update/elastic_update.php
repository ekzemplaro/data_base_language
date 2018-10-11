#! /usr/bin/php
<?php
// ------------------------------------------------------------------
//	update/elastic_update.php
//
//					Oct/12/2018
//
// ------------------------------------------------------------------
fputs (STDERR,"*** 開始 ***\n");

date_default_timezone_set('Asia/Tokyo');
include('Requests/library/Requests.php');
Requests::register_autoloader();

$key_in = $argv[1];
$population_in = intval ($argv[2]);

echo	$key_in . "\t";
echo	$population_in . "\n";

$url = "http://localhost:9200/cities/tochigi/" . $key_in . "/_update";

print $url . "\n";

$str_date_mod = date ("Y-m-d");

$params = array("population" => $population_in,"date_mod" => $str_date_mod);
$script = array("source" => "ctx._source.population = params.population; ctx._source.date_mod = params.date_mod", "lang" => "painless", "params" => $params);
$args = array("script" => $script);
$json_str = json_encode ($args);

$headers = array('content-type' => 'application/json');
$request = Requests::post($url,$headers, $json_str);

// var_dump($request);
var_dump($request->status_code);

fputs (STDERR,"*** 終了 ***\n");

// ------------------------------------------------------------------
?>
