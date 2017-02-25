#! /usr/bin/php
<?php
// --------------------------------------------------------------------
/*

	batch_scan.php

					Feb/24/2517
*/
// --------------------------------------------------------------------
require_once('/home/ec2-user/vendor/autoload.php');

use Aws\Common\Aws;
use Aws\DynamoDbException\DynamoDbException;

echo "*** start ***\n";

$aws = Aws::factory('aws_config.php');

try {
	$client = $aws->get('dynamodb');

	$result = $client->scan(array(
		'TableName' => 'batch-write-test',
		));

//  var_dump($result);

	$count = $result['Count'];
	echo  $count . "\n";

	for ($it = 0; $it < $count; $it++)
		{
		echo $result['Items'][$it]['id']['S'] . "\t";
		echo $result['Items'][$it]['timestamp']['N'] . "\n";
		}

} catch (DynamoDbException $e) {
	echo 'Not Success';
}

echo "*** end ***\n";
// --------------------------------------------------------------------
