// ---------------------------------------------------------------
//	text_manipulate.ts
//
//					Sep/16/2015
//
// ---------------------------------------------------------------
declare function require(x: string): any;

var fs = require("fs");
var text_manipulate=require ("./text_manipulate");
// ---------------------------------------------------------------
exports.text_read_proc = function (file_in: string)
{
	var dict_aa = new Object ();

	var data:string = fs.readFileSync (file_in,'utf8');

	var lines_in: string[] = ("" + data).split ("\n");

	for (var it=0; it< lines_in.length; it++)
		{
		var rr: string[] = lines_in[it].split ("\t");

		if (1 < rr.length)
			{
			dict_aa[rr[0]] = {"name": rr[1],"population": rr[2],
				"date_mod": rr[3]};
			}
		}

	return	dict_aa;
}

// ---------------------------------------------------------------
exports.dict_display_proc = function (dict_aa)
{
	var array_aa = sort_proc (dict_aa);

	for (var it in array_aa)
		{
		var key:string = array_aa[it].key;
		var value = array_aa[it].value;

		if ((key != '_id') && (key != '_rev'))
			{
			var out_str:string = key + "\t";
			out_str += value["name"] + "\t";
			out_str += value["population"] + "\t";
			out_str += value["date_mod"];
			console.log (out_str);
			}
		}	

// console.log ("*** dict_display_proc ppp ***");
}

// ---------------------------------------------------------------
function sort_proc (dict_aa)
{
	var array = new Array();
	for(var it in dict_aa)
		{
		array.push({'key':String (it), 'value':dict_aa[it]});
		}

	array.sort (sort_by_key_proc);

	return array;
}

// ---------------------------------------------------------------
function sort_by_key_proc (left,right)
{
	var aa:string = left.key;
	var bb:string = right.key;

	var rvalue = 0;

	if (aa < bb)
		{
		rvalue = -1;
		}
	else if (aa > bb)
		{
		rvalue = 1;
		}

	return	rvalue;
}

// ---------------------------------------------------------------
exports.text_write_proc = function (file_out:string,dict_aa)
{
	var out_str:string = "";

	var delimit = "\t";

	for (var id in dict_aa)
		{
		if (id)
			{
		out_str += id + delimit;
		out_str += dict_aa[id]["name"] + delimit;
		out_str += dict_aa[id]["population"] + delimit;
		out_str += dict_aa[id]["date_mod"] + "\n";
			}
		}

	fs.writeFile (file_out,out_str, function (err)
		{
		if (err) {
		console.log("Error on write: " + err)
		} else {
		console.log("File written.");
		}
		});
}

// ---------------------------------------------------------------
exports.dict_update_proc = function (dict_in,id_in:string,population_in)
{
	if (dict_in[id_in])
		{
	dict_in[id_in]["population"] = population_in;
	dict_in[id_in]["date_mod"] = text_manipulate.get_current_date_proc ();
		}

	return dict_in;
}

// ---------------------------------------------------------------
exports.dict_append_proc = function (dict_aa,id_in:string,name_in:string,population_in,date_mod_in:string)
{
	var unit_aa:{} = {};
	unit_aa['name'] = name_in;
	unit_aa['population'] = population_in;
	unit_aa['date_mod'] = date_mod_in;

	dict_aa[id_in] = unit_aa;

	return	dict_aa;
}

// ---------------------------------------------------------------
exports.csv_read_proc = function (file_in:string)
{
	var dict_aa = new Object ();

	var data:string = fs.readFileSync (file_in,'utf8');

	var lines_in:string [] = ("" + data).split ("\n");

	for (var it=0; it< lines_in.length; it++)
		{
		var rr:string [] = lines_in[it].split (",");

		if (1 < rr.length)
			{
		dict_aa[rr[0]] = {"name": rr[1],"population": rr[2],
			"date_mod": rr[3]};
			}
		}

	return	dict_aa;
}

// ---------------------------------------------------------------
exports.csv_write_proc = function (file_out,dict_aa)
{
	var out_str:string = "";

	var delimit = ",";

	for (var id in dict_aa)
		{
		if (id)
			{
		out_str += id + delimit;
		out_str += dict_aa[id]["name"] + delimit;
		out_str += dict_aa[id]["population"] + delimit;
		out_str += dict_aa[id]["date_mod"] + "\n";
			}
		}

	fs.writeFile (file_out,out_str, function (err)
		{
		if (err) {
		console.log("Error on write: " + err)
		} else {
		console.log("File written.");
		}
		});
}

// ---------------------------------------------------------------
exports.get_current_date_proc = function ()
{
	var today = new Date ();
	var ddx = (1900 + today.getYear ()) + "-" + (today.getMonth () +1)
	ddx += "-" + today.getDate ()

	return ddx;
}

// ---------------------------------------------------------------
exports.array_to_dict_proc = function (array_aa)
{
	var dict_aa = new Object ();

	for (var it in array_aa)
	{
	var key:string = array_aa[it][0];
	var name:string = array_aa[it][1];
	var population = array_aa[it][2];
	var date_mod = array_aa[it][3];

	dict_aa[key] = {"name": name,"population": population,
			"date_mod": date_mod};
	}

	return	dict_aa;
}

// ---------------------------------------------------------------
