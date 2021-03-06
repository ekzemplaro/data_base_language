// ---------------------------------------------------------------
//	node_common/text_manipulate.js
//
//					Feb/09/2021
//
// ---------------------------------------------------------------
var fs = require("fs")
var text_manipulate=require ("./text_manipulate")
// ---------------------------------------------------------------
exports.text_read_proc = function (file_in)
{
	var dict_aa = new Object ()

	const data = fs.readFileSync (file_in,'utf8')

	const lines_in = ("" + data).split ("\n")

	lines_in.forEach (function(line)
		{
		const rr = line.split ("\t")

		dict_aa[rr[0]] = {"name": rr[1],"population": rr[2],
			"date_mod": rr[3]}
		})

	return	dict_aa
}

// ---------------------------------------------------------------
exports.dict_display_proc = function (dict_aa)
{
	const array_aa = text_manipulate.sort_key_proc (dict_aa)

	array_aa.forEach (function(unit_aa,index)
		{
		const key = unit_aa.key
		const value = unit_aa.value

		if ((key != '_id') && (key != '_rev')
			&& (1 < key.length))
			{
			var out_str = key + "\t"
			out_str += value["name"] + "\t"
			out_str += value["population"] + "\t"
			out_str += value["date_mod"]
			console.log (out_str)
			}
		})	
}

// ---------------------------------------------------------------
exports.sort_key_proc = function (dict_aa)
{
	var array = new Array()

	for(var it in dict_aa)
		{
		array.push({'key':String (it), 'value':dict_aa[it]})
		}

	array.sort (compare_by_key_proc)

	return array
}

// ---------------------------------------------------------------
function compare_by_key_proc (left,right)
{
	var aa = left.key
	var bb = right.key

	var rvalue = 0

	if (aa < bb)
		{
		rvalue = -1
		}
	else if (aa > bb)
		{
		rvalue = 1
		}

	return	rvalue
}

// ---------------------------------------------------------------
exports.text_write_proc = function (file_out,dict_aa)
{
	var out_str = ""

	const delimit = "\t"

	for (var id in dict_aa)
		{
		if (id)
			{
		out_str += id + delimit
		out_str += dict_aa[id]["name"] + delimit
		out_str += dict_aa[id]["population"] + delimit
		out_str += dict_aa[id]["date_mod"] + "\n"
			}
		}

	fs.writeFile (file_out,out_str, function (err)
		{
		if (err) {
		console.log("Error on write: " + err)
		} else {
		console.log("File written.")
		}
		})
}

// ---------------------------------------------------------------
exports.dict_update_proc = function (dict_in,id_in,population_in)
{
	if (dict_in[id_in])
		{
	dict_in[id_in]["population"] = population_in
	dict_in[id_in]["date_mod"] = text_manipulate.get_current_date_proc ()
		}

	return dict_in
}

// ---------------------------------------------------------------
exports.dict_append_proc = function (dict_aa,id_in,name_in,population_in,date_mod_in)
{
	unit_aa = {}
	unit_aa['name'] = name_in
	unit_aa['population'] = population_in
	unit_aa['date_mod'] = date_mod_in

	dict_aa[id_in] = unit_aa

	return	dict_aa
}

// ---------------------------------------------------------------
exports.csv_read_proc = function (file_in)
{
	var dict_aa = new Object ()

	const data = fs.readFileSync (file_in,'utf8')

	const lines_in = ("" + data).split ("\n")

	lines_in.forEach(function(line)
		{
		const rr = line.split (",")

		dict_aa[rr[0]] = {"name": rr[1],"population": rr[2],
			"date_mod": rr[3]}
		})

	return	dict_aa
}

// ---------------------------------------------------------------
exports.csv_write_proc = function (file_out,dict_aa)
{
	var out_str = ""

	const delimit = ","

	for (var id in dict_aa)
		{
		if (id)
			{
		out_str += id + delimit
		out_str += dict_aa[id]["name"] + delimit
		out_str += dict_aa[id]["population"] + delimit
		out_str += dict_aa[id]["date_mod"] + "\n"
			}
		}

	fs.writeFile (file_out,out_str, function (err)
		{
		if (err)
			{
			console.log("Error on write: " + err)
			}
		else
			{
			console.log("File written.")
			}
		})
}

// ---------------------------------------------------------------
exports.get_current_date_proc = function ()
{
	const today = new Date ()
	var ddx = (1900 + today.getFullYear ()) + "-" + (today.getMonth () +1)
	ddx += "-" + today.getDate ()

	return ddx
}

// ---------------------------------------------------------------
exports.array_to_dict_proc = function (array_aa)
{
	var dict_aa = new Object ()

	for (var it in array_aa)
		{
		const key = array_aa[it][0]
		const name = array_aa[it][1]
		const population = array_aa[it][2]
		const date_mod = array_aa[it][3]

		dict_aa[key] = {"name": name,"population": population,
			"date_mod": date_mod}
	}

	return	dict_aa
}

// ---------------------------------------------------------------
