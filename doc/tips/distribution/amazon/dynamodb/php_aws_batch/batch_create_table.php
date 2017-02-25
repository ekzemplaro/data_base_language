#! /usr/bin/php
<?php
// --------------------------------------------------------------------
/*

	batch_create_table.php

					Feb/25/2017
*/
// --------------------------------------------------------------------
require_once('/home/ec2-user/vendor/autoload.php');

use Aws\Common\Aws;
use Aws\DynamoDbException\DynamoDbException;

echo "*** start ***\n";

$aws = Aws::factory('aws_config.php');

$tableName = 'batch-write-test';

try {
	$client = $aws->get('dynamodb');

$client->createTable(array(
    'TableName' => $tableName,
    'AttributeDefinitions' => array(
        array(
            'AttributeName' => 'id',
            'AttributeType' => 'S'
        ),
	array(
            'AttributeName' => 'timestamp',
            'AttributeType' => 'N'
        )
    ),
    'KeySchema' => array(
        array(
            'AttributeName' => 'id',
            'KeyType'       => 'HASH'
        ),
	array(
            'AttributeName' => 'timestamp',
            'KeyType'       => 'RANGE'
        )
    ),
    'ProvisionedThroughput' => array(
        'ReadCapacityUnits'  => 10,
        'WriteCapacityUnits' => 20
    )
));

$client->waitUntil('TableExists', array(
    'TableName' => $tableName
));

echo "Table is created\n";

} catch (DynamoDbException $e) {
	echo "Not Success\n";
}

echo "*** end ***\n";
// --------------------------------------------------------------------
