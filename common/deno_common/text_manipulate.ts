// ---------------------------------------------------------------
//	text_manipulate.ts
//
//					May/15/2020
//
// ---------------------------------------------------------------
import { readFileStrSync } from "https://deno.land/std/fs/read_file_str.ts"
import { writeFileStrSync } from "https://deno.land/std/fs/write_file_str.ts"
// ---------------------------------------------------------------
function sort_by_key_proc(left: {[key: string]: any},right: {[key: string]: any})
{
	const aa:string = left.key
	const bb:string = right.key

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
function sort_proc (dict_aa: {[key: string]: any})
{
	var array = new Array()
	for(var it in dict_aa)
		{
		array.push({'key':String (it), 'value':dict_aa[it]})
		}

	array.sort (sort_by_key_proc)

	return array
}

// ---------------------------------------------------------------
export function dict_display_proc(dict_aa: {[key: string]: any})
{
	var array_aa = sort_proc (dict_aa)

	for (var it in array_aa)
		{
		var key:string = array_aa[it].key
		var value = array_aa[it].value

		var out_str:string = key + "\t"
		out_str += value["name"] + "\t"
		out_str += value["population"] + "\t"
		out_str += value["date_mod"]
		console.log (out_str)
		}	
}

// ---------------------------------------------------------------
export function text_read_proc (file_in: string)
{
	var dict_aa : {[key: string]: any} = new Object()

	var data:string = readFileStrSync (file_in,{ encoding: "utf8" })

	var lines_in: string[] = ("" + data).split ("\n")

	for (var it=0; it< lines_in.length; it++)
		{
		var rr: string[] = lines_in[it].split ("\t")

		if (1 < rr.length)
			{
			dict_aa[rr[0]] = {"name": rr[1],"population": rr[2],
				"date_mod": rr[3]}
			}
		}

	return	dict_aa
}

// ---------------------------------------------------------------
export function text_write_proc (file_out:string,dict_aa: {[key: string]: any})
{
	var out_str:string = ""

	const delimit = "\t"

	for (var id in dict_aa)
		{
		out_str += id + delimit
		out_str += dict_aa[id]["name"] + delimit
		out_str += dict_aa[id]["population"] + delimit
		out_str += dict_aa[id]["date_mod"] + "\n"
		}

	writeFileStrSync (file_out,out_str)
}
// ---------------------------------------------------------------
export function dict_append_proc (dict_aa: {[key: string]: any},id_in:string,name_in:string,population_in:number,date_mod_in:string)
{
	var unit_aa:{[key: string]: any} = new Object()
	unit_aa['name'] = name_in
	unit_aa['population'] = population_in
	unit_aa['date_mod'] = date_mod_in

	dict_aa[id_in] = unit_aa

	return	dict_aa
}

// ---------------------------------------------------------------
export function dict_update_proc (dict_in: {[key: string]: any},id_in:string,population_in: number)
{
	if (dict_in[id_in])
		{
	dict_in[id_in]["population"] = population_in
	dict_in[id_in]["date_mod"] = get_current_date_proc ()
		}

	return dict_in
}

// ---------------------------------------------------------------
function get_current_date_proc ()
{
	var today = new Date ()
	var ddx = (1900 + today.getFullYear ()) + "-" + (today.getMonth () +1)
	ddx += "-" + today.getDate ()

	return ddx
}
// ---------------------------------------------------------------
