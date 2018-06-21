#! /usr/bin/php
<?php
// --------------------------------------------------------------------
/*

	dynamo_read.php

					Jun/21/2018
*/
// --------------------------------------------------------------------
require 'vendor/autoload.php';

date_default_timezone_set('Asia/Tokyo');

use Aws\DynamoDb\Exception\DynamoDbException;
use Aws\DynamoDb\Marshaler;

fputs (STDERR,"*** 開始 ***\n");

$sdk = new Aws\Sdk([
    'endpoint'   => 'http://localhost:8000',
    'region'   => 'ap-northeast-1',
    'version'  => 'latest'
]);

$dynamodb = $sdk->createDynamoDb();


$params = [
	'TableName' => 'cities'
];

try {
    while (true) {
        $result = $dynamodb->scan($params);

// var_dump($result['Items']);

//	echo count ($result['Items']) . "\n";

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
