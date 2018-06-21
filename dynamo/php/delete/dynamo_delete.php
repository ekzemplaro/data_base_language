#! /usr/bin/php
<?php
// --------------------------------------------------------------------
/*

	dynamo_delete.php

					Jun/21/2018
*/
// --------------------------------------------------------------------
use Aws\DynamoDb\Exception\DynamoDbException;
use Aws\DynamoDb\Marshaler;

require 'vendor/autoload.php';

date_default_timezone_set('UTC');


$sdk = new Aws\Sdk([
    'endpoint'   => 'http://localhost:8000',
    'region'   => 'ap-northeast-1',
    'version'  => 'latest'
]);

$dynamodb = $sdk->createDynamoDb();
$marshaler = new Marshaler();

/*
$key = $marshaler->marshalJson('
    {
        "key": {"S": "t0922"}
    }
');
*/

$key = '{"key": {"S": "t0922"}}';
echo $key;

$eav = $marshaler->marshalJson('
    {
        ":val": 5 
    }
');

$params = [
    'TableName' => 'cities',
    'Key' => $key, 
    'ConditionExpression' => 'info.rating <= :val',
    'ExpressionAttributeValues'=> $eav
];

try {
    $result = $dynamodb->deleteItem($params);
    echo "Deleted table.\n";

} catch (DynamoDbException $e) {
    echo "Unable to delete item:\n";
    echo $e->getMessage() . "\n";
}

// --------------------------------------------------------------------
?>
