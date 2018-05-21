#! /usr/bin/node
// ------------------------------------------------------------------
//	pick_up.js
//
//						Jul/04/2011
// ------------------------------------------------------------------
//
var fs= require ("fs");

// console.log	("*** 開始 ***");
var common_in = process.argv[2];
var target_in = process.argv[3];

var data_in = "" + fs.readFileSync (common_in);
var data_target = "" + fs.readFileSync (target_in);

var lines_common = data_in.split ("\n");


var tbl_ref = new Object ();


for (var it in lines_common)
	{
	var src = lines_common[it];
	if (0 < src.length)
	{
//	console.log (src);

	var rr = src.split ('.');

	var nn = data_target.search (rr[0])

//	console.log (nn)

	if (0 <= nn)
		{
		console.log (rr[0]);
		}
	}
	}

//var out_str = JSON.stringify (tbl_ref);

//fs.writeFile (json_out,out_str);

// console.log (out_str);

// console.log	("*** 終了 ***");
// ------------------------------------------------------------------
