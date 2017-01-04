#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	add_lang.js
//
//					Jul/24/2015
//
// ---------------------------------------------------------------
var fs = require("fs");
var text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate');
// ---------------------------------------------------------------
console.log ("*** 開始 ***");

var filename=process.argv[2];
var lang_new=process.argv[3];
var file_new=process.argv[4];

console.log (filename);
console.log (lang_new);
console.log (file_new);

var json_str = fs.readFileSync (filename,'utf8');

var data_aa = JSON.parse (json_str);

var data_lang = new Object ();
var row_single = new Object ();

for (var db in data_aa.info)
	{
	row_single[db] = '';
	}

data_lang['year'] = '1911';
data_lang['Create'] = row_single;
data_lang['Read'] = row_single;
data_lang['Update'] = row_single;
data_lang['Delete'] = row_single;

data_aa.dbase[lang_new] = data_lang;

console.log (data_aa.dbase.Bash.year);

var json_str = JSON.stringify(data_aa);

fs.writeFile (file_new,json_str);

console.log ("*** 終了 ***");
// ---------------------------------------------------------------
