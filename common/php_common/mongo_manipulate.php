<?php
// --------------------------------------------------------------------
/*
	mongo_manipulate.php

					Aug/01/2018

*/
// --------------------------------------------------------------------
function mongo_to_dict_proc ($user,$password)
{
	$dict_aa = array ();

	$str_connect = "mongodb://" . $user . ":" . $password . "@localhost:27017";
	$manager = new MongoDB\Driver\Manager($str_connect);

	$filter = [];
	$options = [
		'projection' => ['_id' => 0],
		'sort' => ['_id' => -1],
	];

	$query = new MongoDB\Driver\Query($filter, $options);
	$cursor = $manager->executeQuery('city.saitama', $query);

	$dict_aa = array ();

	foreach ($cursor as $document) {
		$dict_aa = dict_append_proc ($dict_aa,$document->key,$document->name,$document->population,$document->date_mod);
	}

	return	$dict_aa;
}

// --------------------------------------------------------------------
function mongo_update_proc ($id_in,$population_in,$user,$password)
{
	$str_connect = "mongodb://" . $user . ":" . $password . "@localhost:27017";
	$manager = new MongoDB\Driver\Manager($str_connect);

	$bulk = new MongoDB\Driver\BulkWrite;

	date_default_timezone_set('Asia/Tokyo');
	$today = date ("Y-m-d");

	$newdata = array('$set' => array("population" => $population_in,"date_mod" => $today));

	$bulk->update(array("key" => $id_in), $newdata);

	$manager->executeBulkWrite('city.saitama', $bulk);
}

// --------------------------------------------------------------------
function mongo_delete_proc ($id_in,$user,$password)
{
	$str_connect = "mongodb://" . $user . ":" . $password . "@localhost:27017";
	$manager = new MongoDB\Driver\Manager($str_connect);

	$bulk = new MongoDB\Driver\BulkWrite;

	$bulk->delete(['key' => $id_in]);

	$result = $manager->executeBulkWrite('city.saitama', $bulk);
}

// --------------------------------------------------------------------
function dict_to_mongo_proc ($dict_aa,$user,$password)
{
	$str_connect = "mongodb://" . $user . ":" . $password . "@localhost:27017";

	$manager = new MongoDB\Driver\Manager($str_connect);

	$manager->executeCommand('city', new \MongoDB\Driver\Command(["drop" => "saitama"]));


	$bulk = new MongoDB\Driver\BulkWrite;
	foreach ($dict_aa as $key => $value)
		{
	$bulk->insert(['key' => $key, 'name' => $value["name"], 'population' => $value['population'], 'date_mod' => $value['date_mod']]);
		}

	$manager->executeBulkWrite('city.saitama', $bulk);
}

// --------------------------------------------------------------------
?>
