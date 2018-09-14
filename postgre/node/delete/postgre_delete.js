#! /usr/bin/node
// ---------------------------------------------------------------
//	postgre_delete.js
//
//					Sep/12/2018
//
// ---------------------------------------------------------------
var pg = require('pg');
var sql_manipulate= require ('/var/www/data_base/common/node_common/sql_manipulate');

// ---------------------------------------------------------------
console.error ("*** 開始 ***");
var id_in = process.argv[2];

console.error (id_in);

const { Client } = require('pg')

const client = new Client({
	user: 'scott',
	host: 'localhost',
	database: 'city',
	password: 'tiger123',
	port: 5432,
})

client.connect()

const command = sql_manipulate.delete_command_gen (id_in);

console.error (command);

const query = {
	text: command,
}

client.query(query)
	.then(res => {
		client.end()
		console.error ("*** 終了 ***")
	})
	.catch(e => console.error(e.stack))

// ---------------------------------------------------------------
