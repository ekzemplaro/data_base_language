<?php
// --------------------------------------------------------------------
/*

	cities_insert.php

					Feb/22/2017
*/
// --------------------------------------------------------------------
require_once('/home/ec2-user/vendor/autoload.php');

use Aws\Common\Aws;
use Aws\DynamoDbException\DynamoDbException;

// --------------------------------------------------------------------
function insert_proc ($client,$key_in,$name_in,$population_in,$date_mod_in)
{
try {
	$result = $client->putItem(array(
		'TableName' => 'cities',
		'Item' => $client->formatAttributes(array(
		'key' => $key_in,
		'name' => $name_in,
		'population' => $population_in,
		'date_mod' => $date_mod_in
		)),
		));
} catch (DynamoDbException $e) {
	echo 'Not Success';
}

}

// --------------------------------------------------------------------
echo "*** start ***\n";

// AWSクレデンシャル
$aws = Aws::factory('aws_config.php');

$client = $aws->get('dynamodb');

insert_proc ($client,"t0922","小山",29157,"1950-3-15");
insert_proc ($client,"t0923","佐野",65741,"1950-10-7");
insert_proc ($client,"t0925","日光",49675,"1950-8-28");

echo "*** end ***\n";
// --------------------------------------------------------------------
