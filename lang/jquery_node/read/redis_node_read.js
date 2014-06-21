#! /usr/local/bin/node
//
//	master_node_read.js
//
//					Dec/20/2010
//
// ---------------------------------------------------------------------
console.log ("Content-type: text/json\n\n");


var data = create_table ();

var json_str = JSON.stringify(data);

console.log (json_str);
//
// ---------------------------------------------------------------------
function gen_record (id_in,name_in,population_in,date_mod_in)
{
	unit_aa = {};
//	unit_aa = new Array ();
	unit_aa['id'] = id_in;
	unit_aa['name'] = name_in;
	unit_aa['population'] = population_in;
	unit_aa['date_mod'] = date_mod_in;

	return	unit_aa;
}

// ---------------------------------------------------------------
function create_table ()
{
	var obj_bb = new Array ();

	obj_bb[0] = gen_record (1421,'横浜',51714,'1988-9-12');
	obj_bb[1] = gen_record (1422,'川崎',40157,'1988-3-15');
	obj_bb[2] = gen_record (1423,'小田原',38741,'1988-10-2');
	obj_bb[3] = gen_record (1424,'藤沢',88704,'1988-6-22');
	obj_bb[4] = gen_record (1425,'相模原',20352,'1988-8-14');
	obj_bb[5] = gen_record (1426,'厚木',5020233,'1988-9-12');

	var obj_aa = {cities: obj_bb};

	return	obj_aa;
}

// ---------------------------------------------------------------------
