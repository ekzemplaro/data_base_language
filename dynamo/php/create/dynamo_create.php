#! /usr/bin/php
<?php
// --------------------------------------------------------------------
/*
	dynamo_create.php

					Jun/21/2018

*/
// --------------------------------------------------------------------
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
function table_insert_proc($dynamodb)
{
	$table = 'cities';

	insert_proc ($dynamodb,$table,"t0921","宇都宮",92156,"2011-3-8");
	insert_proc ($dynamodb,$table,"t0922","小山",89341,"2011-9-10");
	insert_proc ($dynamodb,$table,"t0923","佐野",35217,"2011-6-24");
	insert_proc ($dynamodb,$table,"t0924","足利",74892,"2011-2-20");
	insert_proc ($dynamodb,$table,"t0925","日光",69154,"2011-5-12");
}

// --------------------------------------------------------------------
function table_delete_proc($dynamodb)
{
$params = [
    'TableName' => 'cities'
];

try {
    $result = $dynamodb->deleteTable($params);
    echo "Deleted table.\n";

	} catch (DynamoDbException $e) {
    echo "Unable to delete table:\n";
    echo $e->getMessage() . "\n";
	}
}

// --------------------------------------------------------------------
function table_create_proc($dynamodb)
{

$params = [
    'TableName' => 'cities',
    'KeySchema' => [
        [
            'AttributeName' => 'key',
            'KeyType' => 'HASH'  //Partition key
        ],
        [
            'AttributeName' => 'name',
            'KeyType' => 'RANGE'  //Sort key
        ]
    ],
    'AttributeDefinitions' => [
        [
            'AttributeName' => 'key',
            'AttributeType' => 'S'
        ],
        [
            'AttributeName' => 'name',
            'AttributeType' => 'S'
        ],

    ],
    'ProvisionedThroughput' => [
        'ReadCapacityUnits' => 10,
        'WriteCapacityUnits' => 10
    ]
];

try {
    $result = $dynamodb->createTable($params);
    echo 'Created table.  Status: ' . 
        $result['TableDescription']['TableStatus'] ."\n";

} catch (DynamoDbException $e) {
    echo "Unable to create table:\n";
    echo $e->getMessage() . "\n";
}

}

// --------------------------------------------------------------------
require 'vendor/autoload.php';

fputs (STDERR,"*** 開始 ***\n");

date_default_timezone_set('Asia/Tokyo');

$sdk = new Aws\Sdk([
    'endpoint'   => 'http://localhost:8000',
    'region'   => 'ap-northeast-1',
    'version'  => 'latest'
]);

$dynamodb = $sdk->createDynamoDb();


table_delete_proc($dynamodb);
table_create_proc($dynamodb);
table_insert_proc($dynamodb);


fputs (STDERR,"*** 終了 ***\n");
// --------------------------------------------------------------------
?>
