#! /usr/bin/nodejs
// ---------------------------------------------------------------
//	mssql_read.js
//
//					Jul/03/2014
//
// ---------------------------------------------------------------
var mssql = require('mssql'); 

console.log ("*** 開始 ***");

var config = {
	user: 'sa',
	password: 'scott_tiger',
	server: 'host_mssql',
	database: 'city',
}

var connection = new mssql.Connection (config, function (err)
	{
	var request = new mssql.Request(connection);

	var str_sql = "select * from cities";

	request.query (str_sql, function(err, rows)
		{
		for (var it in rows)
			{
			var str_out = rows[it].id + "\t";
			str_out += rows[it].name + "\t";
			str_out += rows[it].population + "\t";
			str_out += rows[it].date_mod;
			console.log (str_out);
			}

		console.log ("*** 終了 ***");
		});

	connection.close ();

});

// ---------------------------------------------------------------
