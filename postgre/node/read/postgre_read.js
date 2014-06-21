#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	postgre_read.js
//
//					May/21/2014
//
// ---------------------------------------------------------------
console.log ("*** 開始 ***");

var pg = require('pg');

var str_connect = "tcp://scott:tiger@localhost:5432/city";

pg.connect (str_connect,function (error,client)
	{

	var query = client.query("select * from cities;");

	query.on('row',function (row) {
		var str_out = row.id + '\t';
		str_out += row.name + '\t';
		str_out += row.population + '\t';
		str_out += row.date_mod;
		console.log (str_out);
		});

	query.on('end',function () {
		client.end ();
		console.log ("*** 終了 ***");
		});

	});

// ---------------------------------------------------------------
