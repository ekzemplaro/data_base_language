// ------------------------------------------------------------------
//	master_jaxer_read.js
//
//						Jan/26/2011
// ------------------------------------------------------------------
function master_gen_proc ()
{
	var obj_bb = new Array ();

	obj_bb[0] = gen_record (1411,'仙台',987560,'1979-2-11');
	obj_bb[1] = gen_record (1412,'石巻',58132,'1979-1-25');
	obj_bb[2] = gen_record (1413,'塩竈',78747,'1979-5-02');
	obj_bb[3] = gen_record (1414,'気仙沼',38706,'1979-6-22');
	obj_bb[4] = gen_record (1415,'白石',40756,'1979-8-15');
	obj_bb[5] = gen_record (1416,'名取',20701,'1979-9-12');
	obj_bb[6] = gen_record (1417,'多賀城',40389,'1979-4-23');
	obj_bb[7] = gen_record (1418,'岩沼',80347,'1979-8-3');
	obj_bb[8] = gen_record (1419,'大崎',21342,'1979-3-17');

	var obj_aa = {cities: obj_bb};
	var str_aa = to_json_proc (obj_aa);

	return	str_aa
}

// ------------------------------------------------------------------
function to_json_proc (obj_aa)
{
	var str_aa = '{"cities":[';
	var lenx = obj_aa['cities'].length;

	for (var it=0; it< (lenx - 1); it++)
		{
		str_aa += convert_one_row (obj_aa['cities'][it]);
		str_aa += ',';
		}

	str_aa += convert_one_row (obj_aa['cities'][lenx - 1]);
	str_aa += ']}';

	return	str_aa
}

// ------------------------------------------------------------------
function gen_record (id_in,name_in,population_in,date_mod_in)
{
	unit_aa = {};
	unit_aa['id'] = id_in;
	unit_aa['name'] = name_in;
	unit_aa['population'] = population_in;
	unit_aa['date_mod'] = date_mod_in;

	return	unit_aa;
}

// ------------------------------------------------------------------
function convert_one_row (obj_in)
{

	str_aa= '{"id": ' + obj_in['id'];
	str_aa += ',"name": "' + obj_in['name'] +'"';
	str_aa += ',"population": ' + obj_in['population'];
	str_aa += ',"date_mod": "' + obj_in['date_mod'] + '"}';

	return	str_aa;
}

// ------------------------------------------------------------------
