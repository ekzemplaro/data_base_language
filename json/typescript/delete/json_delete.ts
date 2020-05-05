// ---------------------------------------------------------------
//	json_delete.ts
//
//					May/05/2020
//
// ---------------------------------------------------------------
var fs = require("fs");

console.log ("*** 開始 ***");
const filename:string =process.argv[2];
const key_in:string =process.argv[3];

console.log (filename);
console.log (key_in)

const json_str:string = fs.readFileSync(filename,'utf8');
var dict_aa:Object = JSON.parse (json_str);

if (key_in in dict_aa)
	{ 
	delete dict_aa[key_in];

	const json_str_out:string = JSON.stringify(dict_aa);

	fs.writeFile (filename,json_str_out, function (err)
		{
		if (err) {
		console.log("Error on write: " + err)
		} else {
		console.log("File written.");
		}
		});
	}

console.log ("*** 終了 ***");

// ---------------------------------------------------------------
