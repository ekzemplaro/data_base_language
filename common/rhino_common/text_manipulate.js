// ------------------------------------------------------------------
//
//	text_manipulate.js
//
//						Oct/24/2011
//
// ------------------------------------------------------------------
function text_read_proc (file_in)
{
	var dict_aa = new Object ();

	var lines_in = file_read_proc (file_in);

	for (var it=0; it< lines_in.length; it++)
		{
		var rr = String.split (lines_in[it],"\t");

		dict_aa[rr[0]] = {"name": rr[1],"population": rr[2], "date_mod": rr[3]};
		}
	
	return	dict_aa;
}

// ------------------------------------------------------------------
function dict_display_proc (dict_aa)
{
	for (var id in dict_aa)
		{
		if ((id != '_id') && (id != '_rev'))
			{
		var out_str = id + "\t";
		out_str += dict_aa[id]["name"] + "\t";
		out_str += dict_aa[id]["population"] + "\t";
		out_str += dict_aa[id]["date_mod"];
		print (out_str);
			}
		}
	
}

// ---------------------------------------------------------------
function text_write_proc (file_out,dict_aa)
{
	var out_str = "";

	for (var id in dict_aa)
		{
		out_str += id + "\t";
		out_str += dict_aa[id]["name"] + "\t";
		out_str += dict_aa[id]["population"] + "\t";
		out_str += dict_aa[id]["date_mod"] + "\n";
		}

	string_write_proc (file_out,out_str);
}


// ------------------------------------------------------------------
function dict_update_proc (dict_in,id,population)
{
	dict_in[id]["population"] = population;
	dict_in[id]["date_mod"] = get_current_date_proc ();

	return dict_in;
}

// ------------------------------------------------------------------
function get_current_date_proc ()
{
	var today = new Date ();
	var ddx = (1900 + today.getYear ()) + "-" + (today.getMonth () +1)
	ddx += "-" + today.getDate ()

	return ddx;
}

// ------------------------------------------------------------------
function dict_append_proc (dict_aa,id_in,name_in,population_in,date_mod_in)
{
	unit_aa = {};
	unit_aa['name'] = name_in;
	unit_aa['population'] = population_in;
	unit_aa['date_mod'] = date_mod_in;

	dict_aa[id_in] = unit_aa;

	return	dict_aa;
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
function csv_read_proc (file_in)
{
	var dict_aa = new Object ();

	var lines_in = file_read_proc (file_in);

	for (var it=0; it< lines_in.length; it++)
		{
		var rr = String.split (lines_in[it],",");

		dict_aa[rr[0]] = {"name": rr[1],"population": rr[2], "date_mod": rr[3]};
		}
	
	return	dict_aa;
}

// ------------------------------------------------------------------
function csv_write_proc (file_out,dict_aa)
{
	var out_str = "";

	var delimit = ",";

	for (var id in dict_aa)
		{
		out_str += id + delimit;
		out_str += dict_aa[id]["name"] + delimit;
		out_str += dict_aa[id]["population"] + delimit;
		out_str += dict_aa[id]["date_mod"] + "\n";
		}

	string_write_proc (file_out,out_str);
}


// ------------------------------------------------------------------
