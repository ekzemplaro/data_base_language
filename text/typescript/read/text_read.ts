// ---------------------------------------------------------------
//	text_read.ts
//
//					Jul/17/2015
//
// ---------------------------------------------------------------
import fs = require("fs");

// import fs = module("fs");

// var fs = "fs";
// ---------------------------------------------------------------
function text_read_proc (file_in)
{
	var dict_aa = new Object ();

	var data = fs.readFileSync (file_in,'utf8');

	var lines_in = ("" + data).split ("\n");

	for (var it=0; it< lines_in.length; it++)
		{
		var rr = lines_in[it].split ("\t");

		dict_aa[rr[0]] = {"name": rr[1],"population": rr[2],
			"date_mod": rr[3]};
		}

	return	dict_aa;
}
// ---------------------------------------------------------------
function dict_display_proc (dict_aa)
{
	for (var key in dict_aa)
		{
		if (key)
			{
			if ((key != '_id') && (key != '_rev'))
			{
			var out_str = key + "\t";
			out_str += dict_aa[key]["name"] + "\t";
			out_str += dict_aa[key]["population"] + "\t";
			out_str += dict_aa[key]["date_mod"];
			console.log (out_str);
			}
			}
		}	

// console.log ("*** dict_display_proc ppp ***");
}
// ---------------------------------------------------------------
console.log ("*** 開始 ***");
//
var file_in: string = process.argv[2];

console.log (file_in);

var dict_aa = text_read_proc (file_in);

dict_display_proc (dict_aa);

console.log ("*** 終了 ***");
// ---------------------------------------------------------------

