#! /usr/bin/php
<?php
// --------------------------------------------------------------------
/*

	cities_create_table.php

					Feb/25/2017
*/
// --------------------------------------------------------------------
require_once('/home/ec2-user/vendor/autoload.php');

use Aws\Common\Aws;
use Aws\DynamoDbException\DynamoDbException;

echo "*** start ***\n";

$aws = Aws::factory('aws_config.php');

try {
	$client = $aws->get('dynamodb');

$client->createTable(array(
    'TableName' => 'cities',
    'AttributeDefinitions' => array(
        array(
            'AttributeName' => 'key',
            'AttributeType' => 'N'
        ),
    ),
    'KeySchema' => array(
        array(
            'AttributeName' => 'key',
            'KeyType'       => 'HASH'
        ),
    ),
    'ProvisionedThroughput' => array(
        'ReadCapacityUnits'  => 10,
        'WriteCapacityUnits' => 20
    )
));

$client->waitUntil('TableExists', array(
    'TableName' => 'cities'
));

echo "Table is created\n";

} catch (DynamoDbException $e) {
	echo "Not Success\n";
}

echo "*** end ***\n";
// --------------------------------------------------------------------
