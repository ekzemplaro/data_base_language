// ------------------------------------------------------------------
//	json_load_server.js
//
//						Dec/01/2010
// ------------------------------------------------------------------
function json_load_proc (dbase)
{
	var out_str = "{}";

	switch (dbase)
		{
		case	"json":
			var file_name="/var/tmp/json/cities.json";
			out_str = Jaxer.File.read (file_name);
			break;

		case	"couch":
			var url = "http://cdbd026:5984/city/cities";
			out_str = Jaxer.Web.get (url, {as: "text"});
			break;

		case	"text":
			var file_name="/var/tmp/plain_text/cities.txt";
			var in_str = Jaxer.File.read (file_name);
			var arr_aa = in_str.split ("\n");
			var len_row = arr_aa.length;

			if (arr_aa[len_row - 1].length < 1)
				{
				len_row = len_row - 1;
				}

			var obj_bb = new Array ();

			for (var it=0; it< len_row; it++)
				{
				var arr = arr_aa[it].split ("\t");
				obj_bb[it] = gen_record (arr[0],arr[1],arr[2],arr[3]);
				}

			var obj_aa = {cities: obj_bb};

			out_str = to_json_proc (obj_aa);
			break;

		default:
			out_str = master_gen_proc ();
			break;
		}

	return	out_str;
}

// ------------------------------------------------------------------
function master_gen_proc ()
{
	var obj_bb = new Array ();

	obj_bb[0] = gen_record (1411,'横浜',987560,'1979-2-11');
	obj_bb[1] = gen_record (1412,'川崎',58132,'1979-1-25');
	obj_bb[2] = gen_record (1413,'小田原',78747,'1979-5-02');
	obj_bb[3] = gen_record (1414,'藤沢',38706,'1979-6-22');
	obj_bb[4] = gen_record (1415,'相模原',40756,'1979-8-15');
	obj_bb[5] = gen_record (1416,'厚木',20701,'1979-9-12');
	obj_bb[6] = gen_record (1417,'横須賀',40389,'1979-4-23');
	obj_bb[7] = gen_record (1418,'鎌倉',80347,'1979-8-3');
	obj_bb[8] = gen_record (1419,'逗子',21342,'1979-3-17');

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
