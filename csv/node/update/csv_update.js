#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	text_update.js
//
//					Jun/29/2015
//
// ---------------------------------------------------------------
var fs = require("fs");
var csv = require('csv');
var text_manipulate=require ("/var/www/data_base/common/node_common/text_manipulate");

// ---------------------------------------------------------------
console.log ("*** 開始 ***");
//


var file_csv=process.argv[2];
var key_in=process.argv[3];
var population_in=process.argv[4];

console.log (file_csv);
console.log (key_in + "\t" + population_in);

fs.readFile(file_csv, function(err, buf)
	{
	csv.parse(buf.toString(),{comment:'#'}, function(err, array_aa)
		{
		if (err != null)
			{
			console.log ("*** error ***");
			console.log (err);
			}

		var dict_aa = text_manipulate.array_to_dict_proc (array_aa);


		var dict_bb = text_manipulate.dict_update_proc (dict_aa,key_in,population_in);


		text_manipulate.csv_write_proc (file_csv,dict_bb);
		console.log ("*** 終了 ***");
		});
	});


// ---------------------------------------------------------------
