#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	db_modify.js
//
//					Mar/04/2015
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

/*
	console.log (data_aa['dbase']['J']['year']);
	console.log (data_aa['dbase']['J']['Create']['Code']);

	data_aa['dbase']['julia']['Create']['Code'] = '2013';
*/
	data_aa['dbase']['kotlin']['Create']['Code'] = '1958';
	data_aa['dbase']['vb']['Create']['Code'] = '1959';
	data_aa['dbase']['elixir']['Create']['Code'] = '1910';
/*
	data_aa['dbase']['jQuery']['Only']['couch'] = '8';
	data_aa['dbase']['jQuery']['Only']['ftp'] = '8';
	data_aa['dbase']['jQuery']['Only']['wbdv'] = '8';
*/
/*
	data_aa['dbase']['jQuery']['Only']['Text'] = '9';
	data_aa['dbase']['jQuery']['Only']['XML'] = '9';
	data_aa['dbase']['jQuery']['Only']['json'] = '9';
*/
	return	data_aa;
}

// ---------------------------------------------------------------
