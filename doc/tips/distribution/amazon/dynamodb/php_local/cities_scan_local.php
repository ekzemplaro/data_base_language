#! /usr/bin/php
<?php
// --------------------------------------------------------------------
/*

	cities_scan_local.php

					Feb/24/2017
*/
// --------------------------------------------------------------------
require 'vendor/autoload.php';

date_default_timezone_set('UTC');

use Aws\DynamoDb\Exception\DynamoDbException;
use Aws\DynamoDb\Marshaler;

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
    while (true) {
        $result = $dynamodb->scan($params);

	echo count ($result['Items']) . "\n";

        foreach ($result['Items'] as $it) {
                echo ($it['key']['S']) . "\t";
                echo ($it['name']['S']) . "\t";
                echo ($it['population']['N']) . "\t";
                echo ($it['date_mod']['S']) . "\n";
        }

        if (isset($result['LastEvaluatedKey'])) {
            $params['ExclusiveStartKey'] = $result['LastEvaluatedKey'];
        } else {
            break;
        }
    }

} catch (DynamoDbException $e) {
    echo "Unable to scan:\n";
    echo $e->getMessage() . "\n";
}

fputs (STDERR,"*** 終了 ***\n");
// --------------------------------------------------------------------
?>
