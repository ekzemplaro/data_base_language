<?php
/*
	pg_manipulate.php

					Feb/09/2015

*/
// --------------------------------------------------------------------
function pg_connect_proc ($server,$dbname,$user,$password)
{
	$str_connect = "host=". $server . " dbname=" . $dbname
		 . " user=" . $user . " password=" . $password;

	$dbconn = pg_connect ($str_connect)
		    or die('Could not connect: ' . pg_last_error());

	return	$dbconn;
}

// --------------------------------------------------------------------
function pg_query_proc ($query)
{
	$result = pg_query($query) or die('Query failed: ' . pg_last_error());

	return	$result;
}

// --------------------------------------------------------------------
function pg_to_dict_proc ($server,$dbname,$user,$password)
{
	$dict_aa = array ();

	$dbconn = pg_connect_proc ($server,$dbname,$user,$password);

	$query = 'SELECT * FROM cities';

	$result = pg_query_proc ($query);

	while ($line = pg_fetch_array($result, null, PGSQL_ASSOC))
		{
		$key = $line['id'];
		$name = $line['name'];
		$population = $line['population'];
		$date_mod = $line['date_mod'];
	$dict_aa = dict_append_proc ($dict_aa,$key,$name,$population,$date_mod);
		}

	pg_free_result($result);

	pg_close ($dbconn);

	return	$dict_aa;
}

// --------------------------------------------------------------------
function dict_to_pg_proc ($dict_aa,$server,$dbname,$user,$password)
{
	$dbconn = pg_connect_proc ($server,$dbname,$user,$password);

	$query = "drop table cities;";
	pg_query_proc ($query);

	$query = "create TABLE cities (id varchar(10) NOT NULL PRIMARY KEY,name text,"
		. "population int,date_mod text)";
	pg_query_proc ($query);

	foreach ($dict_aa as $key => $value)
		{
		$name = $value['name'];
		$population = $value['population'];
		$date_mod = $value['date_mod'];

		$query = "insert into cities (id, Name, Population, date_mod) "
			. "values ('" . $key . "','" . $name . "',"
			. $population .  ",'" . $date_mod . "')";
		pg_query_proc ($query);
		}

	pg_close ($dbconn);
}

// --------------------------------------------------------------------
function pg_update_exec_proc ($key_in,$population_in)
{
	date_default_timezone_set('Asia/Tokyo');
	$today = date ("Y-m-d");

	$query = "update cities set POPULATION=" . $population_in;
	$query .= ", DATE_MOD='" . $today . "'";
	$query .= " where ID='" . $key_in . "'";

//	print $query . "\n";

	$result = pg_query_proc ($query);
}

// --------------------------------------------------------------------
function pg_update_proc ($server,$dbname,$user,$password,$key_in,$population_in)
{
	$dbconn = pg_connect_proc ($server,$dbname,$user,$password);

	pg_update_exec_proc ($key_in,$population_in);

	pg_close ($dbconn);
}

// --------------------------------------------------------------------
function pg_delete_exec_proc ($key_in)
{
	$query = "delete from cities where ID='" . $key_in . "'";

//	print $query . "\n";

	$result = pg_query_proc ($query);

}

// --------------------------------------------------------------------
function pg_delete_proc ($server,$dbname,$user,$password,$key_in)
{
	$dbconn = pg_connect_proc ($server,$dbname,$user,$password);

	pg_delete_exec_proc ($key_in);

	pg_close ($dbconn);
}

// --------------------------------------------------------------------
