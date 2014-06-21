#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	maria_read.js
//
//					Sep/17/2013
//
// ---------------------------------------------------------------
console.log ("*** 開始 ***");

var mysql = require('mysql');

var connection = mysql.createClient ({
	host: 'localhost',
	user: 'scott',
	password: 'tiger'
	});

connection.query ('Use city');

connection.query("select * from cities;", function (err, rows)
	{
  	if (err) throw err;
  	console.log (rows.length);
	for (var it in rows)
		{
		var str_out = rows[it].id + "\t" + rows[it].name;
		str_out += "\t" + rows[it].population;
		str_out += "\t" + rows[it].date_mod;
  		console.log (str_out);
		}
console.log ("*** 終了 ***");
	});

connection.end();

console.log ("*** ppp ***");
// ---------------------------------------------------------------
