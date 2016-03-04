// ---------------------------------------------------------------
//	mssql_read.ts
//
//					Feb/09/2016
//
// ---------------------------------------------------------------
declare function require(x: string): any;
declare var process:any;
var mssql = require('mssql'); 

console.log ("*** 開始 ***");

var config = {
	user: 'sa',
	password: 'Tiger123',
	server: 'host_mssql\\EG',
	database: 'city',
}

var connection = new mssql.Connection (config, function (err)
	{
	var request = new mssql.Request(connection);

	var str_sql: string = "select * from cities";

	request.query (str_sql, function(err, rows)
		{
		for (var it in rows)
			{
			var str_out: string = rows[it].id + "\t";
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
