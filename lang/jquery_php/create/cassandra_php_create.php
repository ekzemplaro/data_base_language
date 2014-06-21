<?php
// ---------------------------------------------------------------------
//	cassandra_php_create.php
//
//					Oct/11/2011
//
// ---------------------------------------------------------------------
require_once('/var/www/data_base/common/php_common/lib/cassandra/Cassandra.php');

$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

include ("text_manipulate.php");
include ("cassandra_manipulate.php");
//
// --------------------------------------------------------------------
function data_prepare_proc ()
{
$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,"t0531",'秋田',46500,'2002-9-12');
$dict_aa = dict_append_proc ($dict_aa,"t0532",'男鹿',63400,'2002-8-18');
$dict_aa = dict_append_proc ($dict_aa,"t0533",'由利本荘',57200,'2002-9-1');
$dict_aa = dict_append_proc ($dict_aa,"t0534",'横手',45300,'2002-10-29');
$dict_aa = dict_append_proc ($dict_aa,"t0535",'鹿角',39700,'2002-7-14');
$dict_aa = dict_append_proc ($dict_aa,"t0536",'大館',24300,'2002-6-12');
$dict_aa = dict_append_proc ($dict_aa,"t0537",'能代',56200,'2002-4-17');
$dict_aa = dict_append_proc ($dict_aa,"t0538",'にかほ',12700,'2002-3-8');
$dict_aa = dict_append_proc ($dict_aa,"t0539",'湯沢',31700,'2002-5-14');
	return	$dict_aa;
}
// ------------------------------------------------------------------

$dict_aa = data_prepare_proc ();

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

$cassandra->truncate($cfamily);


dict_to_cassandra_proc ($cassandra,$cfamily,$dict_aa);



echo "*** OK ***";
// ---------------------------------------------------------------------
?>	
