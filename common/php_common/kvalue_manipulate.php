<?php
// ------------------------------------------------------------------
//	kvalue_manipulate.php
//
//					Oct/07/2014
//
// ------------------------------------------------------------------
function kvalue_update_proc ($mem,$id,$population)
{
	$json_str = $mem->get ($id);
	$root=json_decode ($json_str);
	$root->population = $population;

	date_default_timezone_set('Asia/Tokyo');
	$today = date ("Y-m-d H:i:s");
	$root->date_mod = $today;
#
	$json_new = json_encode ($root);
	$mem->set ($id,$json_new);
}

// ------------------------------------------------------------------
function kvalue_delete_proc ($mem,$id)
{
	$mem->delete ($id);
}

// ------------------------------------------------------------------
function kvalue_display_proc ($mem,$id)
{
	$json_str=$mem->get($id);

	if ($json_str != null)
                {
		$root=json_decode ($json_str);
		print $id . "\t";
		print $root->name . "\t";
		print $root->population . "\t";
		print $root->date_mod . "\n";
		}
}

// ------------------------------------------------------------------
function kvalue_insert_proc ($mem,$id,$name_in,$population_in,$date_mod_in)
{
$arry_unit = array (
		"name"  => $name_in,
		"population" => $population_in,
		"date_mod" => $date_mod_in);
//
//var_dump ($arry_unit);
//
//
$json_new = json_encode ($arry_unit);
print $json_new . "\n";
$mem->set ($id,$json_new);
}

// ------------------------------------------------------------------
function kvalue_to_dict_proc ($mem,$keys)
{
	$dict_aa = array ();

	asort ($keys);

	foreach ($keys as $key)
		{
		$json_str=$mem->get($key);

	if ($json_str != null)
                {
		$city=json_decode ($json_str);

		$dict_unit = array ();
		$dict_unit['name'] = $city->name;
		$dict_unit['population'] = $city->population;
		$dict_unit['date_mod'] = $city->date_mod;
		$dict_aa[$key]= $dict_unit;
		}
	}


	return	$dict_aa;
}

// ------------------------------------------------------------------
?>
