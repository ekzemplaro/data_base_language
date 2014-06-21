#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	postgre_delete.js
//
//					Jul/23/2012
//
// ---------------------------------------------------------------
var pg = require('pg');
var sql_manipulate= require ('/var/www/data_base/common/node_common/sql_manipulate');

// ---------------------------------------------------------------
console.log ("*** 開始 ***");
var id_in = process.argv[2];

console.log (id_in);

var str_connect = "tcp://scott:tiger@localhost:5432/city";

pg.connect (str_connect,function (error,client)
	{
	var command = sql_manipulate.delete_command_gen (id_in);

	console.log (command);

	var query = client.query(command);

/*
	query.on('row',function (row) {
		});
*/

	query.on('end',function () {
		client.end ();
		});

	console.log ("*** 終了 ***");
	});

// ---------------------------------------------------------------
