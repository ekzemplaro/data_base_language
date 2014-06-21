#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	add_db.js
//
//					Mar/07/2013
//
// ---------------------------------------------------------------
var fs = require("fs");
var text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate');
// ---------------------------------------------------------------
console.log ("*** 開始 ***");

var filename=process.argv[2];
var file_new=process.argv[3];
var db_new=process.argv[4];
var db_pref=process.argv[5];
var db_code=process.argv[6];

console.log (filename);
console.log (file_new);
console.log (db_new);
console.log (db_pref);
console.log (db_code);

var json_str = fs.readFileSync (filename,'utf8');

var data_aa = JSON.parse (json_str);

var data_bb = convert_proc (data_aa,db_new,db_pref,db_code);
/*
var data_lang = new Object ();
var row_single = new Object ();


for (var db in data_aa.info)
	{
	row_single[db] = '';
	}

data_lang['year'] = '1955';
data_lang['Create'] = row_single;
data_lang['Read'] = row_single;
data_lang['Update'] = row_single;
data_lang['Delete'] = row_single;

data_aa.dbase[lang_new] = data_lang;

console.log (data_aa.dbase.Bash.year);
*/

var json_str = JSON.stringify (data_bb);

fs.writeFile (file_new,json_str);

console.log ("*** 終了 ***");
// ---------------------------------------------------------------
function convert_proc (data_aa,db_new,db_pref,db_code)
{
	console.log ("*** convert_proc *** aaa ***");
	data_aa['info'][db_new] = new Object ();
	data_aa['info'][db_new]['pref'] = db_pref;
	data_aa['info'][db_new]['code'] = db_code;

	for (var lang in data_aa.dbase)
		{
//		console.log (lang);
		for (var crud in data_aa.dbase[lang])
			{
			if (crud != 'year')
				{
				data_aa.dbase[lang][crud][db_new] = "";
				}
			}
		}

	console.log ("*** convert_proc *** zzz ***");

	return	data_aa;
}

// ---------------------------------------------------------------
