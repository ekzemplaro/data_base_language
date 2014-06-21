<?php
// ------------------------------------------------------------------
//	cassandra_php_update.php
//
//				Oct/11/2011
// ------------------------------------------------------------------
require_once('/var/www/data_base/common/php_common/lib/cassandra/Cassandra.php');

$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include	"cgi_manipulate.php";
include	"text_manipulate.php";
include	"cassandra_manipulate.php";

// ------------------------------------------------------------------

$arry_param = cgi_manipulate ();

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

foreach ($arry_param as $val_aa)
	{
	$key = $val_aa['id'];
	$population = $val_aa['population'];

	cassandra_update_proc ($cassandra,$keyspace,$cfamily,$key,$population);

	}

$out_str .= "OK ";

echo $out_str;

// ------------------------------------------------------------------
?>
