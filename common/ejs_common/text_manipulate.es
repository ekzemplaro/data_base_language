#! /usr/local/bin/ejs
// ------------------------------------------------------------------
//
//	text_manipulate.es
//
//						Mar/29/2012
//
// ------------------------------------------------------------------
exports.text_read_proc = text_read_proc
exports.dict_display_proc = dict_display_proc
exports.dict_append_proc = dict_append_proc
exports.text_write_proc = text_write_proc
exports.dict_update_proc = dict_update_proc
exports.csv_read_proc = csv_read_proc
exports.csv_write_proc = csv_write_proc
exports.string_write_proc = string_write_proc
// ------------------------------------------------------------------
function file_read_proc (file_in)
{
	var lines_in = readFile(file_in).split("\n")  
	lines_in.pop() // <-- last item is empty... EOF?  
//	var lines_in = getLines(file_in)

	print (lines_in.length)  

	return lines_in
}

// ------------------------------------------------------------------
function text_read_proc (file_in)
{
	var delimit = "\t"

	var dict_aa = text_read_proc_exec (file_in,delimit)

	return	dict_aa
}

// ------------------------------------------------------------------
function text_read_proc_exec (file_in,delimit)
{
	var dict_aa = new Object ()

	var lines_in = file_read_proc (file_in)

	for (var it=0; it< lines_in.length; it++)
		{
		var rr = lines_in[it].split (delimit)

		dict_aa[rr[0]] = {"name": rr[1],"population": rr[2], "date_mod": rr[3]}
		}
	
	return	dict_aa
}

// ------------------------------------------------------------------
function dict_display_proc (dict_aa)
{
//	print	("*** dict_display_proc *** start")

	for (var key in dict_aa)
		{
//		print ("key = " + key)
		if ((key != '_id') && (key != '_rev'))
			{
		var out_str = key + "\t"
		out_str += dict_aa[key]["name"] + "\t"
		out_str += dict_aa[key]["population"] + "\t"
		out_str += dict_aa[key]["date_mod"]
		print (out_str)
			}
		}
}

// ------------------------------------------------------------------
function dict_append_proc (dict_aa,id_in,name_in,population_in,date_mod_in)
{
// print ("*** dict_append_proc ***")
	var unit_aa = {}
	unit_aa['name'] = name_in
	unit_aa['population'] = population_in
	unit_aa['date_mod'] = date_mod_in

	dict_aa[id_in] = unit_aa

	return	dict_aa
}

// ------------------------------------------------------------------
function text_write_proc (file_out,dict_aa)
{
	var delimit = "\t"

	text_write_proc_exec (file_out,dict_aa,delimit)
}

// ------------------------------------------------------------------
function text_write_proc_exec (file_out,dict_aa,delimit)
{
	var out_str = ""

	for (var id in dict_aa)
		{
		out_str += id + delimit
		out_str += dict_aa[id]["name"] + delimit
		out_str += dict_aa[id]["population"] + delimit
		out_str += dict_aa[id]["date_mod"] + "\n"
		}

	string_write_proc (file_out,out_str)
}

// ------------------------------------------------------------------
function string_write_proc (file_out,out_str)
{
	var file = File (file_out,"w")
	file.write (out_str)
	file.close ()
}

// ------------------------------------------------------------------
function dict_update_proc (dict_in,id,population)
{
	dict_in[id]["population"] = population
	dict_in[id]["date_mod"] = get_current_date_proc ()

	return dict_in
}

// ------------------------------------------------------------------
function get_current_date_proc ()
{
	var today = new Date ()
	var ddx = (1900 + today.getFullYear ()) + "-" + (today.getMonth () +1)
	ddx += "-" + today.getDate ()

	return ddx
}

// ------------------------------------------------------------------
function csv_read_proc (file_in)
{
	var delimit = ","

	var dict_aa = text_read_proc_exec (file_in,delimit)

	return	dict_aa
}

// ------------------------------------------------------------------
function csv_write_proc (file_out,dict_aa)
{
	var delimit = ","

	text_write_proc_exec (file_out,dict_aa,delimit)
}
// ------------------------------------------------------------------
