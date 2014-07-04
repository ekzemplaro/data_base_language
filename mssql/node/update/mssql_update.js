#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	mssql_update.js
//
//					Jul/03/2014
//
// ---------------------------------------------------------------
var mssql = require('mssql'); 
var sql_manipulate= require ('/var/www/data_base/common/node_common/sql_manipulate');
// ---------------------------------------------------------------

console.log ("*** 開始 ***");

var id_in = process.argv[2];
var population_in = process.argv[3];

console.log (id_in + "\t" + population_in);

var config = {
	user: 'sa',
	password: 'scott_tiger',
	server: 'host_mssql',
	database: 'city',
}

var connection = new mssql.Connection (config, function (err)
	{
	var request = new mssql.Request(connection);

	var command = sql_manipulate.update_command_gen (id_in,population_in);


	request.query (command, function(err, rows)
		{
		if (err) throw err;

		console.log ("*** 終了 ***");
		});

	connection.close ();

});

// ---------------------------------------------------------------
