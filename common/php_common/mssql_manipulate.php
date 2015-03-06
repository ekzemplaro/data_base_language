<?php
/*
	mssql_manipulate.php

					Feb/19/2015

*/
// --------------------------------------------------------------------
function mssql_update_proc ($key_in,$population_in)
{
	date_default_timezone_set('Asia/Tokyo');
	$today = date ("Y-m-d");
	$sql = "update cities set POPULATION=" . $population_in;
	$sql .= ", DATE_MOD='" . $today . "'";
	$sql .= " where ID='" . $key_in . "'";
 
	if (mssql_query ($sql))
		{
		echo $sql . "\n";
		print "Success\n";
		}
	else
		{
		print "Fail\n";
		}
}

// --------------------------------------------------------------------
function mssql_delete_proc ($key_in)
{
	$sql = "delete from cities where ID='" . $key_in . "'";
 
	if (mssql_query ($sql))
		{
		echo $sql . "\n";
		print "Success\n";
		}
	else
		{
		print "Fail\n";
		}
}

// --------------------------------------------------------------------
function mssql_drop_table_proc ()
{
	$sql="drop table cities;";

	if (mssql_query ($sql))
		{
		echo $sql . "\n";
		print "drop table *** Success\n";
		}
	else
		{
		print "drop table *** Fail\n";
		}

}

// --------------------------------------------------------------------
function mssql_create_table_proc ()
{
	$sql="create TABLE cities (id varchar(10) NOT NULL PRIMARY KEY,";
	$sql .= "name nvarchar(20)," . "population int,date_mod text)";

	if (mssql_query ($sql))
		{
		echo $sql . "\n";
		print "Create table *** Success\n";
		}
	else
		{
		print "Create table *** Fail\n";
		}
}

// --------------------------------------------------------------------
function mssql_insert_proc ($id_in,$name_in,$population_in,$date_mod_in)
{
	$name_sjis = mb_convert_encoding ($name_in,"SJIS","UTF-8");
  
	$sql="insert into cities (id, Name, Population, date_mod) "
		. "values ('" . $id_in . "'," . "'" . $name_sjis . "',"
		. $population_in .  ",'" . $date_mod_in . "')";

	$result = mssql_query ($sql);

	return	$result;
}

// --------------------------------------------------------------------
function dict_to_mssql_proc ($dict_aa)
{
	foreach ($dict_aa as $key => $value)
		{
		$name = $value['name'];
		$population = $value['population'];
		$date_mod = $value['date_mod'];
		$result = mssql_insert_proc ($key,$name,$population,$date_mod);

		print $result;
		}
}
// --------------------------------------------------------------------
