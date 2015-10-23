<?php
// ---------------------------------------------------------------------
//	cassandra_php_read.php
//
//					Oct/06/2011
//
// ---------------------------------------------------------------------
require_once('/var/www/data_base/common/php_common/lib/cassandra/Cassandra.php');

$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include ("text_manipulate.php");
include ("cassandra_manipulate.php");
//
// ---------------------------------------------------------------------
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

$keysapce = 'Cities';
$cfamily = 'Akita';

$cassandra->useKeyspace($keysapce);

$dict_aa = cassandra_to_dict_proc ($cassandra,$cfamily);

$json_str = json_encode ($dict_aa);
// $json_str = text_to_json_proc ($file_in);


echo $json_str;
// ---------------------------------------------------------------------
?>	
