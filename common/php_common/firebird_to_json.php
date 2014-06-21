<?php
/*
	php_common/firebird_to_json.php

					Apr/25/2011
*/
// ----------------------------------------------------------------------
function firebird_to_json_proc ($dbh)
{
$dict_aa = array ();

$stmt = 'SELECT * FROM cities';
$sth = ibase_query ($dbh, $stmt);
while ($row = ibase_fetch_object($sth))
	{
	$dict_aa = dict_append_proc ($dict_aa,$row->ID,
			$row->NAME,$row->POPULATION,$row->DATE_MOD);
	}

	$encode = json_encode ($dict_aa);
	ibase_free_result($sth);

	return  $encode;
}

// ----------------------------------------------------------------------
