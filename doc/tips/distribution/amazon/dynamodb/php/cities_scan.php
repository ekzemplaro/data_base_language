<?php
// --------------------------------------------------------------------
/*

	cities_scan.php

					Feb/22/2017
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
		'TableName' => 'cities',
		));

//  var_dump($result);

	$count = $result['Count'];
	echo  $count . "\n";

	for ($it = 0; $it < $count; $it++)
		{
		echo $result['Items'][$it]['key']['S'] . "\t";
		echo $result['Items'][$it]['name']['S'] . "\t";
		echo $result['Items'][$it]['population']['N'] . "\t";
		echo $result['Items'][$it]['date_mod']['S'] . "\n";
		}

} catch (DynamoDbException $e) {
	echo 'Not Success';
}

echo "*** end ***\n";
// --------------------------------------------------------------------
