<?php
// ------------------------------------------------------------------
//	dba_manipulate.php
//
//					Mar/07/2014
//
// ------------------------------------------------------------------
function value_to_json_proc ($name,$population_in,$date_mod_in)
{
$arry_unit = array (
		"name"  => $name,
		"population" => $population_in,
		"date_mod" => $date_mod_in);
$encode = json_encode ($arry_unit);
print $encode . "\n";
#
	return	$encode;
}
// ------------------------------------------------------------------
function berkeley_to_dict_proc ($file_name)
{
	$dict_aa = array ();

	$dbh = dba_open($file_name,"r","db4");
#
#
for($key = dba_firstkey($dbh); $key != false; $key = dba_nextkey($dbh))
	{
	$json_string = dba_fetch($key, $dbh);
	$city = json_decode ($json_string);

	$dict_unit = array ();
	$dict_unit['name'] = $city->name;
	$dict_unit['population'] = $city->population;
	$dict_unit['date_mod'] = $city->date_mod;
	$dict_aa[$key]= $dict_unit;
	}

dba_close ($dbh);

	return	$dict_aa;
}

// ------------------------------------------------------------------
function dict_to_berkeley_proc ($dict_aa,$db_file)
{
	$dbh=dba_open($db_file,"n","db4");

	foreach ($dict_aa as $key => $value)
		{
		$encode = json_encode ($value);
		dba_insert($key,$encode,$dbh);
		}

	dba_close ($dbh);
}

// ------------------------------------------------------------------
?> 
