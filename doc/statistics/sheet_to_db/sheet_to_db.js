#! /usr/bin/node
// ---------------------------------------------------------------
//	sheet_to_db.js
//
//					Mar/12/2012
//
// ---------------------------------------------------------------
var fs = require("fs");
// ---------------------------------------------------------------
console.log ("*** 開始 ***");

var json_in=process.argv[2];
var json_out=process.argv[3];

console.log (json_in);
console.log (json_out);

var json_str = fs.readFileSync (json_in);

var sheet_aa = JSON.parse (json_str);


lang_db = convert_proc (sheet_aa);

var json_str_new = JSON.stringify(lang_db);
fs.writeFile (json_out,json_str_new);


console.log ("*** 終了 ***");
// ---------------------------------------------------------------
function convert_proc (sheet_aa)
{
	var lang_db = new Object ();
	var ll_aa = 0;

	var keys = sheet_aa.results[0];
	for (var it in keys)
		{
		console.log (it + "\t" + keys[it]);
		}

	for (var it in sheet_aa.results)
		{
		row = sheet_aa.results[it]

		if (row[0] != "")
			{
			var unit_aa = new Object ();

			var lang = row[0];
			var crud = row[1];

			switch (crud)
				{
				case	'jQ C':
					crud = 'jQ_C';
				break;

				case	'jQ U':
					crud = 'jQ_U';
				break;

				case	'jQ D':
					crud = 'jQ_D';
				break;

				}

			var row_new = row_convert_proc (keys,row);

			var nn = 0;
			for (var it in row_new)
				{
				nn += 1;
				}

			if (0 < nn)
				{	
			if (!lang_db[lang])
				{
				lang_db[lang] = new Object ();
				lang_db[lang][crud] = row_new;
			console.log (lang + "\t" + crud + "\t" + nn);
//				console.log (lang + " created");
				}
			else
				{
				lang_db[lang][crud] = row_new;
				}
				}


		ll_aa += 1;
		}
	}

console.log (ll_aa);
	return	lang_db;
}

// ---------------------------------------------------------------
function row_convert_proc (keys,row)
{
	var row_new = new Object ();

	for (var it in row)
		{
		if (row[it])
			{
			var key = keys[it];

			if (key != "")
				{
				row_new[key] = row[it];
				}
			}
		}


	return row_new;
}

// ---------------------------------------------------------------

