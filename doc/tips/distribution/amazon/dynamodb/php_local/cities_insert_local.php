#! /usr/bin/php
<?php
// --------------------------------------------------------------------
/*
	cities_insert_local.php

						Feb/24/2017
*/
// --------------------------------------------------------------------
require 'vendor/autoload.php';

date_default_timezone_set('UTC');

use Aws\DynamoDb\Exception\DynamoDbException;
use Aws\DynamoDb\Marshaler;

// --------------------------------------------------------------------
function insert_proc ($dynamodb,$table_in,$key_in,$name_in,$population_in,$date_mod_in)
{
	$marshaler = new Marshaler();
	$json = json_encode([
       'key' => $key_in,
        'name' => $name_in,
        'population' => $population_in,
        'date_mod' => $date_mod_in
    ]);

    $params = [
        'TableName' => $table_in,
        'Item' => $marshaler->marshalJson($json)
    ];

    try {
        $result = $dynamodb->putItem($params);
        echo "Added cities: " . $key_in . " " . $name_in . "\n";
    } catch (DynamoDbException $e) {
        echo "Unable to add cities:\n";
        echo $e->getMessage() . "\n";
    }
}

// --------------------------------------------------------------------
$sdk = new Aws\Sdk([
    'endpoint'   => 'http://localhost:8000',
    'region'   => 'us-west-2',
    'version'  => 'latest'
]);

$dynamodb = $sdk->createDynamoDb();

$table = 'cities';


$key = 't0921'; 
$name = "宇都宮";
$population = 34985;
$date_mod = "2011-3-5";

insert_proc ($dynamodb,$table,$key,$name,$population,$date_mod);
insert_proc ($dynamodb,$table,"t0922","小山",89341,"2011-9-10");
insert_proc ($dynamodb,$table,"t0923","佐野",35217,"2011-6-24");
insert_proc ($dynamodb,$table,"t0924","足利",74892,"2011-2-20");
insert_proc ($dynamodb,$table,"t0925","日光",69154,"2011-5-12");

?>
// --------------------------------------------------------------------
