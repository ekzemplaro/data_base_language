// ------------------------------------------------------------------
/*
	text_manipulate.kt

					Dec/04/2017
*/
// ------------------------------------------------------------------
import	java.io.File
import	java.util.HashMap

import	java.util.Date
import	java.text.DateFormat
import	java.text.SimpleDateFormat
// ------------------------------------------------------------------
fun str_to_dict_proc (str_in: String,delim:String)
	: HashMap <String, HashMap <String,String>>
{
	var dict_aa = HashMap <String, HashMap <String,String>> ()

	var lines = str_in.split ('\n')

	lines.forEach {
		var cols = it.split (delim)

		var unit_aa = HashMap <String,String> ()
		if (3 < cols.size) {
			var key = cols[0]
			unit_aa["name"] = cols[1]
			unit_aa["population"] = cols[2]
			unit_aa["date_mod"] = cols[3]

			dict_aa[key] = unit_aa
		}
	}

	return	dict_aa
}

// ------------------------------------------------------------------
fun dict_display_proc (dict_aa: HashMap <String, HashMap <String,String>>)
{
	var str_out = dict_to_str_proc (dict_aa,"\t")

	print (str_out)
}

// ------------------------------------------------------------------
fun unit_gen_proc (name:String, population:String, date_mod:String): HashMap <String,String> {
	var unit_aa = HashMap <String,String> ()

	unit_aa["name"] = name
	unit_aa["population"] = population
	unit_aa["date_mod"] = date_mod

	return unit_aa
}

// ------------------------------------------------------------------
fun dict_to_str_proc 
	(dict_aa: HashMap <String, HashMap <String,String>>,delim:String)
		: String
{
//	val keys =  dict_aa.keySet ()
	val keys =  dict_aa.keys

	var str_out = ""

	keys.forEach {
		val key=it
		val unit_aa = dict_aa[key]
		str_out += key
		str_out += delim
		str_out += unit_aa?.get("name")
		str_out += delim
		str_out += unit_aa?.get("population")
		str_out += delim
		str_out += unit_aa?.get("date_mod")
		str_out += "\n"
		}

	return	str_out
}

// ------------------------------------------------------------------
fun get_current_date_proc ():String
{
	var ddx = Date ()
	var dfm = SimpleDateFormat ("yyyy-MM-dd")
	var str_ddx = dfm.format (ddx)

	return	str_ddx
}

// ------------------------------------------------------------------
