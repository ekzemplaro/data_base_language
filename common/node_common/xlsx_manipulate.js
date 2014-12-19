// ---------------------------------------------------------------
//
//	xlsx_manipulate.js
//
//					Dec/12/2014
//
// ---------------------------------------------------------------
var fs = require('fs');
var xlsx = require('node-xlsx');
// ---------------------------------------------------------------
exports.xlsx_read_proc = function (xlsx_file)
{
	var dict_aa = new Object ();
	var buf = fs.readFileSync (xlsx_file);
	var book = xlsx.parse(buf);

	var data = book[0]['data'];

	for (var it in data)
		{
		var unit_aa = data[it];

		var key = unit_aa[0];
		var name = unit_aa[1];
		var population = unit_aa[2];
		var date_mod = unit_aa[3];

		dict_aa[key] = {"name": name,"population": population,
			"date_mod": date_mod};
		}

	return	dict_aa;
}

// ---------------------------------------------------------------
exports.xlsx_write_proc = function (xlsx_file,dict_aa)
{
	var data_array = new Array ();

	for (var key in dict_aa)
		{
		var name = dict_aa[key]["name"];
		var population = dict_aa[key]["population"];
		var date_mod = dict_aa[key]["date_mod"];

		var unit_aa = [key,name,population,date_mod];
		data_array.push (unit_aa);
		}

	var buffer = xlsx.build([{name: "Cities", data: data_array}]);

	fs.writeFileSync (xlsx_file, buffer);
}

// ---------------------------------------------------------------
