// ---------------------------------------------------------------
//
//	xlsx_manipulate.js
//
//					Aug/06/2017
//
// ---------------------------------------------------------------
var fs = require('fs')
var xlsx = require('node-xlsx')
// ---------------------------------------------------------------
exports.xlsx_read_proc = function (xlsx_file)
{
	var dict_aa = new Object ()
	var buf = fs.readFileSync (xlsx_file)
	var book = xlsx.parse(buf)

	var data = book[0]['data']

	data.forEach(function(unit_aa)
		{
		const key = unit_aa[0]
		const name = unit_aa[1]
		const population = unit_aa[2]
		const date_mod = unit_aa[3]

		dict_aa[key] = {"name": name,"population": population,
			"date_mod": date_mod}
		})

	return	dict_aa
}

// ---------------------------------------------------------------
exports.xlsx_write_proc = function (xlsx_file,dict_aa)
{
	var data_array = new Array ()

	for (var key in dict_aa)
		{
		const name = dict_aa[key]["name"]
		const population = dict_aa[key]["population"]
		const date_mod = dict_aa[key]["date_mod"]

		const unit_aa = [key,name,population,date_mod]
		data_array.push (unit_aa)
		}

	var buffer = xlsx.build([{name: "Cities", data: data_array}])

	fs.writeFileSync (xlsx_file, buffer)
}

// ---------------------------------------------------------------
