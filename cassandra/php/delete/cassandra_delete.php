#! /usr/bin/php
<?php
// --------------------------------------------------------------------
/*

	cassandra_delete.php

					Aug/01/2011


*/
require_once('/var/www/data_base/common/php_common/lib/cassandra/Cassandra.php');

// --------------------------------------------------------------------
/**
* Remove a row or element of a row.
*
* Supported patterns:
* - family.key
* - family.key:col1 *
* - family.super.key:col1
*
* In all of the parts, the following characters shoudl be escaped (. etc)
* '.', ':', ',', '-', '|'
*
* @param string $request The request string, see patterns above
* @param integer $consistency Consistency level to use
* @param integer $timestamp Optional timestamp to use.
* @throws Exception If something goes wrong
*/
class cassandra_delete
{
public function remove(
$request,
$consistency = null,
$timestamp = null
) {
$details = $this->parseRequest($request);

    $columnPath = new cassandra_ColumnPath(array(
            'column_family' => $details['column-family'],
            'column' => $details['columns'],
            'super_column' => $details['super-column']
        ));

    if ($timestamp === null) {
        $timestamp = CassandraUtil::getTimestamp();
    }

    if ($consistency === null) {
        $consistency = Cassandra::CONSISTENCY_ONE;
    }

    $this->call('remove', $details['key'], $columnPath, $timestamp, $consistency);
}

}
// --------------------------------------------------------------------
print	"*** 開始 ***\n";

$key = $argv[1];

print $key . "\n";

$servers = array(
	array(
		'host' => '127.0.0.1',
		'port' => 9160,
		'use-framed-transport' => true,
		'send-timeout-ms' => 1000,
		'receive-timeout-ms' => 1000
	)
);

$client = Cassandra::createInstance($servers);

$keysapce = 'Cities';
$cfamily = 'Akita';

$client->useKeyspace($keysapce);


$data = $client->get($cfamily . "."  . $key);

$out_str = $key . "\t";
$out_str .= $data['name'] . "\t";
$out_str .=  $data['population'] . "\t";
$out_str .=  $data['date_mod'] . "\n";
print	$out_str;

//$client->truncate($key);
// $client->truncate($cfamily);
//$client->truncate($cfamily . "." . $key);

//$timestamp = CassandraUtil::getTimestamp();
//$consistency = Cassandra::CONSISTENCY_ONE;
//
//$client->remove ($key,$columnPath, $timestamp, $consistency);
cassandra_delete->remove($cfamily . "."  . $key);
print	"*** 終了 ***\n";
// --------------------------------------------------------------------
?>

