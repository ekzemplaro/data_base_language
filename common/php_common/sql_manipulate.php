<?php
/*
	php_common/sql_manipulate.php

					Oct/25/2017

*/
// --------------------------------------------------------------------
function sql_update_proc ($dbcon,$id,$population)
{
date_default_timezone_set('Asia/Tokyo');
$today = date ("Y-m-d");
$sql = "update cities set POPULATION=" . $population;
$sql .= ", DATE_MOD='" . $today . "'";
$sql .= " where ID='" . $id . "'";

$dbcon->beginTransaction();
$sth = $dbcon->exec($sql);
$dbcon->commit();

/*
$stmt=$dbcon->prepare ($sql);
$stmt->execute ();
*/
}

// --------------------------------------------------------------------
function sql_delete_proc ($dbcon,$id)
{
$sql = "delete from cities where ID='" . $id . "'";

$dbcon->beginTransaction();
$sth = $dbcon->exec($sql);
$dbcon->commit();

/*
$stmt=$dbcon->prepare ($sql);
$stmt->execute ();
*/
}

// --------------------------------------------------------------------
function insert_proc ($dbcon,$id_in,$name_in,$population_in,$date_mod_in)
{
	$sql="insert into cities (id, Name, Population, date_mod) "
		. "values ('" . $id_in . "','" . $name_in . "',"
		. $population_in .  ",'" . $date_mod_in . "')";

$dbcon->beginTransaction();
$sth = $dbcon->exec($sql);
$dbcon->commit();
/*
	$stmt=$dbcon->prepare ($sql);
	$stmt->execute ();
*/
}

// --------------------------------------------------------------------
function drop_table_proc ($dbcon)
{
	$sql="drop table cities;";

$dbcon->beginTransaction();
$sth = $dbcon->exec($sql);
$dbcon->commit();

/*
	$stmt=$dbcon->prepare ($sql);
	$stmt->execute ();
*/
}

// --------------------------------------------------------------------
function create_table_proc ($dbcon)
{
	$sql="create TABLE cities (id varchar(10) NOT NULL PRIMARY KEY,name text,"
		. "population int,date_mod text)";

$dbcon->beginTransaction();
$sth = $dbcon->exec($sql);
$dbcon->commit();

/*
	$stmt=$dbcon->prepare ($sql);
	$stmt->execute ();
*/
}

// --------------------------------------------------------------------
function dict_to_db_proc ($dict_aa,$dbcon)
{
	foreach ($dict_aa as $key => $value)
		{
		$name = $value['name'];
		$population = $value['population'];
		$date_mod = $value['date_mod'];
		insert_proc ($dbcon,$key,$name,$population,$date_mod);
		}
}

// --------------------------------------------------------------------
?>
