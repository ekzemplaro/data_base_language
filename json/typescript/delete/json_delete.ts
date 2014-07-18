// ---------------------------------------------------------------
//	json_delete.ts
//
//					Jul/15/2014
//
// ---------------------------------------------------------------
//
var fs = require("fs");

console.log ("*** 開始 ***");
var filename:string =process.argv[2];
var key_in:string =process.argv[3];

console.log (filename);
console.log (key_in)

var json_str:string = fs.readFileSync(filename,'utf8');
var dict_aa = JSON.parse (json_str);

if (key_in in dict_aa)
	{ 
	delete dict_aa[key_in];

	var json_str_out:string = JSON.stringify(dict_aa);

	fs.writeFile (filename,json_str_out);
	}

console.log ("*** 終了 ***");

// ---------------------------------------------------------------
