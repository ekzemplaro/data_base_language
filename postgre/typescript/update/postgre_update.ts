// ---------------------------------------------------------------
//	postgre_update.ts
//
//					Feb/09/2016
//
// ---------------------------------------------------------------
declare function require(x: string): any;
declare var process:any;

var pg = require('pg');
var sql_manipulate= require ('/var/www/data_base/common/node_common/sql_manipulate');

// ---------------------------------------------------------------
console.log ("*** 開始 ***");
var id_in: string = process.argv[2];
var population_in = process.argv[3];

console.log (id_in + "\t" + population_in);

var str_connect: string = "tcp://scott:tiger@localhost:5432/city";

pg.connect (str_connect,function (error,client)
	{
	var command:string  = sql_manipulate.update_command_gen (id_in,population_in);

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
