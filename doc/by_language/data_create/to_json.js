#! /usr/bin/nodejs
// ---------------------------------------------------------------
//
//	to_json.js
//
//						Oct/04/2013
//
// ---------------------------------------------------------------
var fs = require("fs");

var dict_aa = new Object ();

console.log ("*** 開始 ***");
//
var file_in = "in01.txt";

var data = fs.readFileSync (file_in);

var lines_in = ("" + data).split ("\n");

var key_before = "";

	for (var it=0; it< lines_in.length; it++)
		{
		var rr = lines_in[it].split ("\t");

		key = rr[0];

		if (key !== key_before)
			{
			console.log (rr[0]);
			dict_aa[key] = new Array ();
			dict_aa[key][0] = rr[1];
			}
		else
			{
			var nn = dict_aa[key].length;

			console.log (key + "\t" + nn);

			dict_aa[key][nn] = rr[1];
			}

		key_before = key;
		}

var json_str = JSON.stringify (dict_aa);

var file_out = "common.json";

fs.writeFile (file_out,json_str, function (err)
{
	if (err) {
		console.log("Error on write: " + err)
		}
	else {
		console.log("File written.");
		}
});

// console.log (json_str);
//
console.log ("*** 終了 ***");

// ---------------------------------------------------------------
