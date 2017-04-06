<?php
// --------------------------------------------------------------------
/*
	php_common/text_manipulate.php

					Apr/06/2017

*/
// --------------------------------------------------------------------
function str_to_dict_proc ($str_in)
{
	$dict_aa = array ();

	$lines = explode ("\n",$str_in);

	$count = count($lines);

	for ($it = 0; $it < $count; $it++)
		{
		$line = $lines[$it];

		if (3 < strlen ($line))
			{
			$mtx = explode ("\t",rtrim ($line));
			$dict_unit = array ();
			$dict_unit['name'] = $mtx[1];
			$dict_unit['population'] = $mtx[2];
			$dict_unit['date_mod'] = $mtx[3];
			$dict_aa[$mtx[0]]= $dict_unit;
			}
		}

	return	$dict_aa;
}

// --------------------------------------------------------------------
function text_read_proc ($file_in)
{
	$dict_aa = array ();

	$str_in = file_get_contents($file_in);

	$dict_aa = str_to_dict_proc ($str_in);

	return	$dict_aa;
}

// --------------------------------------------------------------------
function dict_display_proc ($dict_aa)
{
	ksort ($dict_aa);

	foreach ($dict_aa as $key => $value)
		{
		$name = $value["name"];
		$population = $value['population'];
		$date_mod = $value['date_mod'];

		if (($key != '_id') && ($key != '_rev'))
			{
			print "$key\t";
			print "$name\t";
			print "$population\t";
			print "$date_mod\n";
			}
		}
}

// --------------------------------------------------------------------
function text_write_proc ($fname_out,$dict_aa)
{
	$out_str = "";

	foreach ($dict_aa as $key => $value)
		{
		$out_str .= $key . "\t";
		$out_str .= $value['name'] . "\t";
		$out_str .= $value['population'] . "\t";
		$out_str .= $value['date_mod'] . "\n";
		}

	file_write_proc ($out_str,$fname_out);
}

// --------------------------------------------------------------------
function dict_update_proc ($dict_aa,$id_in,$population_in)
{
	if (array_key_exists ($id_in,$dict_aa))
		{
		date_default_timezone_set('Asia/Tokyo');
		$today = date ("Y-m-d");

		$dict_aa[$id_in]['population'] = $population_in;
		$dict_aa[$id_in]['date_mod'] = $today;
		}
	else
		{
		print	"id_in: " . $id_in;
		print	" *** not included ***\n";
		foreach ($dict_aa as $key => $value)
			{
			print	$key;
			print	"\t";
			}
		}

	return	$dict_aa;
}

// --------------------------------------------------------------------
function dict_delete_proc ($dict_aa,$id_in)
{
//	print	"dict_delete_proc $id_in\t";

	if (isset ($dict_aa[$id_in]))
		{
		$dict_unit=$dict_aa[$id_in];

		print	$dict_unit['name'] . "\t";
		print	$dict_unit['date_mod'] . "\n";

		unset ($dict_aa[$id_in]);
		}
	else
		{
		print	"id_in: " . $id_in;
		print	" *** not included ***\n";
		}

	return	$dict_aa;
}

// --------------------------------------------------------------------
function dict_append_proc ($dict_aa,$id,$name,$population,$date_mod)
{
	$dict_unit = array ();
	$dict_unit['name'] = $name;
	$dict_unit['population'] = $population;
	$dict_unit['date_mod'] = $date_mod;
	$dict_aa[(string)$id]= $dict_unit;

	return	$dict_aa;
}

// --------------------------------------------------------------------
function csv_read_proc ($file_in)
{
	$dict_aa = array ();

	$fp = fopen ($file_in,"r");

	while ($line = fgets ($fp))
		{
		$mtx = explode (",",rtrim ($line));
		$dict_unit = array ();
		$dict_unit['name'] = $mtx[1];
		$dict_unit['population'] = $mtx[2];
		$dict_unit['date_mod'] = $mtx[3];
		$dict_aa[$mtx[0]]= $dict_unit;
		}

	fclose ($fp);

	return	$dict_aa;
}

// --------------------------------------------------------------------
function csv_write_proc ($fname_out,$dict_aa)
{
	$fp_out=fopen ($fname_out,"w");

	foreach ($dict_aa as $key => $value)
		{
		$fields = [$key,$value['name'],
			$value['population'],$value['date_mod']];
		fputcsv ($fp_out, $fields);
		}

	fclose ($fp_out);

	chmod ($fname_out,0666);
}

// --------------------------------------------------------------------
?>
