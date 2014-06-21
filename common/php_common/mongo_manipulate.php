<?php
// --------------------------------------------------------------------
/*
	mongo_manipulate.php

					Jun/26/2012

*/
// --------------------------------------------------------------------
function mongo_to_dict_proc ($col)
{
	$dict_aa = array ();

	$cursor = $col->find();

	foreach ($cursor as $obj) {
		$dict_unit = array ();
		$dict_unit['name'] = $obj["name"];
		$dict_unit['population'] = $obj["population"];
		$dict_unit['date_mod'] = $obj["date_mod"];
		$dict_aa[$obj["id"]]= $dict_unit;
		}

	return	$dict_aa;
}

// --------------------------------------------------------------------
function mongo_update_proc ($col,$id_in,$population_in)
{
$cursor = $col->find(array('id' => $id_in));

foreach ($cursor as $obj) {
	echo $obj["id"] . "\t";
	echo $obj["name"] . "\t";
	echo $obj["population"] . "\t";
	echo $obj["date_mod"] . "\n";
	$obj["population"] = $population_in;
	$obj["date_mod"] = date ("Y-m-d");

	$col->save ($obj);
	}
}

// --------------------------------------------------------------------
function mongo_delete_proc ($col,$id_in)
{
$cursor = $col->find(array('id' => $id_in));

foreach ($cursor as $obj) {
	echo $obj["id"] . "\t";
	echo $obj["name"] . "\t";
	echo $obj["population"] . "\t";
	echo $obj["date_mod"] . "\n";

	$col->remove ($obj);
	}
}

// --------------------------------------------------------------------
function dict_to_mongo_proc ($col,$dict_aa)
{
	print $col->count () . "\n";
	$col->remove ();
	print $col->count () . "\n";

	foreach ($dict_aa as $key => $value)
		{
		$name = $value['name'];
		$population = $value['population'];
		$date_mod = $value['date_mod'];

		$obj = array ();
		$obj["id"] = $key;
		$obj["name"] = $name;
		$obj["population"] = $population;
		$obj["date_mod"] = $date_mod;

		$col->save ($obj);
		}
	print $col->count () . "\n";
}

// --------------------------------------------------------------------
?>
