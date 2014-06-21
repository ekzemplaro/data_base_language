<?php
// ---------------------------------------------------------------------
//	jquery_php/read/master_php_read.php
//
//					Jan/24/2011
//
// ---------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

//
// ---------------------------------------------------------------------
	$unit_aa =  array ("id" => "421","name" => "仙台",
			"population" => "97145","date_mod" => "2002-5-12");

	$unit_bb =  array ("id" => "422","name" => "石巻",
			"population" => "45343","date_mod" => "2002-11-25");

	$unit_cc =  array ("id" => "423","name" => "塩竈",
			"population" => "36342","date_mod" => "2002-1-17");

	$unit_dd =  array ("id" => "424","name" => "気仙沼",
			"population" => "87346","date_mod" => "2002-2-9");

	$unit_ee =  array ("id" => "425","name" => "白石",
			"population" => "18348","date_mod" => "2002-7-22");

	$unit_ff =  array ("id" => "426","name" => "名取",
			"population" => "69347","date_mod" => "2002-8-4");

	$unit_gg =  array ("id" => "427","name" => "多賀城",
			"population" => "34725","date_mod" => "2002-9-21");

	$unit_hh =  array ("id" => "428","name" => "岩沼",
			"population" => "34592","date_mod" => "2002-3-12");

	$unit_ii =  array ("id" => "429","name" => "大崎",
			"population" => "72581","date_mod" => "2002-7-18");


	$arr = array ();
	array_push ($arr,$unit_aa);
	array_push ($arr,$unit_bb);
	array_push ($arr,$unit_cc);
	array_push ($arr,$unit_dd);
	array_push ($arr,$unit_ee);
	array_push ($arr,$unit_ff);
	array_push ($arr,$unit_gg);
	array_push ($arr,$unit_hh);
	array_push ($arr,$unit_ii);

	$arr_cities = array ("cities" => $arr);
	$encode = json_encode ($arr_cities);

// echo "Content-type: text/json";
// echo "";
// echo "";

echo $encode;
// ---------------------------------------------------------------------
?>	
