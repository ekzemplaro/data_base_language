#! /usr/bin/php
<?php
// --------------------------------------------------------------------
/*

	batch_delete_table.php

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

	$client->deleteTable(array(
    'TableName' => $tableName
));

$client->waitUntil('TableNotExists', array(
    'TableName' => $tableName
));

    echo "Deleted table.\n";

} catch (DynamoDbException $e) {
	echo 'Not Success';
}

echo "*** end ***\n";
// --------------------------------------------------------------------
