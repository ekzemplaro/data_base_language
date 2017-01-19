<?php
// ---------------------------------------------------------------------
//	sql_to_json.php
//
//					Apr/25/2011
//
// ---------------------------------------------------------------------
function sql_to_json_upper_proc ($dbcon)
{
	$id = "ID";
	$name = "NAME";
	$population = "POPULATION"; 
	$date_mod = "DATE_MOD";

	$encode = sql_to_json_exec_proc
		($dbcon,$id,$name,$population,$date_mod);

	return	$encode;
}

// ---------------------------------------------------------------------
function sql_to_json_lower_proc ($dbcon)
{
	$id = "id";
	$name = "name";
	$population = "population"; 
	$date_mod = "date_mod";

	$encode = sql_to_json_exec_proc
		($dbcon,$id,$name,$population,$date_mod);

	return	$encode;
}

// ---------------------------------------------------------------------
function sql_to_json_exec_proc ($dbcon,$id,$name,$population,$date_mod)
{
$sql = "select * from cities order by id";

$dict_aa = array ();

foreach ($dbcon->query($sql) as $row)
	{
	$dict_aa = dict_append_proc ($dict_aa,$row[$id],
			$row[$name],$row[$population],$row[$date_mod]);
	}

$encode = json_encode ($dict_aa);

return	$encode;
}

// ---------------------------------------------------------------------
?>	
