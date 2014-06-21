#! /usr/bin/nodejs
//
//	sqlite3_read.js
//
//					Feb/05/2013
//
// ------------------------------------------------------------
var sqlite3 = require("sqlite3");

console.log ("*** 開始 ***");

var file_sqlite3 = process.argv[2];

console.log (file_sqlite3);

var db = new sqlite3.Database (file_sqlite3);

db.each ("select id,name,population,date_mod from cities",function (err,row)
	{
	var str_out = row.id + "\t" + row.name + "\t" + row.population;
	str_out += "\t" + row.date_mod;
	console.log (str_out);
	});

db.close ();

console.log ("*** 終了 ***");
// ------------------------------------------------------------
