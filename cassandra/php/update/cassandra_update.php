#! /usr/bin/php
<?php
// --------------------------------------------------------------------
/*
	cassandra_update.php

					Oct/11/2011

*/
require_once('/var/www/data_base/common/php_common/lib/cassandra/Cassandra.php');

// --------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include "cassandra_manipulate.php";
// --------------------------------------------------------------------
print	"*** 開始 ***\n";

$key = $argv[1];
$population_in = $argv[2];

print $key . "\t" . $population_in . "\n";

$servers = array(
	array(
		'host' => '127.0.0.1',
		'port' => 9160,
		'use-framed-transport' => true,
		'send-timeout-ms' => 1000,
		'receive-timeout-ms' => 1000
	)
);

$cassandra = Cassandra::createInstance($servers);

$keyspace = 'Cities';
$cfamily = 'Akita';


cassandra_update_proc ($cassandra,$keyspace,$cfamily,$key,$population_in);

print	"*** 終了 ***\n";
// --------------------------------------------------------------------
?>

