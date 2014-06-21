#! /usr/local/bin/node
//
//	master_node_read.js
//
//					Jan/26/2011
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

	obj_bb[0] = gen_record (1421,'横浜',65714,'1988-9-17');
	obj_bb[1] = gen_record (1422,'川崎',24157,'1988-3-15');
	obj_bb[2] = gen_record (1423,'小田原',68741,'1988-10-2');
	obj_bb[3] = gen_record (1424,'藤沢',38704,'1988-6-22');
	obj_bb[4] = gen_record (1425,'相模原',40352,'1988-8-14');
	obj_bb[5] = gen_record (1426,'厚木',60202,'1988-9-12');
	obj_bb[6] = gen_record (1427,'横須賀',30251,'1988-3-21');
	obj_bb[7] = gen_record (1428,'鎌倉',50406,'1988-7-26');
	obj_bb[8] = gen_record (1429,'逗子',25807,'1988-10-2');

	var obj_aa = {cities: obj_bb};

	return	obj_aa;
}

// ---------------------------------------------------------------------
