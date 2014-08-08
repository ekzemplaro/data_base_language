#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	gen_program_list.js
//
//					Aug/04/2014
//
// ---------------------------------------------------------------
var fs = require("fs");
var text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate');
// ---------------------------------------------------------------
function row_proc (lang,op,row_info)
{
	switch (lang)
		{
		case	"C#":
			lang = "csharp";
			break;
		}

	var operation = "";
	switch (op)
		{
		case	"jQ_C":
			operation = "create";
			break;

		case	"jQ_R":
			operation = "read";
			break;

		case	"jQ_U":
			operation = "update";
			break;

		case	"jQ_D":
			operation = "delete";
			break;

		}

//	var out_str = "";

	for (var db in row_info)
		{
		var data_base = db;

		switch (db)
			{
			case	"sql3":
				data_base = "sqlite3";
				break;

			case	"pstgr":
				data_base = "postgre";
				break;

			case	"fbd":
				data_base = "firebird";
				break;

			case	"drz":
				data_base = "drizzle";
				break;

			case	"xind":
				data_base = "xindice";
				break;

			case	"brkly":
				data_base = "berkeley";
				break;

			case	"mcd":
				data_base = "mcached";
				break;

			case	"mcdb":
				data_base = "mcachedb";
				break;

			case	"wbdv":
				data_base = "webdav";
				break;

			}

		var value = row_info[db];

		if (value != "")
			{
			var out_str = data_base + "_" + lang + "_" + operation;

			out_str = out_str.toLowerCase();

			console.log (out_str);

			}
		}

}

// ---------------------------------------------------------------
function process_langage (data_aa,lang)
{
	var out_str = lang + '\t';

	var nn = 0;
	for (var op in data_aa.dbase[lang])
		{
		if (op.substring (0,3) == 'jQ_')
			{
			out_str += op + '\t';
			nn += 1;
			row_proc (lang,op,data_aa.dbase[lang][op]);
			}
		}

/*
	if (1 < nn)
	{
	console.log (out_str);

	}
*/
}

// ---------------------------------------------------------------
// console.log ("*** 開始 ***");

var filename=process.argv[2];

// console.log (filename);

var json_str = fs.readFileSync (filename,'utf8');

var data_aa = JSON.parse (json_str);

for (var key in data_aa.dbase)
	{
	process_langage (data_aa,key);
	}

// console.log ("*** 終了 ***");
// ---------------------------------------------------------------
