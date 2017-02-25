<?php
// --------------------------------------------------------------------
/*

	cities_search.php

					Feb/22/2017
*/
// --------------------------------------------------------------------
require '/home/ec2-user/vendor/autoload.php';

use Aws\Common\Aws;
use Aws\DynamoDb\DynamoDbClient;
use Aws\DynamoDb\Exception\DynamoDbException;

// --------------------------------------------------------------------
function search_proc ($client,$key_in)
{
	$result = $client->getItem(array(
		'ConsistentRead' => true,
		'TableName' => 'cities',
		'Key' => array(
			'key' => array('S' => $key_in)
			),
		));

	return	$result;
}

// --------------------------------------------------------------------
echo "*** start ***\n";

$aws = Aws::factory("aws_config.php");
$client = $aws->get('dynamodb');

$key_in = "t0921";

$result = search_proc ($client,$key_in);

echo  $result['Item']['key']["S"] . "\t";
echo  $result['Item']['name']["S"] . "\t";
echo  $result['Item']['population']["N"] . "\t";
echo  $result['Item']['date_mod']["S"] . "\n";
echo "*** end ***\n";
// --------------------------------------------------------------------
