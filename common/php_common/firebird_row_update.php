<?php
// ------------------------------------------------------------------
//	data_base/common/php_common/firebird_row_update.php
//
//					May/30/2011
//
//
// ------------------------------------------------------------------
function firebird_row_update_proc ($dbh,$id,$population)
{
// $today = date ("Y/m/d H:i:s");
$today = date ("Y/m/d");



$sql = "UPDATE CITIES SET POPULATION =" . $population;

$sql  .= ", DATE_MOD='" . $today . "'";
$sql .= " where ID= '" . $id . "'";

$query = ibase_prepare($dbh, $sql);

    ibase_execute($query);
}

// ------------------------------------------------------------------
function firebird_row_delete_proc ($dbh,$id)
{
	$sql = "delete from CITIES where ID= '" . $id . "'";

	$query = ibase_prepare($dbh, $sql);

	ibase_execute($query);
}

// ------------------------------------------------------------------
function firebird_insert_proc ($dbh,$id_in,$name_in,$population_in,$date_mod_in)
{
	$sql="insert into cities (id, Name, Population, date_mod) "
		. "values ( '" . $id_in . "','" . $name_in . "',"
		. $population_in .  ",CAST ('" . $date_mod_in . "' as date))";

// $sql = "insert into cities (id,name,population,date_mod) values";
// $sql .= " (3821,'松山',62500,CAST ('2001-5-15' as date))";
print $sql . "\n";

	$query = ibase_prepare($dbh, $sql);
    	ibase_execute($query);
}

// --------------------------------------------------------------------
function firebird_drop_table_proc ($dbh)
{
	$sql="drop table cities;";
	$query = ibase_prepare($dbh, $sql);
    	ibase_execute($query);
}

// --------------------------------------------------------------------
function firebird_create_table_proc ($dbh)
{
	$sql="create TABLE cities (id varchar(10),name varchar(20),"
		. "population int,date_mod date)";

	$query = ibase_prepare($dbh, $sql);
    	ibase_execute($query);

	$sql = "commit";
	$query = ibase_prepare($dbh, $sql);
	ibase_execute($query);
}

// ------------------------------------------------------------------
?>
