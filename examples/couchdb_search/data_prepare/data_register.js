#! /usr/bin/nodejs
// --------------------------------------------------------------
//
//	data_register.js
//
//					Nov/26/2013
//
//
// --------------------------------------------------------------
var fs = require("fs");
var cradle = require ('cradle');

console.log ("*** 開始 ***");

var url_base = "http://localhost:5984/librivox/";

var file_in=process.argv[2];

var json_str = fs.readFileSync (file_in,'utf8');

var data_aa = JSON.parse (json_str);

var db_name = 'librivox';

var db = new (cradle.Connection)('http://localhost',5984).database (db_name);

var count = 0;
for (var key in data_aa)
	{
	console.log (key + "\t" + data_aa[key].title);

	db.put (key,data_aa[key],function (err,res){
		console.log (res);
		});

	count++;

/*
	if (10 < count)
		{
		break;
		}
*/
	}

console.log (count);
console.log ("*** 終了 ***");
 
// --------------------------------------------------------------
