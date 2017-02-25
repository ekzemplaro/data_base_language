#! /usr/bin/php
<?php
// --------------------------------------------------------------------
/*

	batch_write.php

					Feb/25/2017
*/
// --------------------------------------------------------------------
require_once('/home/ec2-user/vendor/autoload.php');

use Aws\Common\Aws;
use Aws\DynamoDbException\DynamoDbException;
use Aws\DynamoDb\Model\BatchRequest\WriteRequestBatch;
use Aws\DynamoDb\Model\BatchRequest\PutRequest;

echo "*** start ***\n";

$aws = Aws::factory('aws_config.php');
$client = $aws->get('dynamodb');

$tableName = 'batch-write-test';

$itemIds = array();
// Put 55 items into the table
$putBatch = WriteRequestBatch::factory($client);
for ($i = 0; $i < 55; $i++) {
    $itemIds[] = $itemId = uniqid();
    $putBatch->add(new PutRequest(array(
        'id'        => array('S' => $itemId),
        'timestamp' => array('N' => (string) time()),
    ), $tableName));
}
$putBatch->flush();

echo "*** end ***\n";
// --------------------------------------------------------------------
