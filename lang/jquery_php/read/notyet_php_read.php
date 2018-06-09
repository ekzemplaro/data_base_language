<?php
// ---------------------------------------------------------------------
//	jquery_php/read/master_php_read.php
//
//					Dec/15/2010
//
// ---------------------------------------------------------------------
$path="/var/www/data_base/common/php_common";
set_include_path (get_include_path() . PATH_SEPARATOR . $path);

//
// ---------------------------------------------------------------------
	$unit_aa =  array ("id" => "1421","name" => "横浜",
			"population" => "97145","date_mod" => "2002-5-12");

	$unit_bb =  array ("id" => "1422","name" => "川崎",
			"population" => "45343","date_mod" => "2002-11-25");

	$unit_cc =  array ("id" => "1423","name" => "小田原",
			"population" => "36342","date_mod" => "2002-1-17");

	$unit_dd =  array ("id" => "1424","name" => "藤沢",
			"population" => "87346","date_mod" => "2002-2-9");

	$unit_ee =  array ("id" => "1425","name" => "相模原",
			"population" => "18348","date_mod" => "2002-7-22");

	$unit_ff =  array ("id" => "1426","name" => "厚木",
			"population" => "69347","date_mod" => "2002-8-4");

	$unit_gg =  array ("id" => "1427","name" => "横須賀",
			"population" => "34725","date_mod" => "2002-9-21");

	$unit_hh =  array ("id" => "1428","name" => "鎌倉",
			"population" => "34592","date_mod" => "2002-3-12");

	$unit_ii =  array ("id" => "1429","name" => "逗子",
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
