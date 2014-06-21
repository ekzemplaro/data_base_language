#! /usr/bin/php
<?php
// --------------------------------------------------------------------
/*

	cassandra_create.php

					Jun/19/2013

*/
// --------------------------------------------------------------------
require_once('/var/www/data_base/common/php_common/lib/cassandra/Cassandra.php');

$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);
//
include "text_manipulate.php";
include "cassandra_manipulate.php";
// --------------------------------------------------------------------
function data_prepare_proc ()
{
$dict_aa = array ();

$dict_aa = dict_append_proc ($dict_aa,'t0531','秋田',59482,'2002-9-8');
$dict_aa = dict_append_proc ($dict_aa,'t0532','男鹿',61473,'2002-3-12');
$dict_aa = dict_append_proc ($dict_aa,'t0533','由利本荘',57682,'2002-2-1');
$dict_aa = dict_append_proc ($dict_aa,'t0534','横手',46329,'2002-10-29');
$dict_aa = dict_append_proc ($dict_aa,'t0535','鹿角',35738,'2002-7-14');
$dict_aa = dict_append_proc ($dict_aa,'t0536','大館',24685,'2002-6-12');
$dict_aa = dict_append_proc ($dict_aa,'t0537','能代',83197,'2002-4-17');
$dict_aa = dict_append_proc ($dict_aa,'t0538','にかほ',92518,'2002-3-24');
$dict_aa = dict_append_proc ($dict_aa,'t0539','湯沢',79461,'2002-7-8');

	return	$dict_aa;
}

// --------------------------------------------------------------------
print	"*** 開始 ***\n";


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


print	"*** 終了 ***\n";
// --------------------------------------------------------------------
?>

