# ---------------------------------------------------------------
#
#	xlsx_manipulate.coffee
#
#					Aug/19/2013
#
# ---------------------------------------------------------------
fs = require('fs')
xlsx = require('node-xlsx')
# ---------------------------------------------------------------
exports.xlsx_read_proc = (xlsx_file) ->
	dict_aa = new Object
	buf = fs.readFileSync (xlsx_file)
	book = xlsx.parse(buf)

	for unit_aa in book.worksheets[0]['data']

		key = unit_aa[0]['value']
		name = unit_aa[1]['value']
		population = unit_aa[2]['value']
		date_mod = unit_aa[3]['value']

		dict_aa[key] = {"name": name,"population": population,"date_mod": date_mod}

	return	dict_aa

# ---------------------------------------------------------------
exports.xlsx_write_proc = (xlsx_file,dict_aa) ->
	data_array = new Array

	for key in dict_aa
		name = dict_aa[key]["name"]
		population = dict_aa[key]["population"]
		date_mod = dict_aa[key]["date_mod"]

		unit_aa = [key,name,population,date_mod]
		data_array.push (unit_aa)

	buffer = xlsx.build({worksheets: [{"name":"mySheetName", "data": data_array}]})

	fs.writeFileSync(xlsx_file, buffer)

# ---------------------------------------------------------------
