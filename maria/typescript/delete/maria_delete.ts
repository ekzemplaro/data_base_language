// ---------------------------------------------------------------
//	maria_delete.ts
//
//					May/01/2020
//
// ---------------------------------------------------------------
var mysql = require('mysql')
var sql_manipulate= require ('/var/www/data_base/common/node_common/sql_manipulate')

// ---------------------------------------------------------------
console.log ("*** 開始 ***")

var id_in: string = process.argv[2]

console.log (id_in)

var connection = mysql.createConnection ({
	host: 'localhost',
	user: 'scott',
	password: 'tiger123'
	})

connection.query ('Use city')

var command: string = sql_manipulate.delete_command_gen (id_in)

connection.query(command, function (err, rows)
	{
  	if (err) throw err
	console.log ("*** 終了 ***")
	})

connection.end()

console.log ("*** ppp ***")
// ---------------------------------------------------------------
