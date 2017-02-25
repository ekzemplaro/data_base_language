#! /usr/bin/php
<?php
// --------------------------------------------------------------------
/*

	cities_count_local.php

					Feb/24/2017
*/
// --------------------------------------------------------------------
require 'vendor/autoload.php';

date_default_timezone_set('UTC');

use Aws\DynamoDb\Exception\DynamoDbException;

fputs (STDERR,"*** 開始 ***\n");

$sdk = new Aws\Sdk([
    'endpoint'   => 'http://localhost:8000',
    'region'   => 'us-west-2',
    'version'  => 'latest'
]);

$dynamodb = $sdk->createDynamoDb();


$params = [
	'TableName' => 'cities'
];

try {
        $result = $dynamodb->scan($params);

	echo count ($result['Items']) . "\n";


} catch (DynamoDbException $e) {
	echo "Unable to scan:\n";
	echo $e->getMessage() . "\n";
}

fputs (STDERR,"*** 終了 ***\n");
// --------------------------------------------------------------------
?>
