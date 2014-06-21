#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	db_modify.js
//
//					Jun/02/2014
//
// ---------------------------------------------------------------
var fs = require("fs");
var text_manipulate = require('/var/www/data_base/common/node_common/text_manipulate');
// ---------------------------------------------------------------
console.log ("*** 開始 ***");

var filename=process.argv[2];
var file_new=process.argv[3];

console.log (filename);
console.log (file_new);

var json_str = fs.readFileSync (filename,'utf8');

var data_aa = JSON.parse (json_str);

var data_dd = convert_proc (data_aa);


var json_str = JSON.stringify (data_dd);

fs.writeFile (file_new,json_str);

console.log ("*** 終了 ***");
// ---------------------------------------------------------------
function convert_proc (data_aa)
{
	console.log ("*** convert_proc *** aaa ***");

	console.log (data_aa['dbase']['J']['year']);
	console.log (data_aa['dbase']['J']['Create']['Code']);

//	data_aa['dbase']['falcon']['Create']['Code'] = '2010';
	data_aa['dbase']['racket']['Create']['Code'] = '2011';

	data_aa['dbase']['jQuery']['Only']['couch'] = '8';
	data_aa['dbase']['jQuery']['Only']['ftp'] = '8';
	data_aa['dbase']['jQuery']['Only']['wbdv'] = '8';

	data_aa['dbase']['jQuery']['Only']['Text'] = '8';
	data_aa['dbase']['jQuery']['Only']['XML'] = '8';
	data_aa['dbase']['jQuery']['Only']['json'] = '8';

	return	data_aa;
}

// ---------------------------------------------------------------
