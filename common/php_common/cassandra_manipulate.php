<?php
// --------------------------------------------------------------------
/*

	cassandra_manipulate.php

					Oct/11/2011


*/
// --------------------------------------------------------------------
function cassandra_to_dict_proc ($cassandra,$cfamily)
{
	$keys = array ('t0531','t0532','t0533',
		't0534','t0535','t0536',
		't0537','t0538','t0539');

	$dict_aa = array ();

	foreach ($keys as $key)
		{
		$data = $cassandra->get($cfamily . "."  . $key);

		if ($data != null)
			{
			$dict_unit = array ();
			$dict_unit['name'] = $data['name'];
			$dict_unit['population'] = $data['population'];
			$dict_unit['date_mod'] = $data['date_mod'];
			$dict_aa[$key]= $dict_unit;
			}
		}

	return	$dict_aa;
}

// --------------------------------------------------------------------
function cassandra_update_proc ($cassandra,$keyspace,$cfamily,$key,$population_in)
{
	$cassandra->useKeyspace($keyspace);

	$data = $cassandra->get($cfamily . "."  . $key);

	$today = date ("Y-m-d");

	$cassandra->set(
		$cfamily . "." . $key,
		array	(
			'name' => $data['name'],
			'population' => $population_in,
			'date_mod' => $today
			)
	);


}
// --------------------------------------------------------------------
function dict_to_cassandra_proc ($cassandra,$cfamily,$dict_aa)
{
	foreach ($dict_aa as $key => $value)
	{
	$cassandra->set(
       		$cfamily . "."  . $key,
		array(
			'name' => $value['name'],
			'population' => $value['population'],
			'date_mod' => $value['date_mod']
        		)
		);
	}
}

// --------------------------------------------------------------------
?>

