#! /usr/bin/node
// ---------------------------------------------------------------
//	maria_update.js
//
//					Sep/14/2018
//
// ---------------------------------------------------------------
var mysql = require('mysql')
var sql_manipulate= require ('/var/www/data_base/common/node_common/sql_manipulate')

// ---------------------------------------------------------------
console.error ("*** 開始 ***")

const id_in = process.argv[2]
const population_in = process.argv[3]

console.log (id_in + "\t" + population_in)

var connection = mysql.createConnection ({
	host: 'localhost',
	user: 'scott',
	password: 'tiger123'
	})

connection.query ('Use city')

const command = sql_manipulate.update_command_gen (id_in,population_in)

connection.query(command, function (err, rows)
	{
  	if (err) throw err
	console.error ("*** 終了 ***")
	})

connection.end()

console.log ("*** ppp ***")
// ---------------------------------------------------------------
