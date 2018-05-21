#! /usr/bin/node
// ------------------------------------------------------------------
//	to_json.js
//
//					May/21/2018
// ------------------------------------------------------------------
//
var fs= require ("fs")

// console.log	("*** 開始 ***")
var file_in = process.argv[2]
var json_out = process.argv[3]

var data_in = "" + fs.readFileSync (file_in)

var lines_in = data_in.split ("\n")


var tbl_ref = new Object ()


for (var it in lines_in)
	{
	var src = lines_in[it]
	if (0 < src.length)
	{ 
	var rr = src.split ('/')
	var key = rr[rr.length -1]
		var value = ""
	for (var it=0; it<(rr.length - 1); it++)
		{
		value += rr[it] + "/"
		}
	value += "html/" + key + ".txt"
	tbl_ref[key] = value
	}
	}

var out_str = JSON.stringify (tbl_ref)

fs.writeFile (json_out,out_str,function(err)
	{
	})

// console.log (out_str)

// console.log	("*** 終了 ***")
// ------------------------------------------------------------------
