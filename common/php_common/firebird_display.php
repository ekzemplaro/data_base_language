<?php
/*
	firebird_display.php

					Mar/11/2010
*/
// ----------------------------------------------------------------------
function firebird_display_proc ($dbh)
{
$stmt = 'SELECT * FROM cities';
$sth = ibase_query ($dbh, $stmt);
while ($row = ibase_fetch_object($sth))
	{
	echo $row->ID . "\t";
	echo $row->NAME . "\t";
	echo $row->POPULATION . "\t";
	echo $row->DATE_MOD . "\n";
	}

	print "\n";
 
	ibase_free_result($sth);
}

// ----------------------------------------------------------------------
