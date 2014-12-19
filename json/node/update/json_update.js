#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	json_update.js
//
//					Nov/25/2014
//
// ---------------------------------------------------------------

var fs = require("fs");
var text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate');

//
console.log ("*** 開始 ***");
var filename=process.argv[2];
var key_in=process.argv[3];
var population_in=process.argv[4];

console.log (filename);
console.log (key_in + "\t" + population_in);

if (fs.existsSync(filename))
	{
	var json_str = fs.readFileSync(filename,'utf8');
	var dict_aa = JSON.parse (json_str);

	var dict_bb = text_manipulate.dict_update_proc (dict_aa,key_in,population_in);

	var json_str_out = JSON.stringify(dict_bb);

	fs.writeFile (filename,json_str_out);
	}
else
	{
	console.log ("*** error *** " + filename + " doesn't exist. ***");
	}

console.log ("*** 終了 ***");

// ---------------------------------------------------------------
