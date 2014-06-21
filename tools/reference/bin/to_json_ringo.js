#! /usr/bin/ringo
// ------------------------------------------------------------------
//
var FILE= require ("fs");

print	("*** 開始 ***");
var args = require('system').args;
var file_in = args[1];
var json_out = args[2];

var lines_in = readFile(file_in).split("\n");
lines_in.pop();

print (lines_in.length);

var tbl_ref = new Object ();


for (var it in lines_in)
	{
	var src = lines_in[it];
	var rr = String.split (src,'/');
	print (rr.length);
	var key = rr[rr.length -1];
		var value = "";
	for (var it=0; it<(rr.length - 1); it++)
		{
		value += rr[it] + "/";
		}
	value += "html/" + key + ".txt";
	print (key);
	tbl_ref[key] = value;
	}

var out_str = JSON.stringify (tbl_ref);


var file = FILE.open (json_out,"w");
	file.write (out_str);
	file.close ();

print (out_str);

print	("*** 終了 ***");
