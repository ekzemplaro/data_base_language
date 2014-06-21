# -------------------------------------------------------------
#
#	text_manipulate.coffee
#
#					Sep/19/2012
#
# -------------------------------------------------------------
fs = require('fs')
text_manipulate=require("./text_manipulate")
# -------------------------------------------------------------
text_read_proc_exec = (file_in,delimit) ->
	dict_aa = new Object
	data = fs.readFileSync (file_in)

	lines_in = ("" + data).split ("\n")
	for line in lines_in
		rr = line.split (delimit)
		dict_aa[rr[0]] = {"name": rr[1],"population": rr[2],"date_mod": rr[3]}

	return dict_aa
# -------------------------------------------------------------
exports.text_read_proc = (file_in) ->
	delimit = "\t"
	dict_aa = text_read_proc_exec(file_in,delimit)
# -------------------------------------------------------------
exports.dict_display_proc = (dict_aa) ->
	for key,value  of  dict_aa
		if ((1 < key.length) && (key != "_id") && (key != "_rev"))
			out_str = key + "\t" + value.name + "\t" + value.population
			out_str += "\t" + value.date_mod
			console.log out_str
# -------------------------------------------------------------
exports.dict_to_str_proc = (dict_aa,delimit) ->
	out_str = ""
	for key,value  of  dict_aa
		if (1 < key.length)
			out_str += key + delimit + value.name
			out_str += delimit + value.population
			out_str += delimit + value.date_mod + "\n"

	return	out_str
# -------------------------------------------------------------
exports.dict_append_proc = (dict_aa,id_in,name_in,population_in,date_mod_in) ->
	unit_aa = new Object
	unit_aa['name'] = name_in
	unit_aa['population'] = population_in
	unit_aa['date_mod'] = date_mod_in

	dict_aa[id_in] = unit_aa

	return	dict_aa
# -------------------------------------------------------------
exports.get_current_date_proc = ->
	year = (new Date).getFullYear()
	month = (new Date).getMonth() + 1
	day = (new Date).getDate()

	ddx = year + "-" + month + "-" + day
# -------------------------------------------------------------
exports.dict_update_proc = (dict_in,id_in,population_in) ->
	dict_in[id_in]["population"] = population_in
	dict_in[id_in]["date_mod"] = text_manipulate.get_current_date_proc()

	return dict_in
# -------------------------------------------------------------
exports.csv_read_proc = (file_in) ->
	delimit = ","
	dict_aa = text_read_proc_exec(file_in,delimit)
# -------------------------------------------------------------
