#! /usr/local/bin/node
// ---------------------------------------------------------------
//	json_convert.js
//
//					Jul/25/2011
//
// ---------------------------------------------------------------
var fs = require("fs");
var text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate');
// ---------------------------------------------------------------
console.log ("*** 開始 ***");

var filename=process.argv[2];

console.log (filename);

var json_str = fs.readFileSync (filename);

var dict_aa = JSON.parse (json_str);

var ll_aa = 0;
for (var it in dict_aa)
	{
	ll_aa += 1;
	}
console.log (ll_aa);

var dict_bb = convert_proc (dict_aa);

var ll_bb = 0;
for (var it in dict_bb)
	{
	ll_bb += 1;
	}
console.log (ll_bb);


console.log ("*** display ppp ***");

text_manipulate.dict_display_proc (dict_bb);

console.log ("*** display qqq ***");


var json_str_new = JSON.stringify(dict_bb);

fs.writeFile (filename,json_str_new);


console.log ("*** 終了 ***");
// ---------------------------------------------------------------
function convert_proc (dict_aa)
{
	var dict_bb = new Object ();

	for (var key in dict_aa)
		{
		var name_aa = dict_aa[key]["name"];
		var population_aa = dict_aa[key]["population"];
		var date_mod_aa = dict_aa[key]["date_mod"];

		var key_new = key;

		var llx = key.length;

		if (llx === 3)
			{
			key_new = "0" + key_new;
			}

		key_new = "t" + key_new;

		dict_bb = text_manipulate.dict_append_proc
				(dict_bb,key_new,name_aa,population_aa,date_mod_aa);
console.log (llx + "\t" + key + " -> " + key_new);
		}

	return	dict_bb;
}

// ---------------------------------------------------------------

